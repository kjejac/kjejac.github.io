---
layout: default
title: Point-to-Point Tunneling Protocol (PPTP)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/PPTP
  - MD-102/VPN
---
_PPTP (Point‑to‑Point Tunneling Protocol)_ er en _eldre VPN‑protokoll_ som i dag regnes som _utdatert og usikker_. Den ble brukt for å lage en kryptert tunnel over internett, men har en rekke kjente svakheter.

I MD‑102‑sammenheng er det viktig å vite at:

- PPTP _ikke lenger anbefales_ for moderne Windows‑miljøer
- Protokollen har _kjente sårbarheter_ i både autentisering (MS‑CHAPv1/v2) og kryptering (RC4)
- Microsoft selv fraråder bruk av PPTP
- Moderne alternativer som _L2TP/IPsec_, _IKEv2_, _SSTP_ og _Always On VPN_ er foretrukket

For MD-102 er det viktig å vite:

- konfigurere sikre tilkoblinger
- forstå hvilke protokoller som er trygge
- velge riktige VPN‑løsninger for organisasjonen

PPTP et _klassisk eksempel på en protokoll du bør unngå_, og som ofte nevnes i sammenheng med:

- teknisk gjeld
- migrering fra gamle løsninger
- sikkerhetsforbedringer i moderne Windows‑miljøer

[Point-to-Point Tunneling Protocol - Wikipedia](https://en.wikipedia.org/wiki/Point-to-Point_Tunneling_Protocol)