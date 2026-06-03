---
layout: default
title: Apple Store App
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Apps
  - MD-102/Apple
  - MD-102/AppleStore
  - MD-102/Intune
  - MD-102/ABM
---
Apple Store‑apper er _offentlige iOS‑apper_ som distribueres via Intune ved hjelp av _Apple Business Manager (ABM)_ og _Managed App Store_. Dette er den anbefalte og moderne måten å distribuere iOS‑apper på i organisasjoner.

Intune integrerer med Apple Business Manager for å:

- søke etter apper i App Store
- tilordne lisenser automatisk
- distribuere apper til brukere eller enheter
- håndtere oppdateringer og installasjonsstatus

Dette er viktig i MD‑102 fordi iOS‑administrasjon krever riktig integrasjon mellom Intune og Apple‑økosystemet.

### Viktige egenskaper

- _Bruker Apple Business Manager_ ABM kobles til Intune for å hente App Store‑apper og administrere lisenser.
- _Støtter både bruker og enhetsbaserte lisenser_ Enhetsbasert lisens krever ikke Apple‑ID.
- _Automatisk lisenshåndtering_ Intune tildeler og frigjør lisenser automatisk basert på tilordning.
- _Støtter Required og Available_ Required installerer automatisk, Available gjør appen tilgjengelig i Company Portal.
- _Oppdateringer håndteres av App Store_ Intune overvåker status, men selve oppdateringen gjøres av iOS.
- _Kan kombineres med per app VPN_ Viktig for sikker tilgang til interne ressurser.

### Begrensninger

- Krever Apple Business Manager
- Krever MDM‑registrering for automatisk installasjon
- Ingen mulighet for å endre appens innhold eller funksjonalitet
- Oppdateringer kan ikke styres like detaljert som på Windows

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

    A[Apple Store apps] --> B[Apple Business Manager]
    B --> B1[Søk etter apper]
    B --> B2[Lisenshåndtering]
    B --> B3[Intune sync]

    A --> C[Intune distribusjon]
    C --> C1[Required install]
    C --> C2[Available i Company Portal]
    C --> C3[Bruker eller enhetslisens]

    A --> D[Oppdateringer]
    D --> D1[Håndteres av App Store]
    D --> D2[Intune overvåker status]

    A --> E[Enterprise funksjoner]
    E --> E1[Per app VPN]
    E --> E2[Sikker distribusjon]

```

<a href="/certs/diagrams/deploy-intune-app-store.html" target="_blank" rel="noopener">Stort diagram</a>