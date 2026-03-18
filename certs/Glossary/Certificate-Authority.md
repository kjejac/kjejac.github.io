---
layout: default
title: Certificate Authority (CA)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CA
---
En Certificate Authority (CA) er kjernen i en PKI‑løsning og fungerer som den tillitsinstansen som utsteder, signerer og administrerer digitale sertifikater. CA bekrefter identiteten til brukere, enheter eller tjenester og binder denne identiteten til en offentlig nøkkel i et sertifikat.

Hva en CA gjør:
- Utsteder digitale sertifikater etter at identiteten er verifisert (ofte via en RA – Registration Authority).
- Signerer sertifikater med sin egen private nøkkel, slik at andre kan stole på dem.
- Publiserer sin offentlige nøkkel, slik at sertifikater kan valideres.
- Lagrer og administrerer sertifikater, inkludert gyldighet og metadata.
- Tilbakekaller sertifikater via CRL eller OCSP når de ikke lenger er gyldige.

### Hvorfor CA er viktig
CA er fundamentet for tillit i PKI. Når en enhet eller bruker presenterer et sertifikat, stoler mottakeren på det fordi det er signert av en CA som begge parter anerkjenner som troverdig. Dette gjør CA kritisk for:
- autentisering
- kryptering
- digital signering
- sikker kommunikasjon mellom tjenester, brukere og enheter

### Relevans for MD‑102
I Microsoft‑miljøer brukes CA blant annet til:
- Windows Hello for Business (sertifikatbasert WHfB)
- Wi‑Fi/VPN‑autentisering
- S/MIME for e‑post
- Enhetsautentisering i AD/Entra‑miljøer
- TLS/SSL for sikre tjenester

CA er altså en nøkkelkomponent når organisasjoner krever sertifikatbasert autentisering i stedet for passord eller FIDO2‑nøkler.