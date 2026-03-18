---
layout: default
title: FIDO2
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD102/FIDO2
---
FIDO2 er en åpen standard for passordløs autentisering som bruker **phishing‑resistente, kryptografiske nøkler** i stedet for passord. Når en bruker registrerer seg hos en FIDO2‑støttet tjeneste, genererer enheten et nøkkelpar: en **offentlig nøkkel** som sendes til tjenesten, og en **privat nøkkel** som lagres sikkert lokalt på enheten.

Ved innlogging sender tjenesten en unik utfordring som signeres med privatnøkkelen. Dette gjør at innloggingen ikke kan stjeles eller gjenbrukes, og beskytter mot phishing, replay‑angrep og kompromitterte servere.

FIDO2 fungerer med både **plattform‑godkjennere** (som Windows Hello) og **roaming‑godkjennere** (som sikkerhetsnøkler). Løsningen gir sterk sikkerhet, bedre personvern og en enklere brukeropplevelse, og er fullt støttet i Microsoft Entra ID.

[Hva er FIDO2?](https://www.microsoft.com/nb-no/security/business/security-101/what-is-fido2?msockid=28996c4bc5706aa332647a05c44c6bd0)
