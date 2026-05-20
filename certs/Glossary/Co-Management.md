---
layout: default
title: Co management
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CoManagement
  - MD-102/ConfigurationManager
  - MD-102/Intune
  - MD-102/ADDS
  - MD-102/SharePoint
  - MD-102/ExchangeOnline
  - MD-102/GPO
---
_Co management_ gjør det mulig å administrere Windows klienter med både Configuration Manager og Intune samtidig. Det brukes når en organisasjon ønsker å modernisere administrasjonen gradvis uten å måtte flytte alt til skyen på én gang.

For at co management skal fungere, må klientene være _Microsoft Entra hybrid joined_, Intune må være konfigurert for _automatic enrollment_, og klientene må kjøre _Windows 10 versjon 1709 eller nyere_.

Når klientene er registrert i begge systemer, kan arbeidsbelastninger flyttes trinnvis fra Configuration Manager til Intune. Dette gir fleksibilitet og gjør det mulig å teste moderne administrasjon på pilotgrupper før full utrulling.

Typiske arbeidsbelastninger som kan flyttes er:

- Device configuration
- Compliance policies
- Windows Update
- Endpoint Protection
- Resource access (Wi Fi, VPN, e post, sertifikater)
- Applikasjoner

Co management brukes ofte når organisasjoner har mange eksisterende ConfigMgr investeringer, komplekse applikasjoner eller behov for kontrollert overgang til moderne administrasjon.

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

    A[Klienter AD joined] --> B[Hybrid join med Microsoft Entra]
    B --> C[Intune automatic enrollment aktivert]
    C --> D[Klient administrert av ConfigMgr og Intune]
    D --> E[Velg arbeidsbelastninger som kan flyttes]
    E --> F[Pilotgrupper tester Intune styring]
    F --> G[Gradvis overgang til moderne administrasjon]
    G --> H[Full Intune styring når klart]

```