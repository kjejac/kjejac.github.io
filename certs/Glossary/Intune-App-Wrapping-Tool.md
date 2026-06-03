---
layout: default
title: Intune App Wrapping Tool
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
  - MD-102/MAM
  - MD-102/IntuneAppWrappingTool
  - MD-102/IntuneAppSDK
---
Intune App Wrapping Tool brukes til å gjøre interne Android og iOS line of business apper klare for appbeskyttelsespolicyer uten at kildekoden må endres. Verktøyet legger et administrasjonslag rundt appen slik at Intune kan håndheve MAM policyer som databeskyttelse, tilgangskrav og begrensninger på deling. Dette er relevant for MD 102 fordi mange virksomheter har egne apper som ikke ligger i offentlige appbutikker og derfor må klargjøres manuelt.

Verktøyet er et Windows kommandolinjeprogram som pakker inn en eksisterende appfil (APK eller IPA). Det støtter kun interne apper og kan ikke brukes på apper hentet fra Google Play eller Apple App Store. Appen må være signert, ikke kryptert, og ikke tidligere pakket inn. For komplekse apper kreves ofte Intune App SDK i tillegg.

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

    A[Intune App Wrapping Tool] --> B[Wrap LOB apps]
    B --> B1[Ingen kildekode nødvendig]
    B --> B2[Krever signering]
    B --> B3[Kun interne apper]

    A --> C[Output]
    C --> C1[App med MAM støtte]
    C --> C2[Kan bruke APP policyer]

    A --> D[Krav]
    D --> D1[APK eller IPA]
    D --> D2[Ikke kryptert]
    D --> D3[Ikke tidligere pakket inn]

    A --> E[Begrensninger]
    E --> E1[Ikke Play Store]
    E --> E2[Ikke App Store]
    E --> E3[Komplekse apper krever SDK]

```


[Wrap Android Apps With the Intune App Wrapping Tool - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/developer/app-sdk/configure-wrapping-android)
[Prepare Apps for Mobile Application Management With Microsoft Intune - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/developer/app-sdk/integration-methods)
