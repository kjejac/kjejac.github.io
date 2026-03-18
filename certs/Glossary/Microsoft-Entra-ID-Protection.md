---
layout: default
title: Microsoft Entra ID Protection
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
---
Microsoft Entra ID Protection er en sikkerhetstjeneste som oppdager, undersøker og håndterer identitetsbaserte risikoer i organisasjonen. Den analyserer enorme mengder signaler fra Microsofts økosystem og bruker disse til å identifisere mistenkelig aktivitet knyttet til brukere og pålogginger.

### Hva tjenesten gjør
Oppdager risiko ved hjelp av sanntidsanalyser av pålogginger og brukeratferd.
Eksempler på risikoer:
	- anonyme IP‑adresser
	- password spray‑angrep
	- lekkede legitimasjoner
	- umulige reiser og andre avvik
- Vurderer risiko for hver pålogging og hver bruker, og tildeler et risikonivå som brukes i policyer.
- Gir rapporter som hjelper administratorer å forstå og undersøke hendelser:
	- Risk detections
	- Risky sign-ins
	- Risky users

### Hvordan risiko håndteres
Entra ID Protection støtter både automatisk og manuell risikohåndtering:
#### Automatisk
- Integreres med Conditional Access for å kreve tiltak som MFA, sterkere autentisering eller passordreset.
- Når brukeren fullfører tiltaket, reduseres risikoen automatisk.

#### Manuell
- Administratorer kan gjennomgå risikoer i portalen, via API eller i Defender XDR.
- Mulige handlinger:
	- Dismiss
	- Confirm safe
	- Confirm compromise

### Bruk av data
Data kan eksporteres til andre systemer for videre analyse, som:
- SIEM (f.eks. Microsoft Sentinel)
- Log Analytics
- Event Hubs
- Arkivlagring

API‑tilgang via Microsoft Graph gjør det mulig å automatisere og integrere risikoovervåking i egne løsninger.

### Roller og lisenser
- Krever Microsoft Entra ID P2‑lisens for full funksjonalitet.
- Ulike roller gir ulik tilgang, fra lesetilgang (Security Reader) til full administrasjon (Security Administrator).