---
layout: default
title: Compliance in Intune
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
  - MD-102/Compliance
  - MD-102/DefenderEndpoint
  - MD-102/Device
  - MD-102/CA
  - MD-102/EntraID
---
_Compliance policies_ i Microsoft Intune brukes til å definere hvilke krav en enhet eller bruker må oppfylle for å anses som «kompatibel». Dette er en sentral del av Zero Trust‑modellen, fordi kompatibilitet brukes som et signal i Conditional Access for å avgjøre om tilgang skal gis, blokkeres eller kreve ekstra sikkerhetstiltak.

Ifølge Microsoft Learn beskrives compliance slik:

- Compliance policies _«define the rules and settings that a device must comply with to be considered compliant»_
- Compliance status brukes av Conditional Access for å _«allow or block access to organizational resources»_
- Compliance kan inkludere krav som _«encryption, password, OS version, threat level, and security settings»_

Compliance fungerer sammen med:

- _Device configuration_ (innstillinger)
- _Defender for Endpoint_ (trusselnivå)
- _Conditional Access_ (tilgangskontroll)
- _Entra ID_ (identitet og policy enforcement)

## Hva compliance policies kan inneholde

Typiske krav:

- Enheten må være kryptert (BitLocker)
- Enheten må ha passord/PIN
- Enheten må kjøre en minimum Windows‑versjon
- Enheten må ikke være jailbreaket/rooted
- Enheten må ha oppdatert antivirus og antimalware
- Enheten må ikke ha høy risiko i Defender for Endpoint

## Hvordan compliance brukes i praksis

1. Enheten evalueres mot compliance‑policyen.
2. Intune rapporterer status: _Compliant_, _Non‑compliant_, _Not evaluated_ eller _Error_.
3. Conditional Access bruker statusen til å bestemme tilgang.
4. Brukeren kan få krav om å rette opp avvik før tilgang gis.

Dette gir en dynamisk og sikker modell for tilgangsstyring.

## MD‑102

- Det er en av kjernedelene i moderne administrasjon.
- Det er tett integrert med Conditional Access.
- Det er en av de viktigste mekanismene for Zero Trust.
- Det er en av de mest brukte policytypene i Intune.