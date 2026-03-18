---
layout: default
title: Layer 2 Tunneling Protocol (L2TP)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/VPN
  - MD-102/L2TP
---
_L2TP (Layer 2 Tunneling Protocol)_ er en VPN‑tunneleringsprotokoll som _ikke gir kryptering i seg selv_. Den brukes derfor nesten alltid sammen med IPsec, og da kalles løsningen _L2TP/IPsec_.

I MD‑102‑sammenheng er dette det viktigste:

- _L2TP alene er ikke sikkert_ – det mangler kryptering.
- _L2TP/IPsec er den faktiske VPN‑løsningen_ som brukes i Windows‑miljøer.
- IPsec gir:
    - kryptering
    - autentisering
    - integritet
- Bruker UDP 1701 (L2TP), og med IPsec også UDP 500, UDP 4500 og ESP.
- Støttet i Windows i mange år og fortsatt relevant i enkelte miljøer, men moderne alternativer som _IKEv2_, _SSTP_ og _Always On VPN_ foretrekkes.

[Layer 2 Tunneling Protocol - Wikipedia](https://en.wikipedia.org/wiki/Layer_2_Tunneling_Protocol)