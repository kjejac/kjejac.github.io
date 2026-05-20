---
layout: default
title: Autoscale
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/AVD
  - MD-102/VirtualDesktop
  - MD-102/VDI
  - MD-102/Azure
  - MD-102/RBAC
---
Autoscale i Azure Virtual Desktop gjør det mulig å styre kapasiteten i en host pool ved å slå av eller på virtuelle maskiner etter behov. Dette optimaliserer kostnader ved å redusere antall aktive maskiner utenfor arbeidstid, samtidig som brukere får tilstrekkelig kapasitet i perioder med høy belastning. Autoscale støtter to metoder:

- _Power management autoscaling_: Skrur session hosts av og på etter tidsplan. Passer for forutsigbare miljøer.
- _Dynamic autoscaling (preview)_: Kan både starte, stoppe, opprette og slette session hosts basert på faktisk etterspørsel. Passer for mer varierende bruksmønstre.

Autoscale krever at Azure Virtual Desktop får nødvendige RBAC‑rettigheter til å styre strømtilstanden på session hosts, og at host pool har satt en _MaxSessionLimit_, som brukes for å beregne kapasitet.

Formålet er å balansere kostnader og ytelse: unngå at maskiner står på uten bruk, men samtidig sikre at brukere ikke opplever treghet eller manglende kapasitet. Dette er spesielt viktig i pay‑as‑you‑go miljøer der compute‑kostnader løper per minutt.

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

    A[Autoscale i AVD] --> B[Power management autoscaling]
    A --> C[Dynamic autoscaling]

    B --> B1[Slår av og på session hosts]
    B --> B2[Basert på tidsplan]
    B --> B3[Krever MaxSessionLimit]

    C --> C1[Oppretter og sletter session hosts]
    C --> C2[Reagerer på faktisk belastning]
    C --> C3[Kun for pooled host pools]

    A --> D[Krav]
    D --> D1[RBAC: Desktop Virtualization Power On Off Contributor]
    D --> D2[Konfigurasjon i samme region]
    D --> D3[Kan ikke kombineres med andre skaleringsteknikker]

    A --> E[Fordeler]
    E --> E1[Reduserte kostnader]
    E --> E2[Bedre ytelse]
    E --> E3[Automatisert drift]

```

[Create and assign an autoscale scaling plan for Azure Virtual Desktop - Azure Virtual Desktop | Microsoft Learn](https://learn.microsoft.com/en-us/azure/virtual-desktop/autoscale-create-assign-scaling-plan)
[AVD Auto-Scaling Guide](https://getnerdio.com/automation-to-manage-avd)
