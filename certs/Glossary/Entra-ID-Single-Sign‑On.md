---
layout: default
title: Entra ID Single Sign-On (SSO)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/SSO
  - MD-102/EntraID
  - MD-102/EntraIDSSO
  - MD-102/SecureBoot
  - MD-102/CA
  - MD-102/PRT
  - MD-102/PrimaryRefreshToken
---

_Entra ID Single Sign‑On (SSO)_ gjør at brukeren kan autentiseres én gang og deretter få tilgang til Microsoft 365‑ressurser, apper og tjenester uten å måtte logge inn på nytt. SSO bygger på en kombinasjon av:
- _Primary Refresh Token (PRT)_
- _TPM 2.0_ (for sikker nøkkellagring)
- _Secure Boot_ (for plattformintegritet)
- _Entra ID‑registrering_ av enheten

Når disse kravene er oppfylt, kan Windows‑klienten automatisk hente tokens fra Entra ID og gi sømløs tilgang til apper som Outlook, Teams, OneDrive, Edge og alle moderne autentiseringsflyter.

### Hva SSO betyr i praksis

- Brukeren slipper gjentatte innlogginger
- Token‑fornyelse skjer automatisk via PRT
- Enheten anses som “trusted” av Entra ID
- Conditional Access‑policyer kan bruke enhetens identitet som signal

Entra ID SSO er direkte avhengig av maskinvarestatusen du ser under _Hardware_ i Intune:
- TPM 2.0 må være aktiv
- Secure Boot må være aktiv
- Enheten må være Entra‑registrert eller Entra‑joined

Hvis disse kravene ikke er oppfylt, vil SSO ikke fungere, og brukeren må autentisere seg manuelt oftere.


- Microsoft Learn – _Single Sign‑On (SSO) overview_ `https://learn.microsoft.com/en-us/entra/identity/devices/concept-primary-refresh-token` [(learn.microsoft.com in Bing)](https://www.bing.com/search?q="https%3A%2F%2Flearn.microsoft.com%2Fen-us%2Fentra%2Fidentity%2Fdevices%2Fconcept-primary-refresh-token")
- Microsoft Learn – _How SSO works with PRT_ `https://learn.microsoft.com/en-us/entra/identity/devices/concept-primary-refresh-token#sso-with-prt` [(learn.microsoft.com in Bing)](https://www.bing.com/search?q="https%3A%2F%2Flearn.microsoft.com%2Fen-us%2Fentra%2Fidentity%2Fdevices%2Fconcept-primary-refresh-token%23sso-with-prt")
- Microsoft Learn – _Device identity and SSO_ `https://learn.microsoft.com/en-us/entra/identity/devices/device-identity` [(learn.microsoft.com in Bing)](https://www.bing.com/search?q="https%3A%2F%2Flearn.microsoft.com%2Fen-us%2Fentra%2Fidentity%2Fdevices%2Fdevice-identity")