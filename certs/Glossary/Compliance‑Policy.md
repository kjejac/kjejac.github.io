---
layout: default
title: Compliance‑policy
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
  - MD-102/CA
---
**En compliance‑policy er et sett med regler i Microsoft Intune som bestemmer om en enhet oppfyller organisasjonens sikkerhetskrav. Bare enheter som består disse kravene regnes som “compliant” og kan få tilgang til ressurser når dette kombineres med Conditional Access.** 

En compliance-policy brukes til: 

- Sikre at enheter har **korrekt sikkerhetskonfigurasjon** (f.eks. kryptering, passord, OS‑versjon).
- Markere enheter som **compliant** eller **non‑compliant**.
- Integreres med **Conditional Access** for å blokkere eller tillate tilgang basert på enhetens status.

Compliance-policyer er viktig fordi:

- Hindrer at usikre enheter får tilgang til bedriftsdata.
- Gir administratorer oversikt over enhetshelse og sikkerhetsnivå.
- Er en grunnpilar i Zero Trust‑modellen. 

Vanlige krav i en compliance‑policy:

- **Kryptering aktivert** (BitLocker/FileVault)
- **Passord/PIN‑krav**
- **Minimum OS‑versjon**
- **Ingen jailbreak/rooting**
- **Antivirus aktivert**
- **Enheten er Intune‑registrert og rapporterer status**

Dette samsvarer med beste praksis for Intune‑sikkerhet.

Når compliance‑status brukes i Conditional Access, kan du f.eks. kreve:

- _“Bare compliant enheter får tilgang til Microsoft 365.”_
- _“Blokker tilgang hvis enheten ikke har kryptering.”_

https://learn.microsoft.com/en-us/intune/intune-service/protect/device-compliance-get-started
https://blog.admindroid.com/how-to-set-up-device-compliance-policies-in-intune
https://climbtheladder.com/10-intune-compliance-policy-best-practices
