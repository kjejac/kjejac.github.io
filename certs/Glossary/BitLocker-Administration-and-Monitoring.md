---
layout: default
title: BitLocker Administration and Monitoring (MBAM)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/MBAM
---
MBAM er en løsning for administrasjon av BitLocker i større miljøer. Den gir sentral styring av policyer, automatisert lagring av gjenopprettingsnøkler, samsvarsrapportering og selvbetjente portaler for brukere. Løsningen består av webportaler, SQL databaser, utvidede gruppepolicyer og en klientagent som håndhever kryptering og rapporterer status. MBAM støtter både frittstående og distribuert arkitektur og brukes ofte i miljøer med mange tusen klienter.

_MBAM er i utvidet støtte frem til april 2026_. Funksjonaliteten videreføres i Configuration Manager BitLocker Management og i Intune for skybasert administrasjon. Organisasjoner bør planlegge migrasjon basert på om de ønsker en hybrid eller skybasert plattform.

## Future of BitLocker Enterprise Management

MBAM fases ut. Microsoft anbefaler Intune for skybasert administrasjon og Configuration Manager for hybridmiljøer. Moderne løsninger gir bedre integrasjon, enklere drift og fremtidssikker administrasjon.

## The Problem MBAM Solves

MBAM løser tre hovedutfordringer i store miljøer:

- gjenopprettingsnøkler blir vanskelige å håndtere i stor skala
- manglende rapportering gjør det krevende å dokumentere samsvar
- policyer blir ujevnt håndhevet uten sentral kontroll

MBAM automatiserer nøkkelhåndtering, gir detaljerte rapporter og sikrer at alle enheter følger samme krypteringskrav.

## MBAM vs Modern Alternatives

MBAM sammenlignes med moderne løsninger som Configuration Manager BitLocker Management og Intune. Moderne løsninger gir bedre integrasjon, skybasert nøkkellagring, enklere administrasjon og aktiv utvikling. MBAM fungerer fortsatt, men er en eldre løsning som fases ut.

_For MD 102 er det viktig å forstå at Intune er Microsofts anbefalte løsning for fremtiden._

## MBAM Architecture and Components

MBAM består av:

- webportaler for brukere og IT
- SQL databaser for samsvar og gjenopprettingsnøkler
- gruppepolicyer som utvider BitLocker konfigurasjon
- en klientagent som håndhever policyer og rapporterer status

Arkitekturen kan skaleres fra små miljøer til store distribuerte installasjoner.

## MBAM Deployment Requirements

Installasjon krever Windows Server, SQL Server, IIS og nødvendige gruppepolicyer. Klienter må ha BitLocker støtte og MBAM agent installert. TPM anbefales for sterkest beskyttelse. Nettverkstilkobling til MBAM serverne er nødvendig for rapportering og nøkkeleskrow.

## Migration from MBAM to Modern Solutions

Migrasjon krever at eksisterende nøkler eksporteres og importeres i Configuration Manager eller at enheter flyttes til Intune. Det anbefales en pilotfase og gradvis overgang. MBAM bør ikke kjøre samtidig med moderne policyer på samme enheter.

## BitLocker Policy Configuration via MBAM

MBAM gir avansert kontroll over BitLocker, inkludert:

- valg av krypteringsmetode
- krav til TPM og PIN
- regler for faste og flyttbare datavolumer
- unntak for enheter med maskinvarebegrensninger

Dette gir enhetlig og forutsigbar kryptering i hele organisasjonen.

## Recovery Key Management

MBAM håndterer gjenopprettingsnøkler automatisk. Nøkler lagres i en sikker database, og både IT og brukere kan hente dem via portaler. Alle nøkkeloppslag logges for revisjon. Dette reduserer belastningen på brukerstøtte og styrker sikkerheten.

## Compliance Monitoring and Reporting

MBAM tilbyr omfattende rapporter som viser krypteringsstatus, avvik, maskinvarekrav og nøkkeloppslag. Dette er viktig for revisjon, sikkerhetsarbeid og etterlevelse av regelverk.

## Troubleshooting and Common Issues

Vanlige problemer inkluderer manglende rapportering, feil ved nøkkeleskrow og autentiseringsfeil i portaler. Feil løses ofte ved å kontrollere gruppepolicyer, nettverkstilkobling, tjenestekontoer og SQL tilkoblinger.

## Security Best Practices

Anbefalinger inkluderer:

- kryptering av databaser
- minst mulig privilegier for tjenestekontoer
- bruk av HTTPS
- regelmessig gjennomgang av tilgang til portaler
- overvåking av nøkkeloppslag

Dette reduserer risikoen for misbruk av gjenopprettingsnøkler.

## Integration with Enterprise Security Stack

MBAM integreres med Active Directory, Configuration Manager, Defender for Endpoint og SIEM løsninger. Dette gir bedre oversikt og mulighet for korrelasjon av sikkerhetshendelser.

## Real-World Implementation Scenarios

MBAM brukes i helse, finans, offentlig sektor og utdanning for å sikre store mengder klienter. Selvbetjente portaler og sentral rapportering er særlig nyttige i miljøer med mange brukere og strenge krav.

