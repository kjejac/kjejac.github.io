---
layout: default
title: Network Policy Server (NPS)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/NPS
---
Network Policy Server (NPS) er Microsofts implementasjon av _RADIUS‑standarden_ og brukes til å _autentisere, autorisere og loggføre_ nettverkstilgang på tvers av organisasjonen. NPS gir et sentralt punkt for styring av hvem som får tilgang til nettverket, hvordan de får tilgang, og hvordan tilkoblingene registreres.

## Hva NPS gjør

NPS kan brukes på tre måter:

### 1. RADIUS‑server

NPS kan fungere som en fullverdig RADIUS‑server som håndterer:

- autentisering av brukere
- autorisering basert på nettverkspolicyer
- accounting (logging) av tilkoblinger

Dette gjelder for:

- VPN
- trådløst nettverk (802.1X)
- autentiserende switcher
- dial‑up og router‑til‑router‑forbindelser

NPS bruker _Active Directory_ eller lokal SAM som brukerdatabase.

### 2. RADIUS‑proxy

NPS kan også fungere som en mellomstasjon som _videresender_ RADIUS‑forespørsler til andre RADIUS‑servere. Dette brukes når:

- forespørsler skal rutes til riktig domene
- man har flere RADIUS‑servere og vil lastbalansere
- man trenger autentisering mot databaser utenfor AD
- man håndterer brukere i andre skoger eller utenfor tillitsforhold

### 3. RADIUS‑accounting

NPS kan logge tilkoblingsdata til:

- lokale tekstfiler
- SQL Server (lokal eller ekstern)

Dette gir sentralisert logging av nettverkstilgang.

## Når NPS brukes

Typiske scenarier:

- VPN‑autentisering (inkludert Always On VPN)
- 802.1X trådløst og kablet nettverk
- Outsourcede nettverkstjenester som trenger sentral autentisering
- Miljøer med mange nettverkstilgangspunkter som krever én felles policy

## Viktige punkter om NPS

- NPS installeres som del av _Network Policy and Access Services (NPAS)_.
- NPAS er kun tilgjengelig på _Server with Desktop Experience_, ikke Server Core.
- NPS kan kombineres: samme server kan være både RADIUS‑server og RADIUS‑proxy.
- Tidligere NAP‑funksjoner er fjernet fra Windows Server 2016 og nyere.

[Network Policy Server (NPS) overview | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/networking/technologies/nps/nps-top)