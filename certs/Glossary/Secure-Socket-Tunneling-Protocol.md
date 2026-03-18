---
layout: default
title: Secure Socket Tunneling Protocol (SSTP)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/VPN
  - MD-102/SSTP
---
_SSTP (Secure Socket Tunneling Protocol)_ er en VPN‑protokoll fra Microsoft som sender PPP‑trafikk gjennom en _SSL/TLS‑kanal over TCP port 443_. Dette gjør at SSTP fungerer gjennom nesten alle brannmurer og proxyer, siden trafikken ser ut som vanlig HTTPS.

I MD‑102‑sammenheng er dette det viktigste:

- _Sikker protokoll_: Bruker SSL/TLS for kryptering, nøkkelforhandling og integritet.
- _Fungerer gjennom de fleste nettverk_: Går over TCP 443 -> svært brannmur‑vennlig.
- _Integrert i Windows_: Full støtte i Windows Vista SP1 og nyere, inkludert RRAS.
- _Støtter sterke autentiseringsmetoder_: EAP‑TLS, MS‑CHAP osv.
- _Brukes primært for klient‑til‑site VPN_, ikke site‑til‑site.
- _Kan lide av TCP‑over‑TCP‑problemer_ (TCP meltdown) hvis båndbredden er dårlig.
- _Støtter kun brukerautentisering_, ikke enhetsautentisering.

[Secure Socket Tunneling Protocol - Wikipedia](https://en.wikipedia.org/wiki/Secure_Socket_Tunneling_Protocol)