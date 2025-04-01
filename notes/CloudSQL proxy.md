---
title: CloudSQL proxy
description: ""
date: 2025-04-01
tags:
  - GCP
categories:
  - zettelkasten
draft: true
---

## Pull proxy from Google

> [!Note]
> This is for linux64bit if you run on something else then goto [this](https://cloud.google.com/sql/docs/postgres/sql-proxy#linux-64-bit) link

Pull it from internet:

```bash
curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.11.4/cloud-sql-proxy.linux.amd64
```

Make it executable:

```bash
chmod +x cloud-sql-proxy
```

In one line:

```bash
curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.11.4/cloud-sql-proxy.linux.amd64 && chmod +x cloud-sql-proxy
```

### Start the proxy

If you have downloaded credentials SA:

```bash
./cloud-sql-proxy --address 0.0.0.0 -p 5433 {instance connection name} -c /path/to/key
```

If you have SA permissions (SA exists and you have connected account to it and you are logged in with `gcloud`)

```bash
./cloud-sql-proxy --address 0.0.0.0 -p 5433 {instance connection name}\
    --token=$(gcloud auth print-access-token --impersonate-service-account=email-of-SA)
```

### Connect via the proxy with psql to the database

```bash
psql --host 0.0.0.0 --port=5433 --username postgres
```
