---
layout: default
title: Azure CLI
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Azure
  - MD-102/CLI
  - MD-102/AzureCLI
  - MD-102/PowerShell
---
Azure CLI er et kryssplattform verktøy for å administrere Azure gjennom kommandolinjen. Det gir mulighet til å automatisere oppgaver, bruke skript, endre ressurskonfigurasjon og hente informasjon på en effektiv måte. Det støtter flere autentiseringsmetoder, inkludert interaktiv pålogging og service principals, og kan kjøres lokalt eller i Azure Cloud Shell.

CLIen bruker et konsistent kommandospråk der alle kommandoer starter med **az**, etterfulgt av ressurs og operasjon, for eksempel `az vm create`. Resultater kan formateres som JSON, tabell eller TSV, og kan filtreres med JMESPath spørringer via `--query`. Dette gjør verktøyet svært egnet for automatisering og integrasjon i DevOps prosesser.

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

    A[Azure CLI] --> B[Kryssplattform]
    B --> B1[Windows]
    B --> B2[macOS]
    B --> B3[Linux]

    A --> C[Administrasjon av Azure]
    C --> C1[Opprette ressurser]
    C --> C2[Endre konfigurasjon]
    C --> C3[Automatisere drift]

    A --> D[Kommandomodell]
    D --> D1[az + ressurs + operasjon]
    D --> D2[JSON og tabell output]
    D --> D3[JMESPath spørringer]

    A --> E[Autentisering]
    E --> E1[az login]
    E --> E2[Service principals]
    E --> E3[Cloud Shell]

```

[Azure Command-Line Interface (CLI) documentation | Microsoft Learn](https://learn.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
[What Is Azure CLI - Azure Lessons](https://azurelessons.com/what-is-azure-cli/)
