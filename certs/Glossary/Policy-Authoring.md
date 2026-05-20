---
layout: default
title: Policy Authoring
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/RBAC
  - MD-102/EPM
  - MD-102/EndpointPrivilegeManagement
  - MD-102/ZeroTrust
---
Policy Authoring i Endpoint Privilege Management handler om å _utforme og konfigurere EPM‑policyer_ som styrer hvordan og når brukere kan kjøre filer med forhøyede rettigheter. Dette gjøres gjennom to hovedtyper policyer:

### Elevation Settings Policy

Styrer hvordan EPM fungerer på enheten, inkludert:

- om EPM er aktivert
- standard oppførsel for filer uten regler
- rapporteringsnivå
- hva som skjer når en fil ikke matcher en regel

Microsoft Learn beskriver dette slik:

- Elevation settings policy brukes til å _«Enable or disable EPM on a device»_ og _«Set a default response for an elevation request of any file that isn't managed by a Windows elevation rule policy»_ .

### Elevation Rules Policy

Definerer _hvilke filer som kan kjøres med forhøyede rettigheter_, og _hvordan_ de skal valideres. Regler kan identifisere filer basert på:

- filnavn
- hash
- sertifikat
- metadata (produktnavn, intern navn, versjon osv.)

Microsoft Learn sier:

- _«An elevation rules policy is used to manage the identification of specific files, and how elevation requests for those files are handled.»_
- Støttede filtyper: _.exe_, _.msi_, _.ps1_ .

### Elevation types

Regler kan bruke ulike elevation‑typer, blant annet:

- _Automatic_
- _User confirmed_
- _Support approved_
- _Elevate as current user_

### Viktige prinsipper i Policy Authoring

- Least privilege
- Zero Trust
- Granulær kontroll over hvilke filer som kan kjøres
- Sporbarhet og logging
- Mulighet for support‑godkjenning ved behov

# MD‑102

Policy Authoring er kjernen i EPM og viser hvordan Intune:

- reduserer behovet for lokale administratorer
- gir kontrollert og sporbar elevasjon
- bruker identitet og policyer for å sikre enheter
- støtter Zero Trust gjennom minst mulig privilegier

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

    A[Policy Authoring] --> B[Elevation Settings Policy]
    B --> B1[Enable or disable EPM]
    B --> B2[Default elevation response]
    B --> B3[Reporting level]

    A --> C[Elevation Rules Policy]
    C --> C1[Identify files]
    C --> C2[Validate with hash or certificate]
    C --> C3[Define elevation type]

    A --> D[Elevation Types]
    D --> D1[Automatic]
    D --> D2[User confirmed]
    D --> D3[Support approved]
    D --> D4[Elevate as current user]

    A --> E[Security Principles]
    E --> E1[Least privilege]
    E --> E2[Zero Trust]
    E --> E3[Audit logging]

```


[Managing Elevation Settings for Endpoint Privilege Management - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/epm/manage-elevation-settings)
[Creating elevation rules with Endpoint Privilege Management - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/epm/create-elevation-rules)
