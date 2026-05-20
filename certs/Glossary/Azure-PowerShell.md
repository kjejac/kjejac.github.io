---
layout: default
title: Azure PowerShell
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/VDA
  - MD-102/VDI
  - MD-102/CLI
  - MD-102/PowerShell
---
Azure PowerShell er en samling offisielle moduler som lar deg administrere Azure direkte fra PowerShell. Det anbefalte rammeverket er **Az‑modulen**, som fungerer på Windows, macOS og Linux, og kan brukes lokalt, i Azure Cloud Shell eller i Docker.

Cmdletene i Az‑modulen gjør REST kall mot Azure Resource Manager og produserer .NET objekter, noe som gjør det enkelt å filtrere, kombinere og automatisere oppgaver.

Modulen dekker nesten alle Azure tjenester gjennom egne delmoduler som **Az.Network**, **Az.Compute** og **Az.Aks**, og brukes til å opprette, endre og administrere ressurser på en konsistent måte.

Azure PowerShell støtter flere autentiseringsmetoder, inkludert interaktiv pålogging og service principals, og er spesielt nyttig når du trenger skripting, automatisering eller objektbasert behandling av data.

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

    A[Azure PowerShell] --> B[Az modulen]
    B --> B1[Kryssplattform]
    B --> B2[Tusenvis av cmdlets]
    B --> B3[REST kall mot ARM]

    A --> C[Administrasjon]
    C --> C1[Opprette ressurser]
    C --> C2[Endre konfigurasjon]
    C --> C3[Automatisere drift]

    A --> D[Autentisering]
    D --> D1[Connect-AzAccount]
    D --> D2[Service principals]
    D --> D3[Cloud Shell]

    A --> E[Objektbasert output]
    E --> E1[.NET objekter]
    E --> E2[Piping og filtrering]

```

[What is Azure PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/azure/what-is-azure-powershell?view=azps-15.5.0)
