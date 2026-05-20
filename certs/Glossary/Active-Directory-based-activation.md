---
layout: default
title: Active Directory-based activation (ADBA)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/License
  - MD-102/ADDS
  - MD-102/ADBA
  - MD-102/GVLK
  - MD-102/KMS
---
Active Directory based activation (_ADBA_) gjør det mulig å aktivere Windows ved hjelp av _domenet_ i stedet for en dedikert KMS server. Når en klient blir domenetilknyttet og har en _Generic Volume License Key (GVLK)_ installert, aktiveres Windows automatisk så lenge klienten kan kontakte en domenekontroller.

Dette erstatter behovet for en lokal KMS server og fjerner krav om aktiveringsterskel (som KMS krever). Aktiveringsobjektet lagres i Active Directory og replikeres til alle domenekontrollere, noe som gir høy tilgjengelighet og mindre administrasjon.

ADBA passer godt i miljøer der alle klienter er domenetilknyttet, og brukes ofte i moderne VDI miljøer for å unngå problemer dersom en KMS server er utilgjengelig. Klienter forblir aktiverte så lenge de kan kontakte domenet, og deaktiveres først etter 180 dager uten kontakt.


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

    A[Klient installert med GVLK] --> B[Klient blir domenetilknyttet]
    B --> C[Klient kontakter domenekontroller]
    C --> D[ADBA objekt aktiverer Windows]
    D --> E[Klient forblir aktivert så lenge domenekontakt finnes]

```