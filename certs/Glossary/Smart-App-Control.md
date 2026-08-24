---
layout: default
title: Smart App Control (SAC)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/ZeroTrust
  - MD-102/Windows11
---
_Smart App Control (SAC)_ er en sikkerhetsfunksjon i Windows 11 som automatisk blokkerer apper og skript som ikke har et kjent og betrodd omdømme. Den bruker _Microsofts cloud‑baserte omdømmetjenester + kodeintegritetsregler + AI‑basert vurdering_ for å avgjøre om en app skal få kjøre.

Den beskytter mot:

- ukjente apper uten signatur
- skadelige eller manipulerte apper
- skript og prosesser som ikke har etablert tillit
- apper som prøver å kjøre utenfor normale installasjonsflyter

SAC har tre moduser:

- _On_ – blokkerer ukjente apper automatisk
- _Evaluation_ – analyserer app‑bruk og avgjør om On‑modus er trygg
- _Off_ – kan ikke slås på igjen uten reinstallasjon (clean install‑krav)

Microsoft beskriver SAC som et “zero trust for consumer apps”‑lag.

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

    A[App eller skript<br>forsøker å kjøre] --> B[Smart App Control<br>signatur + AI-vurdering]
    B --> C[Microsoft sikkerhetsintelligens<br>omdømme- og trusseldata]
    C --> D[Tillat<br>betrodd app]
    C --> E[Blokker<br>ukjent/skadelig]

```