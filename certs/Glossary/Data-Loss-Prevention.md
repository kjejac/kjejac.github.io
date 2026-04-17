---
layout: default
title: Data Loss Protection (DLP)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/DLP
---
_Data Loss Prevention DLP beskytter sensitiv informasjon ved å identifisere, overvåke og automatisk forhindre at data deles med feil mottakere. Det brukes for å hindre utilsiktet eller uautorisert deling av data på tvers av Microsoft 365 tjenester, enheter og nettverk._

### Data Loss Prevention DLP

DLP er en teknologi som hjelper organisasjoner med å _hindre at sensitiv informasjon deles med personer som ikke skal ha tilgang_. Dette gjelder blant annet finansielle data, helseopplysninger, kredittkortnumre og andre identifikatorer.

DLP fungerer ved å bruke _DLP‑policyer_ som identifiserer, overvåker og automatisk beskytter data på tvers av tjenester og enheter.

## Hvordan DLP fungerer

Microsoft Purview DLP bruker _avansert innholdsanalyse_, ikke bare enkel tekstskanning. Den analyserer:

- primære datatreff som nøkkelord
- regulære uttrykk
- funksjonsvalidering
- sekundære datatreff i nærheten av primære
- maskinlæring for mønstergjenkjenning

DLP‑policyer kan:

- blokkere handlinger
- varsle brukeren
- sende varsler til administrator
- automatisk beskytte data (for eksempel kryptering eller begrensning av deling)

### Hvor DLP brukes

DLP kan overvåke og beskytte data i:

- _Microsoft 365 tjenester_ som Exchange, SharePoint, OneDrive og Teams
- _Office‑apper_ som Word, Excel og PowerPoint
- _Windows 10 og 11 enheter_
- _macOS_ (siste tre versjoner)
- _ikke‑Microsoft skytjenester_
- _on‑premises filområder_

I tillegg finnes _Inline DLP_ som overvåker data som sendes til uadministrerte skytjenester via Microsoft Edge for Business.

### Hva DLP beskytter mot

DLP hindrer blant annet:

- utilsiktet deling av sensitive filer
- opplasting av data til uautoriserte skytjenester
- kopiering eller utskrift av sensitiv informasjon
- deling av sensitiv informasjon i e‑post eller Teams

### MD‑102 relevans

- er en _kjernekomponent i Microsoft Purview_ for databeskyttelse
- beskytter data _i bruk, i bevegelse og i hvile_
- fungerer på tvers av tjenester, apper og enheter
- bruker avansert innholdsanalyse for å redusere falske positiver
- er et viktig lag i en _Zero Trust strategi_

DLP er spesielt viktig i moderne miljøer der ansatte jobber på tvers av enheter, apper og lokasjoner.