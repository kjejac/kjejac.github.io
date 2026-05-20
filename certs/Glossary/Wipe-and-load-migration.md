---
layout: default
title: Wipe and load migration
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/USMT
---
_Wipe and load_ er en migreringsmetode der den eksisterende klienten slettes fullstendig før Windows installeres på nytt. Brukerdata fanges først med USMT, lagres i en migration store, og gjenopprettes etter at operativsystemet er reinstallert.

Metoden brukes når:

- klienten skal bygges helt på nytt
- det finnes korrupsjon, ytelsesproblemer eller uønskede apper
- en eldre Windows versjon ikke kan oppgraderes direkte
- organisasjonen ønsker en ren og standardisert installasjon

Wipe and load gir et helt nytt miljø, men krever reinstallasjon av apper og kan føre til datatap hvis migreringen ikke er planlagt riktig. Den brukes ofte i større utrullinger og når klienten skal beholdes, men operativsystemet må erstattes.

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

    A[Eksisterende klient] --> B[ScanState fanger brukerdata og innstillinger]
    B --> C[Lagring i migration store<br> lokalt eller nettverk]
    C --> D[Klienten slettes og Windows installeres på nytt]
    D --> E[LoadState gjenoppretter data og innstillinger]
    E --> F[Apper installeres på nytt]
    F --> G[Ferdig ren og standardisert klient]

```