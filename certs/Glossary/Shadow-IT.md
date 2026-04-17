---
layout: default
title:
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CloudApps
  - MD-102/Defender
  - MD-102/Endpoint
  - MD-102/DefenderEndpoint
  - MD-102/ShadowIT
  - MD-102/CASB
---
Shadow IT betyr bruk av skyapper, tjenester eller løsninger som ikke er godkjent eller administrert av IT avdelingen. Dette skjer ofte når ansatte tar i bruk apper som gjør arbeidet enklere, men uten at virksomheten har kontroll på sikkerhet, datalagring eller tilgang. Shadow IT skaper risiko fordi data kan havne i apper som ikke følger virksomhetens krav til beskyttelse, samsvar eller tilgangsstyring. Microsoft Defender for Cloud Apps oppdager slike apper ved å analysere trafikk og viser hvilke tjenester som brukes, hvem som bruker dem og hvor stor risiko de representerer. I MD 102 er dette viktig fordi du må kunne identifisere uautoriserte apper og håndtere dem gjennom policyer og risikovurdering.



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