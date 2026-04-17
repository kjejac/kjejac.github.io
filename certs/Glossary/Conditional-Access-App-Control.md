---
layout: default
title: Conditional Access App Control
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CloudApps
  - MD-102/DefenderXDR
  - MD-102/Endpoint
  - MD-102/EndpointManagement
  - MD-102/Defender
  - MD-102/DefenderEndpoint
---
Conditional Access App Control er en funksjon i Microsoft Defender for Cloud Apps som gir _sanntidskontroll_ over brukeres tilgang og økter i skyapper. Den bygger på Microsoft Entra Conditional Access og bruker en _[reverse proxy](Reverse-proxy.md) arkitektur_ for å overvåke og styre aktivitet i nettleseren i det øyeblikket den skjer.

Løsningen gjør det mulig å:

- overvåke og kontrollere brukersesjoner i sanntid
- blokkere nedlasting, opplasting, utskrift, kopiering og deling av sensitive filer
- kreve ekstra autentisering når en sensitiv handling utføres
- hindre datalekkasjer fra unmanaged enheter
- blokkere native klienter og tvinge brukere over i nettleserbaserte økter
- identifisere og stoppe mistenkelig aktivitet umiddelbart

Conditional Access App Control fungerer med både Microsoft og tredjeparts skyapper. Microsoft Entra‑apper onboardes automatisk, mens apper fra andre identitetsleverandører må onboardes manuelt.

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

    A[User] --> B[Conditional Access policy]
    B --> C[Route session to Defender for Cloud Apps]
    C --> D[Reverse proxy]

    D --> E[Access policies]
    E --> E1[Block access]
    E --> E2[Allow limited access]

    D --> F[Session policies]
    F --> F1[Block download]
    F --> F2[Block upload]
    F --> F3[Require MFA]

    D --> G[Cloud app]

```

<a href="/certs/diagrams/defender-conditional-access-app-control.html" target="_blank" rel="noopener">Stort diagram</a>