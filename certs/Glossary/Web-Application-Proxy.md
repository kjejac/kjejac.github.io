---
layout: default
title: Web Application Proxy (WAP)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/WebApplicationProxy
---
Web Application Proxy (WAP) er en Windows Server‑rolle som fungerer som en reverse proxy for å publisere interne webapplikasjoner til eksterne brukere på en sikker måte. Den står vanligvis i DMZ og håndterer trafikk mellom internett og interne tjenester, ofte i samarbeid med AD FS for forhåndsautentisering.

## Hva Web Application Proxy gjør

- Publiserer interne applikasjoner slik at de kan nås utenfra.
- Støtter forhåndsautentisering via AD FS, inkludert HTTP Basic for apper som ActiveSync.
- Kan publisere apper med wildcard‑domener, for eksempel for SharePoint‑miljøer.
- Utfører automatisk HTTP‑til‑HTTPS‑omdirigering.
- Støtter pass‑through publisering av rene HTTP‑applikasjoner.
- Kan publisere Remote Desktop Gateway.
- Har forbedrede logger for feilsøking og bedre audit‑muligheter.
- Kan videresende klientens IP‑adresse til backend‑applikasjonen.