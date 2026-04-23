---
layout: default
title: Remote Desktop Services (RDS)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/RDS
  - MD-102/WindowsServer
  - MD-102/RemoteApp
---
Remote Desktop Services er en plattform i Windows Server som gjør det mulig å levere skrivebord og applikasjoner fra sentrale servere til brukere uansett hvor de befinner seg. RDS sender bare brukergrensesnittet til klienten, mens all behandling skjer på serveren. Dette reduserer administrasjonsbehov, gir bedre sikkerhet og gjør det enklere å standardisere applikasjoner og arbeidsflater.

RDS støtter både fullstendige skrivebordssesjoner og publiserte apper gjennom RemoteApp. Det gir fleksibilitet i valg av ytelse, kostnad og kompatibilitet. Data forblir i datasenteret, og sikkerheten styrkes gjennom kryptert tilgang, flerfaktorautentisering og sentralisert administrasjon.

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

    A[Bruker starter RDP tilkobling] --> B[Autentisering og tilgangskontroll]
    B --> C[RD Gateway eller direkte til server]
    C --> D[RD Connection Broker fordeler belastning]
    D --> E[RD Session Host eller VDI maskin]
    E --> F[Apper og skrivebord kjøres på server]
    F --> G[UI sendes til klient via RDP]
    G --> H[Bruker arbeider som om alt kjører lokalt]

```

<a href="/certs/diagrams/deploy-rds.html" target="_blank" rel="noopener">Stort diagram</a>

[Remote Desktop Services overview in Windows Server | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/overview)