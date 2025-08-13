---
title: Setting up GCP project for Github actions + Terraform
description: This process sets up your Google Cloud project for secure Terraform automation via GitHub Actions, using Workload Identity Federation (WIF) for authentication, and a Google Cloud Storage (GCS) bucket for storing Terraform state.
date: 2025-08-08
tags: 
categories:
  - zettelkasten
draft: false
---
## Steps

1. **Create a GCS Bucket for Terraform State**
    - A dedicated bucket is created to securely store Terraform state files.
2. **Set Up Workload Identity Federation (WIF)**
    - A Workload Identity Pool and OIDC Provider are created to allow GitHub Actions to authenticate to GCP without long-lived service account keys.
3. **Assign IAM Permissions**
    - The WIF principal (your GitHub user or org) is granted permissions to manage objects in the Terraform state bucket.
4. **Get the WIF Provider Resource Name**
    - The script prints the unique resource name for your WIF provider, which you’ll use in your GitHub Actions workflow or Terraform backend configuration.

## Usage

Script:

```sh
#!/bin/bash
set -e

# --- VARIABLES (edit these) ---
PROJECT_ID="your-project-id"
PROJECT_NUMBER="your-project-number"
REPO_OWNER="your-github-username"
# --- These variables most likely do not need edit"
BUCKET_NAME="tf-state-$PROJECT_ID"
POOL_NAME="github"
PROVIDER_NAME="github-actions"

# --- DEFINE ROLES TO ASSIGN TO WIF PRINCIPAL ---
WIF_ROLES=(
  "roles/storage.objectAdmin"          # Full access to GCS objects (Terraform state)
  "roles/artifactregistry.admin"
  "roles/run.admin"
  "roles/compute.networkAdmin"
  "roles/editor"
  "roles/pubsub.admin"
  "roles/secretmanager.admin"
  "roles/iam.serviceAccountUser"
  "roles/storage.admin"
  "roles/storage.objectViewer"
)

# --- CREATE RESOURCES ---
echo "Creating GCS bucket for Terraform state..."
gcloud storage buckets create gs://$BUCKET_NAME --project=$PROJECT_ID --location=EU

echo "Creating Workload Identity Pool..."
gcloud iam workload-identity-pools create "$POOL_NAME" \
  --project="$PROJECT_ID" \
  --location="global" \
  --display-name="GitHub Actions Pool"

echo "Creating Workload Identity Provider..."
gcloud iam workload-identity-pools providers create-oidc "$PROVIDER_NAME" \
  --project="$PROJECT_ID" \
  --location="global" \
  --workload-identity-pool="$POOL_NAME" \
  --display-name="GitHub Actions Provider" \
  --issuer-uri="https://token.actions.githubusercontent.com" \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.repository=assertion.repository,attribute.repository_owner=assertion.repository_owner" \
  --attribute-condition="assertion.repository_owner == '$REPO_OWNER'"

# --- GRANT ROLES TO WIF PRINCIPAL ---
WIF_PRINCIPAL="principalSet://iam.googleapis.com/projects/$PROJECT_NUMBER/locations/global/workloadIdentityPools/$POOL_NAME/attribute.repository_owner/$REPO_OWNER"

echo "Granting permissions to WIF principal..."
for ROLE in "${WIF_ROLES[@]}"; do
  echo "  Granting $ROLE on project $PROJECT_ID"
  gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="$WIF_PRINCIPAL" \
    --role="$ROLE"
done

echo "Granting storage.objectAdmin on the state bucket..."
gcloud storage buckets add-iam-policy-binding gs://$BUCKET_NAME \
  --member="$WIF_PRINCIPAL" \
  --role="roles/storage.objectAdmin"

# --- PRINT WIF PROVIDER RESOURCE NAME ---
echo ""
echo "Your WIF provider resource is:"
gcloud iam workload-identity-pools providers describe "$PROVIDER_NAME" \
  --project="$PROJECT_ID" \
  --location="global" \
  --workload-identity-pool="$POOL_NAME" \
  --format="value(name)"
```

- Replace the variables at the top of the script with your project details and GitHub username.
- Run the script to perform all setup steps automatically.
- Use the printed WIF provider resource name in your GitHub Actions or Terraform configuration.