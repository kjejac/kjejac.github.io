---
layout: default
title: Branch Cache
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/ConfigurationManager
---
BranchCache er en teknologi for optimalisering av WAN trafikk som gjør at innhold som hentes fra hovedkontoret eller skybaserte innholdstjenere kan lagres lokalt i en filial. Dette reduserer behovet for gjentatte nedlastinger over WAN og gir raskere tilgang til filer og tjenester for brukere i avdelingskontorer. BranchCache støtter to driftsmoduser: 
- Distributed Cache, der klienter lagrer og deler innhold med hverandre
- Hosted Cache, der en lokal server fungerer som cache for området. 

Teknologien er tilgjengelig i Windows Server og Windows klienter og brukes for å redusere båndbreddebruk og forbedre ytelse ved tilgang til eksternt innhold.

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

    A[Bruker ber om innhold] --> B[Innhold finnes på hovedkontor eller sky]
    B --> C[BranchCache aktivert]
    C --> D{Cache tilgjengelig lokalt?}

    D -->|Ja| E[Hent innhold fra lokal cache]
    E --> F[Rask tilgang og redusert WAN trafikk]

    D -->|Nei| G[Hent innhold fra hovedkontor]
    G --> H[Lagre innhold i cache]
    H --> F

```

[BranchCache | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/networking/branchcache/branchcache)
[BranchCache: What It Is And How It Works](https://www.ituonline.com/tech-definitions/what-is-branchcache)