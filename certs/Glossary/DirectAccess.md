---
layout: default
title: DirectAccess
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/DirectAccess
---
DirectAccess er en teknologi i Windows Server som gir _sømløs og alltid‑på tilgang_ til organisasjonens interne nettverksressurser for domenejoinede klienter. I motsetning til tradisjonell VPN trenger ikke brukeren å starte eller stoppe en tilkobling, klienten kobler seg automatisk til når den har internettforbindelse.

## Hva DirectAccess gjør

- Gir fjernbrukere kontinuerlig tilgang til interne ressurser uten manuell VPN‑pålogging.
- Lar IT‑administratorer _administrere og oppdatere klientmaskiner eksternt_, så lenge de er på internett.
- Bruker IPv6‑tunneler og IPsec for sikker kommunikasjon.
- Krever at klientene er _domenejoinet_ og kjører en Enterprise‑utgave av Windows.

## Støttede klientoperativsystemer

Ifølge siden støttes DirectAccess av:
- Windows 11 Enterprise
- Windows 10 Enterprise
- Windows 10 Enterprise 2015 LTSB
- Windows 8.1 Enterprise

## Viktige begrensninger

- Microsoft anbefaler _Always On VPN_ i stedet for DirectAccess for nye implementeringer.
- Remote Access‑rollen (som DirectAccess bygger på) _kan ikke brukes på Azure‑VM‑er_.


[DirectAccess](https://learn.microsoft.com/en-us/windows-server/remote/remote-access/directaccess/directaccess)