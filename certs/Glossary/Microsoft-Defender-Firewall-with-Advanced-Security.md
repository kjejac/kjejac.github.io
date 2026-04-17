---
layout: default
title: Microsoft Defender Firewall with Advanced Security
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Defender
  - MD-102/Firewall
  - MD-102/WFAS
---
Windows Defender Firewall with Advanced Security (WFAS) er et MMC‑basert administrasjonsverktøy som gir **avansert kontroll over nettverkstrafikk**, både inn og ut. Det bygger på samme motor som den vanlige Windows‑brannmuren, men gir langt mer detaljert styring av regler, profiler og sikkerhetspolicyer.

WFAS brukes til å:

- konfigurere **inbound** og **outbound** regler for applikasjoner, porter, protokoller og tjenester
- definere **Connection Security Rules** som bruker IPsec for autentisering og kryptering mellom enheter
- administrere brannmurprofiler (Domain, Private, Public) og tilhørende policyer
- implementere brannmurkonfigurasjon via **Group Policy**, **MDM (CSP)** eller lokalt på en enhet
- overvåke aktiv trafikk og logge blokkert eller tillatt trafikk

WFAS er tilgjengelig via `wf.msc` og brukes i både klient og servermiljøer. Det er et sentralt verktøy i MD‑102 fordi det gir administratorer kontroll over hvordan enheter kommuniserer i nettverk, og hvordan man reduserer angrepsflaten ved å begrense unødvendig trafikk.

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

    A[Application or service] --> B[Firewall rule evaluation]

    B --> C{Inbound rule?}
    C -->|Allowed| D[Traffic permitted]
    C -->|Blocked| E[Traffic denied]

    B --> F{Outbound rule?}
    F -->|Allowed| D
    F -->|Blocked| E

    D --> G[Network]

    H[Connection Security Rule] --> I[IPsec negotiation]
    I --> B

    J[Administrator] --> K[WFAS MMC snap-in]
    K --> B

```