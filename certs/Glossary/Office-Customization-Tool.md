---
layout: default
title: Office Customization Tool (OCT)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Apps
  - MD-102/Office
  - MD-102/Microsoft365Apps
---
_Office Customization Tool (OCT)_ er et nettbasert verktøy som brukes til å _lage og tilpasse configuration.xml‑filer_ for [Office Deployment Tool (ODT)](Office-Deployment-Tool.md) . Det gir administratorer en grafisk måte å konfigurere Office‑installasjoner uten å skrive XML manuelt.

OCT brukes til å definere:

- hvilke Office‑produkter som skal installeres
- hvilke språk som skal inkluderes
- oppdateringskanal (Monthly, Semi Annual osv.)
- lisensiering og aktivering
- fjerning av eldre MSI‑baserte Office‑versjoner
- appinnstillinger og policyer
- installasjonsopplevelse (for eksempel stille installasjon)

Når konfigurasjonen er ferdig, genererer OCT en _configuration.xml_ som brukes av ODT til å laste ned og installere Office.

Dette gjør OCT ideelt for:

- Intune distribusjoner
- Configuration Manager
- manuelle installasjonsskript
- miljøer som trenger konsistent Office‑konfigurasjon

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

    %% OCT-seksjon
    A[Start i Office Customization Tool] --> B[Velg produkter<br>Microsoft 365 Apps, Visio, Project]
    B --> C[Velg språk<br>Flere språk mulig]
    C --> D[Velg oppdateringskanal<br>Monthly, Semi Annual osv.]
    D --> E[Konfigurer innstillinger<br>Aktivering, lisens, appvalg]
    E --> F[Fjern MSI versjoner<br>Valgfritt]
    F --> G[Konfigurer oppdateringer<br>Policyer og kontroll]
    G --> H[Generer configuration.xml]

    %% Overgang til ODT
    H --> I[Bruk filen med ODT<br>/download og /configure]

    %% ODT-seksjon
    I --> J[Office Deployment Tool<br>setup.exe]
    J --> K{Velg modus}
    K --> K1["/download"<br>Laste ned Office-filer]
    K --> K2["/configure"<br>Installere eller oppdatere Office]
    K --> K3["/configure"<br>Fjerne MSI-versjoner]

    K1 --> L[Distribuer via Intune, MECM eller skript]
    K2 --> L
    K3 --> L

    L --> M[Office installert med ønsket konfigurasjon]

```