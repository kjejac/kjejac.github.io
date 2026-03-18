---
layout: default
title: Remote Access
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/RemoteAccess
---
Remote Access‑rollen i Windows Server er en samling tjenester som gjør det mulig å gi brukere og enheter sikker tilgang til interne nettverksressurser, enten de er på kontoret eller eksternt. Rollen består av tre hovedkomponenter som kan installeres hver for seg eller sammen.

## 1. DirectAccess og VPN (RAS)

Denne delen av rollen gir fjernbrukere tilgang til organisasjonens nettverk.

**VPN (RAS):**

- Bruker internett + tunneler + kryptering for å koble eksterne klienter til interne ressurser.
- Støtter Always On VPN, som gir automatisk og vedvarende tilkobling.
- Passer for moderne Windows‑klienter.
    

**DirectAccess:**

- Gir sømløs, alltid‑på tilgang uten at brukeren må starte VPN manuelt.
- IT kan administrere klienter så lenge de er på internett.
- Anbefales kun for eldre klienter (før Windows 10).

## 2. Routing service

Routing‑tjenesten gjør Windows Server til en fullverdig ruter.
Den støtter:

- NAT
- BGP
- RIP
- IGMP (multicast)
- Demand‑dial routing
- Unicast IP‑routing

Kan kjøres på fysisk maskin eller Hyper‑V‑VM.

## 3. Web Application Proxy

Web Application Proxy fungerer som en reverse proxy for interne webapplikasjoner.

Den tilbyr:
- Publisering av interne apper til eksterne brukere
- Forhåndsautentisering via AD FS
- Mulighet til å fungere som AD FS‑proxy

## Viktig begrensning

Remote Access‑rollen **kan ikke brukes på Azure‑VM‑er**. Du kan ikke deploye VPN, DirectAccess eller andre Remote Access‑funksjoner i en Azure‑VM.