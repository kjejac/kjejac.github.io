---
layout: default
title: Risikovurdering
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CASB
  - MD-102/CloudApps
  - MD-102/Defender
  - MD-102/Endpoint
  - MD-102/EndpointManagement
  - MD-102/DefenderEndpoint
  - MD-102/ShadowIT
---
Risikovurdering handler om å evaluere hvor trygge eller utrygge skyapper er. Microsoft Defender for Cloud Apps bruker en omfattende appkatalog med mer enn 90 risikofaktorer, som datasikkerhet, sertifiseringer, kryptering, tilgangskontroll, driftssikkerhet og hvordan leverandøren håndterer personvern. Hver app får en risikoscore som hjelper IT avdelingen med å avgjøre om appen kan brukes, bør blokkeres eller krever ekstra tiltak. Risikovurdering brukes også på brukeratferd, for eksempel store datanedlastinger, uvanlige pålogginger eller mistenkelige OAuth tillatelser. I MD 102 er dette sentralt fordi du må kunne forklare hvordan risiko vurderes og hvordan dette styrer policyer og tiltak i skyen.

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

    A[Skyapp miljø]

    A --> B[Shadow IT]
    B --> B1[Uautoriserte apper]
    B --> B2[Manglende kontroll]
    B --> B3[Potensiell datarisiko]

    A --> C[Risikovurdering]
    C --> C1[90+ risikofaktorer]
    C --> C2[Sikkerhet og samsvar]
    C --> C3[Brukeratferd]

    B --> D[Policy tiltak]
    C --> D

    D --> D1[Blokkere apper]
    D --> D2[Begrense tilgang]
    D --> D3[Overvåke aktivitet]

    D --> E[Databeskyttelse]
    E --> E1[DLP]
    E --> E2[Sensitivitetsetiketter]
    E --> E3[Varsler og respons]

```

<a href="/certs/diagrams/defender-risiko-shadowy.html" target="_blank" rel="noopener">Stort diagram</a>