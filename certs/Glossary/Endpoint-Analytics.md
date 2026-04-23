---
layout: default
title: Endpoint Analytics
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/EndpointAnalytics
  - MD-102/Intune
  - MD-102/SCCM
  - MD-102/ConfigurationManager
---
Endpoint Analytics er en del av Microsoft Intune og brukes til å analysere ytelse, stabilitet og brukeropplevelse på Windows klienter. Verktøyet gir innsikt i faktorer som påvirker produktivitet, som treg oppstart, ustabile apper og maskiner som ikke er klare for moderne arbeidsformer. Målet er å identifisere problemer før brukerne merker dem, og gi anbefalinger som forbedrer drift og reduserer støttebehov.

Det inneholder rapporter for oppstartstid, applikasjonspålitelighet, Work from anywhere og mer avanserte analyser for miljøer med Intune Suite. Endpoint Analytics kan brukes på Intune‑administrerte, co‑administrerte og Configuration Manager‑tilknyttede enheter.

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

flowchart LR

    A[Endpoint Analytics] --> B[Samler data fra Windows klienter]
    B --> C[Intune eller ConfigMgr]
    C --> D[Analyserer ytelse og brukeropplevelse]

    D --> E[Startup performance]
    D --> F[Application reliability]
    D --> G[Work from anywhere]
    D --> H[Advanced Analytics]

    E --> E1[Identifiserer treg oppstart]
    F --> F1[Overvåker app krasj og stabilitet]
    G --> G1[Vurderer klarhet for fjernarbeid]
    H --> H1[Dypere innsikt og anbefalinger]

    D --> I[Anbefalte tiltak]
    I --> J[Forbedre konfigurasjon]
    I --> K[Proaktiv feilsøking]
    I --> L[Redusere støttebehov]


```

<a href="/certs/diagrams/deploy-endpoint-analytics.html" target="_blank" rel="noopener">Stort diagram</a>

[Endpoint analytics overview - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/endpoint-analytics/)
