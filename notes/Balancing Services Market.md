---
title: "Balancing Services Market"
date: "2025-03-10"
description: ""
tags:
  - zettlekasten
---

## Glossary

**Balancing Services Provider** (BSP, pl: dostawca usług bilansujących) – active participant of balancing market, owner of assets qualified to provide balancing capacity and/or energy to the TSO (or aggregator authorized by such owner to manage their assets in the field of balancing services)

**Balancing capacity** (unit: MW, pl: moc bilansująca) – volume of capacity reserve kept by asset operator to provide balancing energy upon demand from the TSO

**Balancing energy** (unit: MWh, pl: energia bilansująca) – volume of energy used by the TSO to balance the grid at the moment of delivery

**Scheduling unit** (pl: jednostka grafikowa) – basic identification and settlement unit in the balancing services market, a set of generation assets used by BSP to provide the services

**Qualification** – process of licensing scheduling unit for balancing market, covers i.a. assets' control and regulation system and integration with TSO's IT systems

## Current state

Since June 2024: 

- Balancing services market is fully competitive, open to RES as well.
- Balancing time interval shifted to 15 minutes (before: 1h)

## Balancing Services

All services will have *G* and *D* regulation demands.
Eg. FCRg is a product that represents upward regulation demand (generation increase)

| Reserve type | Activation time | Est. hourly system demand |
| ------------ | --------------- | ------------------------- |
| FCR          | 30 s            | G: 170 MW; D: 170 MW      |
| aFRR         | ≤ 5 min         | G: 400 MW; D: 240 MW      |
| mFRR         | ≤ 12.5 min      | G: 600 MW; D: 360 MW      |
| RR           | ≤ 30 min        | –                         |

FCR - Frequency Containment Reserve
FRR - Frequency Restoration Reserve
aFFR - Automatic FRR
mFFR - Manual FRR
RR - Replacement reserve

## Scheduling unit types for RES

??

## Scheduling unit types for BESS

??

## Market design

Balancing capacity market phases:

- **Initial** – day-ahead trading, single pay-as-cleared auction for a whole day, offers in full MWs in hourly granularity
- **Secondary** – intraday trading, hour-specific pay-as-cleared auctions, offers in full MWs in 15 mins granularity

Trading schedule – spot and balancing markets

| Time                                          | Event                                                                             |
| --------------------------------------------- | --------------------------------------------------------------------------------- |
| 07:30 (d-1)                                   | Publication of grid limits                                                        |
| 8:30-9:00 (d-1)                               | Initial capacity auctions                                                         |
| 9:00-10:00 (d-1)                              | Verification of capacity offers, initial auction results publication              |
| 10:00-14:30 (d-1)                             | Initial scheduling phase  <br>(incl. balancing energy offers)                     |
| 10:30 (d-1)                                   | Day-ahead spot auction I                                                          |
| 12:00 (d-1)                                   | Day-ahead spot auction II                                                         |
| 14:00 (d-1) – 22:15                           | Intraday spot market  <br>(ending 45 mins before delivery hour)                   |
| 16:30 (d-1) – 22:05                           | Secondary capacity and energy auctions  <br>(ending 55 mins before delivery hour) |
