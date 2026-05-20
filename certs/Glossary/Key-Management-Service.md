---
layout: default
title: Key Management Service (KMS)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/KMS
  - MD-102/License
---
KMS, Key Management Service, er en metode for volumaktivering av Windows og Office i større organisasjoner. I stedet for at hver klient aktiveres direkte mot Microsoft, aktiveres de mot en intern KMS server. Klientene må kontakte KMS jevnlig for å beholde aktiveringen, noe som gjør løsningen egnet for miljøer der klientene er tilkoblet organisasjonens nettverk.

KMS krever at et minimum antall klienter er til stede før aktivering fungerer, kjent som activation threshold. Når dette kravet er oppfylt, kan alle kvalifiserte klienter aktiveres automatisk. KMS brukes ofte i tradisjonelle on premises miljøer og er en av de tre hovedmetodene for volumaktivering sammen med MAK og Active Directory basert aktivering.

KMS er relevant i MD 102 fordi det representerer en klassisk aktiveringsmodell som fortsatt brukes i mange organisasjoner, men som i økende grad suppleres eller erstattes av moderne metoder som Subscription Activation.

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

    A[Windows klient installert] --> B[Klient søker etter KMS server]
    B --> C[KMS server validerer aktivering]
    C --> D[Klient aktiveres lokalt]
    D --> E[Klient må kontakte KMS jevnlig for fornyelse]

```


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

    A[Volumaktivering] --> B[KMS]
    A --> C[MAK]
    A --> D[Active Directory basert aktivering]

    B --> B1[Klient kontakter KMS server]
    C --> C1[Klient aktiveres med MAK nøkkel]
    D --> D1[Klient aktiveres ved AD innlogging]

```
