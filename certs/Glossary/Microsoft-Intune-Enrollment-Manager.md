---
layout: default
title: Intune Enrollment Manager
nav_order:
parent:
has_children:
nav_exclude: true
has_toc:
tags:
  - MD-102
  - MD-102/IntuneEnrollmentManager
  - MD-102/EndpointManagement
---
## Hva er en DEM‑konto (Device Enrollment Managers)?
- En _ikke‑administratorbruker_ som kan registrere mange enheter i [Intune](../../Glossary/Microsoft-Intune.md).
- DEM‑kontoer kan registrere _opptil 1 000 enheter_, mens vanlige brukere kun kan registrere _15_.
- Brukes typisk når IT skal klargjøre mange enheter før de deles ut.

## Når trenger man ikke DEM?
Vanlige brukere kan registrere mer enn 15 enheter hvis man bruker:
- Co‑management med Configuration Manager
- Automatisk registrering + Group Policy
- Windows Autopilot

## Støttede registreringsmetoder
DEM‑kontoer kan registrere enheter via:
- Bulk enrollment (provisioning package)
- Company Portal
- Microsoft Entra Join

## Krav
- Du må være _Intune Administrator_ for å opprette eller fjerne DEM‑kontoer.
- DEM‑kontoen må ha Intune‑lisens og Entra‑bruker.

## Viktige begrensninger
DEM‑kontoer har flere begrensninger, blant annet:
- _Android Enterprise_: Kan kun registrere 10 personlig eide work‑profile‑enheter. Støtter ikke corporate‑owned eller AOSP.
- _Apple ADE_: Ikke støttet.
- _App‑distribusjon_: Ingen bruker er knyttet til enheten, så apper kan ikke distribueres som _Available_.
- _Sertifikater_: Må bruke enhetsbaserte sertifikater.
- _Conditional Access_: Kun støttet på Windows 10 1803+ og Windows 11.
- _Entra Join/Registration_: Ikke støttet på iOS, iPadOS og macOS.
- _Device limits_: DEM‑enheter registreres som _shared devices_, så vanlige enhetsgrenser gjelder ikke.
- _Company Portal_: Bare den lokale enheten vises, og brukere kan ikke selv wipe enheten.
- _VPN_: Brukerbaserte VPN‑profiler fungerer ikke.
- _Maks antall DEM‑kontoer_: 150 per tenant.