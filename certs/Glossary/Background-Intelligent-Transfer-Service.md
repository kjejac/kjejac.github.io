---
layout: default
title: Background Intelligent Transfer Service (BITS)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/BITS
---
Background Intelligent Transfer Service er en Windows‑tjeneste som overfører filer i bakgrunnen ved å bruke ledig båndbredde. Den er utviklet for å ikke forstyrre brukerens arbeid og brukes av Windows Update, Microsoft Store, Intune, Defender og andre tjenester som trenger pålitelig filoverføring. BITS kan pause og automatisk gjenoppta overføringer etter nettverksavbrudd eller omstart, og den kan prioritere jobber og håndtere kostnadsbevisste nettverk.

BITS bruker intelligent regulering for å unngå å påvirke annen trafikk og kan integreres med BranchCache for å redusere WAN‑belastning. Den deler filer i mindre deler, gjenopptar kun manglende deler ved feil og sørger for stabile overføringer selv på ustabile nettverk.

## Kort forskjell fra LEDBAT

- _BITS_ fokuserer på _kontrollert og robust filoverføring_ med køhåndtering, prioritering og automatisk gjenopptakelse. Egnet for oppgaver som må fullføres pålitelig.
- _LEDBAT_ fokuserer på _maksimal bruk av ubrukt kapasitet_ og trekker seg raskt tilbake ved forsinkelser. Egnet for store bakgrunnsoverføringer som ikke må forstyrre brukeren. (Basert på Microsofts dokumentasjon om LEDBAT‑oppførsel.)

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

    A[Start bakgrunnsjobb] --> B[BITS vurderer nettverksbelastning]
    B --> C[Bruker kun ledig båndbredde]
    C --> D[Overføring i små deler]
    D --> E[Pause ved avbrudd]
    E --> F[Gjenoppta automatisk]
    F --> G[Fullført overføring]

```

[Background Intelligent Transfer Service - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/bits/background-intelligent-transfer-service-portal)
[Background Intelligent Transfer Service (BITS): The Silent Workhorse of Windows](https://www.linkedin.com/pulse/background-intelligent-transfer-service-bits-silent-workhorse-mittal-lxhyc)