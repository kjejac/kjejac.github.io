---
layout: default
title: Microsoft Defender SmartScreen
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Defender
  - MD-102/Endpoint
  - MD-102/EndpointManagement
  - MD-102/Antivirus
  - MD-102/SmartScreen
---
Microsoft Defender SmartScreen er en innebygd sikkerhetsfunksjon i Windows 10, Windows 11 og Microsoft Edge. Den beskytter brukere ved å analysere nettsteder, nedlastinger og apper i sanntid. SmartScreen sammenligner URLer og filer med Microsofts dynamiske lister over rapporterte phishing sider, malware sider og farlige programmer. Dersom noe virker mistenkelig eller mangler etablert omdømme, vises en advarsel.

Viktige egenskaper:

- _Anti phishing_: Blokkerer nettsteder som forsøker å stjele brukerinformasjon.
- _Anti malware_: Stopper nettsteder og filer som distribuerer skadelig programvare.
- _Reputasjonsbasert filkontroll_: Varsler når en fil ikke er kjent eller mangler digital signatur.
- _Atferdsanalyse av nettsteder_: Oppdager mistenkelig kode og aktivitet.
- _Integrert i Windows, Edge, Microsoft Store og Outlook_.

For MD 102 er SmartScreen viktig fordi det er en del av _Attack Surface Reduction_ og gir et tidlig forsvar mot sosial manipulasjon, drive by angrep og farlige nedlastinger.

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

    A[Microsoft Defender SmartScreen]

    A --> B[URL kontroll]
    B --> B1[Sjekker mot dynamiske phishing og malware lister]
    B --> B2[Analyserer nettsideatferd]

    A --> C[Nedlastingskontroll]
    C --> C1[Sjekker filer mot kjente farlige programmer]
    C --> C2[Varsler om ukjente eller lite nedlastede filer]

    A --> D[App og filreputasjon]
    D --> D1[Kontrollerer digital signatur]
    D --> D2[Blokkerer lav omdømme programvare]

    A --> E[Integrasjon]
    E --> E1[Windows 10 og 11]
    E --> E2[Microsoft Edge og Microsoft Store]
    E --> E3[Outlook og andre Microsoft tjenester]

    A --> F[Beskyttelseseffekt]
    F --> F1[Stopper phishing]
    F --> F2[Stopper malware]
    F --> F3[Stopper drive by angrep]

```

<a href="/certs/diagrams/defender-smartscreen.html" target="_blank" rel="noopener">Stort diagram</a>

[Microsoft Defender SmartScreen overview | Microsoft Learn](https://learn.microsoft.com/en-us/windows/security/operating-system-security/virus-and-threat-protection/microsoft-defender-smartscreen/?utm_source=copilot.com)