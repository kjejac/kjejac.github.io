---
layout: default
title: Administrative Templates (AT)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/ADMX
  - MD-102/GPO
  - MD-102/IME
---
Administrative Templates (AT) i Intune er **skyversjonen av klassiske ADMX‑baserte Group Policy‑innstillinger**. De gir tilgang til et stort sett av Windows‑ og applikasjonsinnstillinger som tradisjonelt kun har vært tilgjengelig via GPO.

AT fungerer ved at Intune **emulerer ADMX‑maler** og leverer dem til klienten via **Intune Management Extension (IME)**.

## Hva de brukes til

Administrative Templates brukes primært til:

- **Office‑innstillinger** (Outlook, OneDrive, Office‑telemetri osv.)
- **Microsoft Edge‑innstillinger**
- **OneDrive Known Folder Move (KFM)**
- **Windows‑policyer som ikke finnes i Settings catalog**
- **Legacy‑innstillinger som kun finnes i ADMX‑format**

Dette gjør AT nyttige i hybrid‑miljøer eller når man migrerer fra GPO til Intune.

## Hvordan de fungerer teknisk

Administrative Templates:

- bygger på **ADMX/ADML‑filer** som Microsoft publiserer i skyen
- leveres via **Intune Management Extension (IME)**
- skriver innstillinger til **HKCU/HKLM‑registry**
- krever at brukeren logger inn for HKCU‑policyer
- viser innstillinger i Intune som en **flat liste**, ikke som et ADMX‑tre

Dette skiller dem fra Settings catalog, som bruker CSP‑noder og OMA‑DM.

## Fordeler

- Enkel migrering fra GPO → Intune
- Støtter et stort antall Windows‑ og Office‑innstillinger
- Krever ingen OMA‑URI‑skriving
- Godt egnet for applikasjonspolicyer (Office, Edge, OneDrive)

## Begrensninger

- Avhengig av **Intune Management Extension**
- Ikke like moderne som Settings catalog
- Noen innstillinger krever omstart eller logoff
- Kan være tregere å levere enn CSP‑baserte policyer
- Ikke tilgjengelig for alle plattformer (kun Windows)

## Når du bør bruke Administrative Templates

Bruk AT når:

- du trenger **Office‑innstillinger**
- du trenger **Edge‑innstillinger** som ikke finnes i Settings catalog
- du migrerer fra GPO og vil ha tilsvarende innstillinger
- du trenger **registry‑baserte** innstillinger som ikke finnes som CSP

Bruk **Settings catalog** når:

- du vil ha moderne, CSP‑baserte innstillinger
- du vil ha konfliktanalyse
- du vil ha bred plattformstøtte
- du vil ha raskere leveranse og bedre rapportering

https://learn.microsoft.com/en-us/mem/intune/configuration/administrative-templates
https://learn.microsoft.com/en-us/mem/intune/configuration/administrative-templates-admx
https://learn.microsoft.com/en-us/mem/intune/fundamentals/intune-management-extension

