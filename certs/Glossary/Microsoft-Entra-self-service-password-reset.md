---
layout: default
title: Microsoft Entra self-service password reset (SSPR)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/SSPR
---
Self-service password reset (SSPR) er en funksjon i Microsoft Entra ID som lar brukere _tilbakestille eller endre passordet sitt uten hjelp fra IT‑support_. Løsningen gir en trygg, automatisert prosess som reduserer belastningen på helpdesk og sikrer at brukere raskt kan få tilgang igjen dersom de glemmer passordet sitt eller blir låst ute.

### Hvordan SSPR fungerer

Når SSPR er aktivert, kan brukere:
- tilbakestille passordet sitt
- låse opp kontoen sin
- endre eksisterende passord

Dette gjøres via en sikker portal, der brukeren må bekrefte identiteten sin med _registrerte autentiseringsmetoder_.

### Autentiseringsmetoder som støttes

Siden viser at SSPR støtter flere metoder, blant annet:
- Microsoft Authenticator (push/OTP)
- SMS‑koder
- Telefonanrop
- OATH‑tokens (hardware/software)
- Sikkerhetsinformasjon registrert av brukeren

Administrator definerer hvor mange metoder som kreves for å gjennomføre en reset.

### Administrativ kontroll

Administratorer kan:
- kreve at brukere registrerer metoder ved innlogging
- be brukere bekrefte informasjonen sin jevnlig
- konfigurere policyer for hvem som har tilgang til SSPR
- sette opp egen helpdesk‑lenke
- aktivere _password writeback_ for hybrid AD‑miljøer (slik at passord endret i skyen også oppdateres i lokal AD)

### Password writeback (viktig for hybrid)

Hvis organisasjonen bruker lokal AD DS, kan SSPR skrive passordet tilbake til AD via Entra Connect. Dette gjør at brukere i hybridmiljøer får en sømløs opplevelse.

### Brukeropplevelse

Brukere registrerer og administrerer metodene sine via https://aka.ms/sspr_. Hvis de ikke får logget inn, starter de prosessen via _“Can’t access your account”_.