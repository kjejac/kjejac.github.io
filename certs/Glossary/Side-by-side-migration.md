---
layout: default
title: Side by side migration
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/USMT
---
Side by side brukes når en bruker skal flyttes til en ny fysisk klient. Metoden innebærer at data og innstillinger fanges fra kildeklienten og lagres i en migration store, før de gjenopprettes på målklienten etter at Windows er installert. Dette gjøres vanligvis med [User State Migration Tool](User-State-Migration-Tool.md) , som bruker ScanState for å samle data og LoadState for å gjenopprette dem.

Metoden støtter migrering av brukerprofiler, dokumenter, operativsysteminnstillinger og applikasjonsinnstillinger, men applikasjonene selv må installeres på nytt. Den brukes ofte i større utrullinger der klienter byttes ut, og gir en ren og standardisert installasjon på målmaskinen.

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

    A[Kildeklient] --> B[ScanState fanger brukerdata og innstillinger]
    B --> C[Lagring i migration store<br>lokalt eller nettverk]
    C --> D[Målklient installeres med ren Windows]
    D --> E[LoadState gjenoppretter data og innstillinger]
    E --> F[Bruker logger inn på ny klient]

```