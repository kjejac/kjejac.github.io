---
layout: default
title: Cloud Access Security Broker (CASB)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CASB
  - MD-102/Defender
  - MD-102/Endpoint
  - MD-102/EndpointManagement
  - MD-102/DefenderEndpoint
  - MD-102/ShadowIT
  - MD-102/DLP
  - MD-102/Antivirus
---
En Cloud Access Security Broker er et sikkerhetslag som ligger mellom brukere og skyressurser. Den gir oversikt over hvilke skyapper som brukes, vurderer risiko, beskytter data og oppdager trusler på tvers av SaaS, PaaS og IaaS. En CASB håndhever virksomhetens policyer uavhengig av hvor brukeren befinner seg eller hvilken enhet som brukes.

CASB løsninger oppdager Shadow IT ved å analysere trafikk og identifisere apper som ikke er godkjent. De vurderer apper etter sikkerhet, samsvar, driftssikkerhet og personvern. De overvåker brukeratferd og varsler ved unormal aktivitet som store datanedlastinger eller mistenkelige pålogginger.

CASB beskytter data gjennom tilgangskontroll, DLP, sensitivitetsetiketter og styring av deling. Den kan også sikre kommunikasjon mellom apper, spesielt OAuth apper som kan få tilgang til sensitive data.

I MD 102 sammenheng er CASB viktig fordi den gir innsikt i skybruk, styrker databeskyttelse og hjelper administratorer med å håndtere risiko i et miljø der skyapper ofte er en del av angrepsflaten.


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

    A[CASB]

    A --> B[Visibility]
    B --> B1[Oppdage skyapper]
    B --> B2[Shadow IT]
    B --> B3[Risikorangering]

    A --> C[Data security]
    C --> C1[DLP]
    C --> C2[Sensitivitetsetiketter]
    C --> C3[Kontroll av deling]

    A --> D[Threat protection]
    D --> D1[Atferdsanalyse]
    D --> D2[Adaptive kontroller]
    D --> D3[Skadevarebeskyttelse]

    A --> E[Compliance]
    E --> E1[Rapporter]
    E --> E2[Styring]
    E --> E3[Regulatoriske krav]

```

<a href="/certs/diagrams/defender-casb.html" target="_blank" rel="noopener">Stort diagram</a>