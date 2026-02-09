---
layout: default
title: Apple Device Enrollment Program (DEP)
nav_order:
parent:
has_children:
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/DEP
  - MD-102/Apple
---
DEP er den gamle betegnelsen på Apples automatiske registreringsprogram.
I dag er DEP integrert i ABM, men mange bruker fortsatt navnet.

DEP = Automated Device Enrollment i moderne Apple‑terminologi.

Dette betyr:
- Enheter kjøpt fra Apple eller autoriserte forhandlere blir automatisk knyttet til din ABM‑konto.
- Når enheten starter for første gang, vet den at den tilhører organisasjonen.
- Den registrerer seg automatisk i Intune (eller annet MDM).
- Brukeren kan ikke fjerne MDM‑administrasjonen.

DEP er Apples Autopilot‑ekvivalent.

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