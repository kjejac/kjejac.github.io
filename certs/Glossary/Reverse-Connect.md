---
layout: default
title: Reverse Connect
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/AVD
  - MD-102/AzureVirtualDesktop
  - MD-102/Security
---
Reverse Connect er teknologien som gjør at Azure Virtual Desktop kan levere skrivebord og apper uten at du åpner innkommende porter i brannmuren. I stedet for at klienten kobler seg direkte til den virtuelle maskinen, oppretter session hosten en utgående tilkobling til Azure. Klienten kobler seg deretter til denne forbindelsen gjennom AVD tjenesten.

Dette betyr at all trafikk går ut fra session hosten, og ingen innkommende trafikk trenger å tillates. Det gir enklere nettverkskonfigurasjon, bedre sikkerhet og mindre risiko for angrep. Reverse Connect gjør det også mulig å bruke AVD i miljøer med strenge brannmurregler eller uten offentlig IP adresse.

Teknologien brukes av alle AVD klienter, inkludert Windows, macOS, iOS, Android og nettleser. Den er en av hovedgrunnene til at AVD er enklere å sette opp enn tradisjonelle RDS miljøer.

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

    A[Klient] --> B[AVD tjeneste]
    B --> C[Utgående tilkobling fra session host]

    C --> D[Session host]
    D --> D1[Ingen innkommende porter]
    D --> D2[All trafikk går ut]

    B --> E[Sikker tilkobling]
    E --> E1[Enklere brannmur]
    E --> E2[Ingen offentlig IP nødvendig]

```

