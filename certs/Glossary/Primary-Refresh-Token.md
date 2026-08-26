---
layout: default
title: Primary Refresh Token (PRT)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/EntraID
  - MD-102/PRT
  - MD-102/PrimaryRefreshToken
  - MD-102/SSO
  - MD-102/EntraIDSSO
  - MD-102/Authentication
---
En _Primary Refresh Token (PRT)_ er en sentral del av autentiseringsmodellen i Microsoft Entra ID. Den fungerer som et _sikkerhetsbundet sesjonsbevis_ som gir _single sign‑on (SSO)_ på Windows‑enheter og andre plattformer. Når en bruker logger inn på en Windows‑enhet, utstedes PRT til Windows’ autentiseringskomponenter (CloudAP/WAM). Deretter brukes den til å hente nye tilgangstoken uten at brukeren må logge inn på nytt.

- PRT = enhetsbundet sesjonstoken for SSO
- Utstedes ved Windows‑innlogging
- Beskyttes av TPM
- Fornyes automatisk
- Brukes av CloudAP/WAM for å hente tokens
- Kritisk for moderne Entra ID‑basert autentisering og Zero Trust

En PRT er et _sikkert, enhetsbundet token_ som:

- utstedes av Entra ID ved første interaktive innlogging
- lagres og beskyttes av TPM på enheten
- brukes av Windows’ token‑brokere (CloudAP/WAM) for å gi SSO til apper som Outlook, Teams, SharePoint og Edge

Hva PRT brukes til

- _Single sign‑on (SSO)_: apper kan hente nye tokens uten passord/MFA
- _Kontinuerlig autentisering_: PRT fornyes automatisk hver 4. time
- _Conditional Access_: PRT kan inneholde CA‑krav som MFA‑claim

Hvordan PRT fungerer i praksis:

1. Brukeren logger inn på Windows
2. CloudAP får en PRT fra Entra ID
3. PRT inneholder en kryptert sesjonsnøkkel
4. WAM/CloudAP bruker PRT til å hente tokens for apper
5. PRT fornyes automatisk så lenge enheten brukes

Sikkerhetsmodell:

- PRT er _TPM‑bundet_, noe som hindrer at den kan kopieres til andre enheter
- Sesjonsnøkkelen i PRT er kryptert med transportnøkkelen
- Microsoft har styrket PRT‑modellen med KDFv2 for å hindre “Pass‑the‑PRT”‑angrep

PRT er viktig fordi:

PRT er selve _broen mellom Windows‑innlogging og Entra ID‑autentisering_. Uten PRT ville brukeren måtte logge inn manuelt i hver app, og Conditional Access‑krav kunne ikke håndheves på enhetsnivå.

https://learn.microsoft.com/en-us/entra/identity/devices/concept-primary-refresh-token
https://endpointweekly.com/blog/entra-primary-refresh-token-prt-deep-dive.html
https://paragmali.com/blog/inside-the-primary-refresh-token-the-cryptographic-seam-betw/