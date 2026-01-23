---
title: Enterprise Desktop Lifecycle
nav_order:
parent:
has_children:
nav_exclude: true
tags:
  - MD-102/EDL
---
Enterprise Desktop Lifecycle beskriver livssyklusen til selve enheten og dens rolle i virksomheten; _Hvordan enheten lever, brukes og vedlikeholdes gjennom hele sin levetid._
- hvordan en desktop brukes i virksomheten
- hvordan den administreres i drift
- hvordan den sikres
- hvordan den oppdateres
- hvordan den til slutt avhendes


_Enterprise Desktop Life-cycle_-modellen er en etablert enhetslivssyklus som sikrer at virksomheten har riktig teknologi tilgjengelig slik at brukerne er produktive og utstyr som når slutten av levetiden ikke blir en belastning. Ved bruk av BYOD i virksomheten, blir også disse en del av livssyklusen.

Fordelene ved å bruke denne modellen:
- Støtte brukere på tvers av enheter og lokasjoner
- Arbeide mer effektivt med færre ressurser
- Sikre at enheter er produktive og ikke blir en risiko ved end-of-life
- Inkludere både bedrifts- og private enheter 

Livssyklusen består av fasene:
- _Planlegging_: Utarbeide strategi for systemadministrasjon
- _Innkjøp_: Behandle bestilling og godkjenne fakturaer
- _Distribusjon_: Installere OS, registrere, distribusjon av apper
- _Drift_: Sikre at systemene fungerer og er beskyttet
- _Brukerstøtte_: Lære opp brukere og gi nødvendig støtte
- _Oppgradering og avhending_: Erstatte enhenter, fjerne utdatert maskinvare eller avregistrere enheter

### Planning 
Består av stegene:
- _Strategi for enheter_: Standardisering av image og maskinvare, design av miljøet, utskiftningsfrekvens, bruk av mobile enheter vs stasjonære, og BYOD-policyer
- _Valg av enheter_: Velge maskinvære, programvare og tilbehør. Inkluderer designvalg og testing av applikasjonskompabilitet
- _Distribusjonsmetoder_: Ulike metoder har ulike kostnader. Vurder om en skybasert dekker behovene, og hvilke krav som gjelder for registrering av enheter i administrasjon
- _Etterspørselsmetoder_: Forutsi fremtidige behov for datakraft og utstyr
- _Designkonfigurasjon_: Ta stilling til hvilke nye funksjoner som skal tas i bruk, og hvordan de skal integreres i planen. Nye verktøy og innstillinger kan forenkle konfigurasjonsprosessen.
### Purchasing
Innkjøp handler om å skaffe personell, tjenester, utstyr eller materiell fra leverandører. Prosessen inkluderer forhandlinger, kontrakter, leverandørhåndtering, frakt og håndtering av emballasje.

Faktorer som påvirker kostnadene:
- _Maskinvare_: Utgjør ofte rundt halvparten av kostnadene i denne fasen
- _Programvare_: Kostnader for produktivitetsverktøy, antivirus og kommunikasjonsverktøy
- _Tilbehør_: Kabler, strømforsyninger, tastatur, mus, laptop-vesker, docking, adgangskort osv.
- _Distribusjonsprosessen_: Valgt metode påvirker kostnadene direkte. Ekstra kostnader kan være lagringsplass, USB-pinner, båndbredde for distribusjon av store image-filer
- _Klargjøring av maskinvare_: Sørg for nok plass til mottak av utstyret, sikker lagring,  utpakking, inspisering og registrering.

### Deployment
Utrulling omfatter alle aktiviteter som ut gjør en enhet klar til bruk. Prosessen består av to hovedfaser, _Building_ og _Deploying_.

#### Building
Forberede en standardisert og effektiv grunnkonfigurasjon for OSet. 
- _Strømlinjeforme prosessen_: Automatiser mest mulig for en raskere og konsistent utrulling
- _Utvikle utrullingsmetoden_: Tradisjonell imaging (baseline image) vs Moderne metoder (Autopilot base config)
- _Testing_: Test på VMer og fysisk maskinvare for å avdekke feil 
- _Konfigurasjon_: Utvikle automatisering, teste, planlegge nettverkstilgang, annet IT-arbeid
- _Logistikk_: Lagring, oppsett av fysisk maskinvare, kommunikasjon med brukere og evt forhåndskonfigurasjon hos leverandør

#### Deployment
Utrulling skjer ofte i faser, når den enkelte fase er stabil går man videre. Punkter som valideres er blant annet:
- enhetsprofiler
- image-konfigurasjon
- sluttbrukeropplevelse
- applikasjonsdistribusjon

#### Enrollment 
Eksisterende enhet registreres i virksomheten og konfigurert etter kravene, ofte via Autopilot.
Brukes for: 
- Windows 10/11 enheter (uten reinstallasjon)
- Mobilenheter
- BYOD

Krav kan variere mellom grupper, f.eks. strengere PIN‑krav eller deaktivert skybackup for organisasjonseide enheter, og mer fleksible krav for BYOD.

#### Data Migration
Mange organisasjoner bruker Microsoft 365 / OneDrive for å redusere behovet for manuell migrering av data.
Punkter for migreringen kan være
- _Flytt viktige data til skyen før utrulling_: Verktøy som _Known Folder Move_ (KFM) kan benyttes
- _Bruk in-place upgrade_: Bruk kun re-imaging når det ikke er andre valg
- _Bruk USMT (User State Migration Tool)_: Migrerer brukerkontoer, OS konfigurasjon og app-innstillinger. Støtter både enhetsbytte og refresh.

### Plan an application deployment
Planleggingen består av tre hovedfaser:
- _Applikasjonsinventar og kompatibilitet_
- _Applikasjonspakking_
- Livssyklusstøtte

#### Application inventory and compatibility
Applikasjonskompatiblitet kan påvirke hele virksomheten. God planlegging reduserer risikoen
- Windows-oppgraderinger påvirker sjelden kompatibiliteten, men unntak finnes (f.eks. antivirus)
- Første steg er å samle et _applikasjonsinventar_
- Verktøy som [_Microsoft Intune Suite](Microsoft-Intune-Suite.md) kan kartlegge applikasjoner
- I store miljøer bør det gjennomføres kompatibilitetsprosjekt for å redusere antall apper
- Standardisering av applikasjonsversjoner reduserer kompleksitet og kostnader
- Nye apper kan erstatte gamle, fjerner lisens og supportkostnader
- Hele miljøet kan analyseres for kompatibilitet

#### Application packaging
Gjøre klar apper for automatisert installasjon
- Bruk stille installasjonskommander fra leverandør (`/silent`, `/help`, `/?`)
- Interne apper kan kreve egen pakking eller repakking
- Kan lage Windows installer pakker (MSI)
- App-V fases ut i 2026 til fordel for Azure Virtual Desktop + MSIX app attach som et moderne alternativ.

#### Application life-cycle support
- Distribuere nye apper
	- Test alltid kompatibilitet mot eksiterende apper
- Installere nye versjoner
	- Mer komplekst enn oppdateringer
	- Krever grundig planlegging og testing
- Oppdater apper
	- Vanligere og krever mindre testing enn versjonsoppgradering

#### Application Delivery
Apper kan leveres på flere måter:
- Automatisk installasjon (under utrulling eller basert på grupper)
- Selvbetjening via portal (On Demand)
- Vurder støtte for apper på BYOD
	- Vanlige scenarier: epost på mobil, line-of-business (LOB)-apper

#### [Microsoft Intune](Microsoft-Intune.md)
Har støtte for sentralisert administrasjon av apper:
- Støtter mange installasjonstyper (Office, MSI, Win32, LOB-apper, innebygde apper)
- Kan beskytte data vi app-policyer ([MAM](Mobile-Application-Management-(MAM).md))
- Sikrer at kun compliant enheter får tilgang til appdata

#### Virtual Application Delivery
Brukes når klienten ikke kan kjøre appen lokalt
- Apper kjøres på server eller Cloud PC
- [Azure Virtual Desktop](Azure-Virtual-Desktop-(AVD).md) eller [Windows 365](Windows-365.md) gir full desktop opplevelse
- Nyttig for midlertidige brukere 

### Plan for upgrades and retirement
Virksomheter må avgjøre når enheter skal oppgraderes eller tas ut av bruk. Vurderingen baseres på:
- alder
- ytelse
- kostnad ved oppgradering vs fortsatt bruk
- behov for lagringsplass til enheter skal oppgraderes eller klargjøres
- behov for å gi nye ansatte ferdig utstyr

Programvare kan ofte oppgraderes direkte på brukers enhet, men versjonsoppgraderinger krever mer planlegging enn vanlige oppdateringer.
#### Retirement
Utfasing av utstyr er en naturlig del av livssyklusen. Målet er å fjerne gamle systemer uten å forstyrre driften.
Hensyn som må tas er:
- Hente inn gamle enheter med minst mulig forstyrrelse (gjerne utenom normal arbeidstid)
- Klargjøre enheter for videresalg eller gjenbruk
- Sikre at ingen sensitive data følger med ut av organisasjonen
- Bruke verktøy for sikker sletting av HDD, også i bulk
- Administrativ håndtering: registrering, avhending, salg
- Pakking, frakt og logistikk
- Vudere restverdi (laptoper har ofte høyere verdi enn stasjonære)
- Noen organisasjoner donerer utstyr til veldedighet

#### BYOD and Unenrollment
I BYOD-scenarier kan brukere:
- bytte enhet
- slutte i organisasjonen
IT må håndtere virksomhetens data på brukers private enhet!

Tiltak som kan gjøres:
- _Full sletting fjerner alt_: kontoer, data, policyer, innstillinger brukes når enheten er tapt eller ikke lenger er i bruk
- I BYOD er full wipe ofte uakseptabelt, siden bruker mister private data
- Intune kan utføre selektiv sletting av kun jobbdata og jobbapper
- Plattform (iOS/Android/Window) påvirker hva som er mulig
- Policyer for datalagring bør være kjent for brukeren før enheten registreres