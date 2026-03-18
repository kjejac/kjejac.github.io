---
layout: default
title: Exchange ActiveSync (EAS)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/AES
---
Exchange ActiveSync er en protokoll utviklet for å synkronisere e‑post, kalender, kontakter og oppgaver mellom mobile enheter og Exchange‑servere. Den er optimalisert for mobile nettverk med lav båndbredde og høy latenstid, og gir en sømløs brukeropplevelse både online og offline.

### Kjernefunksjoner

- _Push‑basert synkronisering_ Leverer e‑post og kalenderoppdateringer i sanntid uten manuell oppdatering.
- _Offline‑tilgang_ Data caches lokalt slik at brukeren kan lese og jobbe uten nett.
- _Sikker kommunikasjon_ Bruker SSL‑kryptering og støtter administrativ _remote wipe_ ved tap eller tyveri.
- _Enhetskontroll_ Administratorer kan godkjenne, blokkere eller overvåke enheter som kobler seg til Exchange.

### Fordeler

- _Enkel konfigurasjon_ på tvers av plattformer
- _Bred kompatibilitet_ med de fleste mobile enheter
- _God brukeropplevelse_ gjennom sanntidssynkronisering og offline‑støtte

### Relevans for MD‑102

I MD‑102‑kontekst er EAS viktig fordi:

- Det er en av de vanligste måtene mobile enheter kobler seg til Exchange‑data.
- Conditional Access kan brukes til å kontrollere EAS‑tilgang basert på compliance, risiko eller enhetsstatus.
- Intune Exchange Connector kan synkronisere EAS‑enheter og knytte dem til Intune‑administrerte enheter for bedre kontroll.
- EAS er ofte inngangspunktet for å blokkere ukjente eller ikke‑administrerte enheter og tvinge registrering i Intune.