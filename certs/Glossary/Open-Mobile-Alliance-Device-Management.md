---
layout: default
title: Open Mobile Alliance Device Management (OMA-DM)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/OMA-DM
---
_OMA Device Management (OMA‑DM)_ er en standardisert protokoll utviklet av _Open Mobile Alliance_ for fjernstyring av mobile og andre tilkoblede enheter. Den brukes av moderne MDM‑plattformer, inkludert Windows Intune, for å levere policyer, konfigurere enheter og utføre feilsøking over nettverk.

- OMA‑DM er en standard for fjernstyring av enheter.
- Bruker XML‑baserte SyncML‑meldinger over HTTP/HTTPS.
- Støtter provisioning, konfigurasjon, oppdateringer og feildiagnostikk.
- Representerer enheten som et Device Management Tree.
- Har sterke sikkerhetsmekanismer.
- Danner grunnlaget for moderne MDM‑systemer som Intune.

## Hva OMA‑DM er

OMA‑DM er en _protokollsuite_ som muliggjør:

- fjernkonfigurasjon av enheter
- programvare‑ og firmware‑oppdateringer
- feildiagnostikk
- policy‑leveranse
- enhetsprovisjonering

Protokollen bygger på en _klient–server‑modell_, der en DM‑klient på enheten kommuniserer med en DM‑server via _XML‑baserte SyncML‑meldinger_ over HTTP/HTTPS.

## Formål og bruksområder

OMA‑DM er designet for å støtte:
- _provisioning_ (førstegangsoppsett)
- _konfigurasjon av innstillinger_
- _programvareoppdateringer_
- _feilhåndtering og statusrapportering_

Dette gjør protokollen egnet for både mobiltelefoner, nettbrett, IoT‑enheter og enterprise‑klienter som Windows.

## Teknisk arkitektur

OMA‑DM består av tre hoveddeler:

### 1. _Protokoll_

- XML‑baserte SyncML‑meldinger
- Transportuavhengig (HTTP, WSP, OBEX m.fl.)

### 2. _Datamodell_

- Enheten representeres som et _Device Management Tree (DMT)_
- Alle konfigurasjonsnoder adresseres via URI
- Endringer gjøres ved å manipulere noder i treet

### 3. _Policy_

- Definerer hvem som kan endre hvilke parametere
- Sikrer kontroll og autorisasjon

## Sikkerhet

OMA‑DM har innebygde mekanismer for:

- autentisering
- autorisasjon
- integritetssikring
- kryptert kommunikasjon

Dette er kritisk for enterprise‑miljøer der policyer og konfigurasjoner må leveres sikkert.

## Relevans for Intune og Windows

Moderne MDM‑plattformer, inkludert _Microsoft Intune_, bygger på OMA‑DM‑prinsipper for:

- policy‑leveranse
- CSP‑skriving (Configuration Service Providers)
- enhetsrapportering
- diagnostikk (DM‑EDP‑logger, MDM Diagnostic Report)

Dette er ikke eksplisitt nevnt i kildene, men er en _direkte implikasjon_ av at Windows bruker SyncML‑baserte CSP‑noder som er definert i OMA‑DM‑modellen. (Dette er en _inference_ basert på kildene.)

[Mobile Device Management Overview](https://docs.bosch-iot-suite.com/remote-manager/en/Mobile-Device-Management-Overview.html)
[OMA Device Management — Grokipedia](https://grokipedia.com/page/OMA_Device_Management)
[OMA Device Management - Wikipedia](https://en.wikipedia.org/wiki/OMA_Device_Management)
