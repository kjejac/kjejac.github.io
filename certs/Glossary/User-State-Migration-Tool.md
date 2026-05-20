---
layout: default
title: User State Migration Tool (USMT)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/USMT
  - MD-102/ScanState
  - MD-102/LoadState
---
_User State Migration Tool (USMT)_ er Microsofts verktøy for å migrere brukerdata og innstillinger når en klient skal oppgraderes eller reinstalleres. Det brukes i større miljøer der prosessen må være automatisert og forutsigbar.

USMT består av to hovedverktøy:

- _ScanState_ – fanger brukerdata og innstillinger
- _LoadState_ – gjenoppretter data på målklienten

USMT bruker XML maler (MigApp, MigDocs, MigUser, ConfigMgr) som definerer hva som skal tas med eller utelates. Dette gjør det mulig å standardisere migreringen og unngå uønsket data.

USMT brukes i både _Side by side_ og _Wipe and load_, og kan integreres i Configuration Manager via State Migration Point og Task Sequences. Det støtter også offline migrering via Windows.old når en støttet Windows versjon oppgraderes.

USMT migrerer _ikke apper_, kun data og innstillinger. Apper må installeres på nytt etterpå.

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

    A[Start migrering] --> B[ScanState fanger brukerdata og innstillinger]
    B --> C[Bruk av XML maler<br>MigApp, MigDocs, MigUser, ConfigMgr]
    C --> D[Lagring i migration store<br>lokalt eller på nettverk]
    D --> E[Installer eller oppgrader Windows]
    E --> F[LoadState gjenoppretter data og innstillinger]
    F --> G[Apper installeres på nytt]
    G --> H[Ferdig migrert klient]

```