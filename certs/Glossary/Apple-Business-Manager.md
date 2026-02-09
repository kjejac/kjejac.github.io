---
layout: default
title: Apple Business Manager
nav_order:
parent:
has_children:
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/ABM
  - MD-102/Apple
---
Apple Business Manager (ABM) er Apples skyportal for organisasjoner. Det er her du:
- administrerer Apple‑enheter (iPhone, iPad, Mac, Apple TV)
- administrerer Apple‑ID‑er for ansatte (Managed Apple IDs)
- kjøper og distribuerer apper (Volume Purchase Program – VPP)
- kobler Apple‑enheter til MDM‑systemer som Intune

ABM er Apple sin versjon av _Entra ID + Autopilot + app‑katalog_.

### DEP/ABM kobling mot Intune
- Du kobler ABM til Intune via en MDM‑token.
- Enheter kjøpt gjennom godkjent kanal dukker automatisk opp i ABM.
- Du tilordner enhetene til Intune‑MDM‑profilen.
- Når enheten starter → den hopper inn i Automated Device Enrollment.
- Intune tar over administrasjonen uten at brukeren trenger å gjøre noe.

Dette gir:
- Zero‑touch onboarding
- Sikrere enheter (bruker kan ikke fjerne MDM)
- Standardisert oppsett
- Mindre supportbehov