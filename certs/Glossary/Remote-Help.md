---
layout: default
title: Remote Help
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
  - MD-102/IntuneSuite
  - MD-102/RBAC
  - MD-102/ZeroTrust
  - MD-102/Compliance
  - MD-102/EntraID
  - MD-102/CA
  - MD-102/VPN
---
Remote Help er en _skybasert fjernstøtteløsning_ i Microsoft Intune som lar IT koble seg sikkert til brukeres enheter for feilsøking og støtte i sanntid. Løsningen krever at både hjelper og bruker logger inn med _Microsoft Entra ID_, noe som sikrer identitet og hindrer misbruk. Remote Help er tilgjengelig som _Intune Suite‑funksjon_ eller som et separat tillegg.

Remote Help skiller mellom:

- _Helper_ – IT‑personell som gir støtte
- _Sharer_ – brukeren som deler skjermen

Begge må være i samme tenant, og RBAC styrer nøyaktig hvilke handlinger en helper kan utføre.

### Viktige funksjoner

- _Sikker tilkobling via Entra ID_
- _RBAC‑styrt tilgang_ for å kontrollere hvem som kan se skjerm, ta kontroll eller utføre elevasjon
- _Compliance warnings_ før tilkobling hvis enheten ikke er kompatibel
- _Støtte for unenrolled devices_ dersom aktivert av administrator
- _Detaljerte rapporter og audit logs_ i Intune admin center
- _Web‑app for sharers_ hvis de ikke kan installere klienten

### Krav

- Intune‑abonnement
- Remote Help‑lisens, Intune Suite eller M365 E3/E5 for både helper og sharer
- Entra ID‑pålogging
- Remote Help‑appen installert (eller web‑app)

### Støttede plattformer

- Windows 10/11
- Windows 365
- Android (Samsung/Zebra)
- macOS
- iOS/iPadOS via nettleser

### MD‑102

Remote Help er en del av moderne endpoint‑administrasjon og viser hvordan Intune:

- bruker identitet som kontrollplan
- implementerer Zero Trust i støtteprosesser
- gir sikker fjernhjelp uten behov for VPN eller lokal admin
- bruker RBAC for å redusere risiko

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

    A[Remote Help] --> B[Autentisering]
    B --> B1[Entra ID]
    B --> B2[Samme tenant]

    A --> C[RBAC]
    C --> C1[View screen]
    C --> C2[Full control]
    C --> C3[Elevation]

    A --> D[Enheter]
    D --> D1[Windows 10/11]
    D --> D2[Windows 365]
    D --> D3[Android]
    D --> D4[macOS]
    D --> D5[iOS via nettleser]

    A --> E[Funksjoner]
    E --> E1[Compliance warnings]
    E --> E2[Unenrolled devices]
    E --> E3[Web app for sharers]

    A --> F[Administrasjon]
    F --> F1[Rapporter]
    F --> F2[Audit logs]
    F --> F3[Session details]

```