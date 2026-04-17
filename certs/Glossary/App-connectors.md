---
layout: default
title: "Microsoft Defender for Cloud Apps: App connectors"
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Defender
  - MD-102/DefenderXDR
  - MD-102/Endpoint
  - MD-102/EndpointManagement
  - MD-102/DefenderEndpoint
---
App connectors er API‑baserte integrasjoner som kobler Microsoft Defender for Cloud Apps til skyapplikasjoner for å gi _dyp synlighet_, _kontroll_ og _databeskyttelse_. De bruker app‑leverandørenes egne APIer for å hente informasjon om brukere, aktiviteter, filer, konfigurasjoner og sikkerhetsinnstillinger.

Når en app kobles til, kan Defender for Cloud Apps:

- hente brukerdata, grupper og privilegier
- overvåke aktiviteter og administrasjonshendelser
- skanne filer for DLP, sensitivitetsetiketter og skadevare
- analysere appens sikkerhetskonfigurasjon
- utføre governance handlinger som suspendering av brukere eller tilbakekalling av OAuth‑tillatelser

App connectors støtter både Microsoft og tredjepartsapper som Salesforce, Google Workspace, AWS, Box og mange flere. Løsningen håndterer API‑begrensninger som throttling og tidsvinduer ved å kjøre skanninger i intervaller.

App connectors er en av de viktigste teknologiene i Defender for Cloud Apps fordi de gir _kontinuerlig, detaljert innsikt_ som ikke er mulig med kun Cloud Discovery eller reverse proxy.

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%

flowchart TB

    A[Defender for Cloud Apps] --> B[App connector]

    B --> C[Authentication]
    C --> C1[OAuth tokens]
    C --> C2[API keys]

    B --> D[Data collection]
    D --> D1[Users and groups]
    D --> D2[Activities and logs]
    D --> D3[Files and metadata]
    D --> D4[App configuration]

    B --> E[Analysis]
    E --> E1[DLP scanning]
    E --> E2[Sensitivitetsetiketter]
    E --> E3[Anomali og trusseldeteksjon]

    B --> F[Governance actions]
    F --> F1[Suspend user]
    F --> F2[Revoke OAuth permissions]
    F --> F3[Quarantine files]

    A --> G[Policies]
    G --> G1[File policies]
    G --> G2[Activity policies]
    G --> G3[App governance]

```

<a href="/certs/diagrams/defender-app-connectors.html" target="_blank" rel="noopener">Stort diagram</a>