---
layout: default
title: Public key infrastructure (PKI)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/PKI
---
Public Key Infrastructure (PKI) er et rammeverk som brukes til å utstede, administrere og validere digitale sertifikater. Sertifikatene brukes for kryptering, autentisering og digital signering, og er grunnlaget for sikker kommunikasjon i moderne IT‑miljøer.

### Hva PKI består av
- _Asymmetrisk kryptering_: Et nøkkelpar med privat nøkkel (holdes hemmelig) og offentlig nøkkel (deles med andre).
- _Certificate Authority (CA)_: En betrodd instans som utsteder og signerer sertifikater.
- _Digitale sertifikater_: Binder en offentlig nøkkel til en identitet (person, enhet eller tjeneste).
- _CRL/OCSP_: Mekanismer for å tilbakekalle sertifikater som ikke lenger er gyldige.

### Hva PKI brukes til
- _Kryptering_: sikrer at bare riktig mottaker kan lese data.
- _Autentisering_: bekrefter identiteten til brukere, enheter eller tjenester.
- _Digital signering_: sikrer integritet og ikke‑benektelse (non‑repudiation).
- _Autorisasjon_: muliggjøres etter at identiteten er verifisert.

### Hvorfor dette er relevant for MD‑102
- I Windows‑miljøer brukes PKI blant annet til:
- Windows Hello for Business (sertifikatbasert WHfB)
- Wi‑Fi og VPN‑autentisering
- S/MIME for e‑postsignering og kryptering
- Autentisering av enheter i AD/Entra‑miljøer
- Sikring av kommunikasjon mellom tjenester (TLS)

PKI er spesielt viktig når organisasjoner krever sertifikatbasert autentisering i stedet for passord eller FIDO2‑nøkler.