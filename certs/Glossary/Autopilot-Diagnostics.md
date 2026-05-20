---
layout: default
title: Autopilot Diagnostics
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Autopilot
  - MD-102/OOBE
  - MD-102/PowerShell
---
Autopilot Diagnostics er et PowerShell‑basert verktøy som samler feilsøkingsinformasjon for Windows Autopilot i et lettlest format. Det henter data direkte fra Intune via Graph API og viser status for policyer, apper, profiler og registreringsprosesser. Dette gjør det enklere å identifisere hvor i flyten en feil oppstår, spesielt når OOBE ikke oppfører seg som forventet.

Verktøyet brukes ved å installere og kjøre skriptet Get AutoPilotDiagnostics. Når det kjøres med en konto som har riktige rettigheter, viser det en oversikt over mottatte og manglende konfigurasjoner, samt eventuelle feil. Det fungerer som et supplement til Event Viewer, registry og ETW spor, og gir en raskere vei til å finne årsaken til problemer med Autopilot.

For MD 102 er det viktig å forstå at Autopilot Diagnostics:

- samler flere feilsøkingskilder i ett verktøy
- viser status for policyer, apper og registrering
- bruker Graph API for å hente informasjon
- er nyttig når OOBE ikke følger forventet flyt
- ikke erstatter Event Viewer, men gjør feilsøking raskere

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

    A[Start PowerShell] --> B[Installer Get AutoPilotDiagnostics]
    B --> C[Kjør Get AutoPilotDiagnostics Online]
    C --> D[Koble til tenant]
    D --> E[Hent data via Graph API]
    E --> F[Vis status for policyer og apper]
    F --> G[Identifiser manglende eller feilede steg]
    G --> H[Bruk funn til videre feilsøking]

```