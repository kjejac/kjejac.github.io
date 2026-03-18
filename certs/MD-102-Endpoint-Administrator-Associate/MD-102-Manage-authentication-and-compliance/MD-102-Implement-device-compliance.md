---
layout: default
title: Implement device compliance
nav_order: 3
parent: Uke 4 – Refleksjoner
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Compliance
  - MD-102/Device
  - MD-102/Intune
  - MD-102/MDM
  - MD-102/EntraID
---
## [Introduction](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/1-introduction)

Modulen gir en introdukusjon til _[device compliance](../../Glossary/Compliance‑Policy.md) i Intune_, altså hvordan du definerer, håndhever og følger krav som enheter må oppfylle for å få tilgang til organisasjonens ressurser. 

## [Protect access to resources using Intune](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/2-protect-access-to-resources-using-intune)

Et av de mest sentrale poengene i moderne endepunktadministrasjon er at _tilgangen til organisasjonens ressurser ikke er tilfeldig, den skal være fortjent_. Intune, gjennom MDM-styring og compliance fungerer som er et filter som sikrer at kun enheter som faktisk følger virksomhetens krav får tilgang.

Dette betyr at Intune håndhever alt fra passordkrav og kryptering til MFA og oppdateringsnivå. En enhet som ikke oppfyller kravene, får ikke tilgang til epost, dokumenter etc. før dette er i orden.

Samspillet mellom [_Intune_](../../Glossary/Microsoft-Intune.md) og  beskytter ressurser. Compliance-status kan brukes som ett av flere kriterier i en [Conditional Access](../../Glossary/Conditional-Access.md)-policy, sammen med faktorer som sign-in risiko, enhetstype og plassering. Hvis en enhet ikke er registrert i Intune, kan ikke compliance vurderes. I slike tilfeller kan du velge om brukeren skal blokkeres, omdirigeres  til å registrere enheten, eller få tilgang med et registrert policy-avvik.
Med andre ord kan Intune ikke bare vurdere enheter, men også styre brukeropplevelsen når kravene ikke oppfylles.

Intune administrerer ikke bare enheter, den beskytter aktivt tilgang til organisasjonens ressurser ved å kombinere MDM-styring, compliance og Conditional Access til en sammenhengende sikkerhetsmodell.

## [Explore device compliance policy](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/3-explore-policy)

Compliance-policyer definerer hvilke krav en enhet må oppfylle for å anses som trygg og i tråd med organisasjonens standarder. Når en enhet registrers i Intune, vurderes den automatisk mot policyene som er tildelt brukeren, og statusen rapporteres videre til Intune og Microsoft Entra ID. Dette gjør det mulig å følge enhetens tilstand over tid og bruke informasjonen i både sikkerhetsarbeid og rapportering.

Kravene som kan stilles spenner fra passord og kryptering til OS-versjoner, jailbreak/root-deteksjon og integrasjon med [Mobile Threat Defence (MTD)](../../Glossary/Mobile-Threat-Defense.md) . Policyene er fleksible, en enhet kan markeres som ikke-kompatibel umiddelbart, eller få en definert grace-periode der brukeren kan rette opp avvik. Varsling via epost kan tilpasses med eget innhold og sendes automatisk når enheten faller utenfor kravene.

Compliance kan brukes sammen med Condtional Access for å styre tilgang til organisasjonsdata, men også fungere helt uavhengig dersom målet kun er å overvåke og rapportere status. Policyene tildeles brukere og Entra-grupper, gjerne dynamisk da for å sikre at riktige enheter og brukere alltid får riktige krav. Dynamiske grupper gjør det mulig å styre medlemskap basert på produsent, OS eller avdeling, noe som gir forutsigbar og automatisk policyflyt.

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Enhet registreres i Intune] --> B[Legges automatisk i en Entra‑gruppe]
    B --> C[Compliance‑policy tildeles brukeren]
    C --> D[Intune vurderer enheten mot policykrav]

    D --> E1[Compliant]
    D --> E2[Noncompliant]

    %% Compliant path
    E1 --> F1[Status rapporteres til Intune]
    F1 --> G1[Status synkroniseres til Entra ID]
    G1 --> H1[Kan brukes av Conditional Access]

    %% Noncompliant path
    E2 --> F2[Handlinger for avvik]
    F2 --> I1[Send e‑postvarsel]
    F2 --> I2[Markér som noncompliant etter X dager]

    I2 --> J1[Kan blokkere tilgang via Conditional Access]
    I2 --> J2[Eller gi grace‑periode før blokkering]

    %% Group logic
    B --> K[Entra‑grupper kan være dynamiske]
    K --> K1[Medlemskap basert på attributter]
    K1 --> K2[Automatisk målretting av policyer]

```

## [Deploy a device compliance policy](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/4-deploy-policy)

Implementering av en compliance-policy handler om å sikre at organisasjonen har tydelige, tekniske  krav som alle administrerte enheter må oppfylle. Før policyer kan tas i bruk, må virksomheten ha riktige lisenser ([Entra ID P1/P2](../../Glossary/Microsoft-Entra-ID.md#lisenser-p1-og-p2) og Intune) og enheter som kjører støttede plattformer. Bare enheter som er registrert i Intune kan vurderes for compliance, noe som gjør registreringen til et grunnleggende premiss i hele prosessen.

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Lisenskrav oppfylt<br>Entra ID P1/P2 + Intune] --> B[Støttet plattform<br>Android/iOS/macOS/Windows]
    B --> C[Intune-registrering]
    C --> D[Compliance policies tilgjengelig i Intune]

    D --> E[Konfigurer generelle compliance-innstillinger]
    E --> E1[Behandle enheter uten policy<br>Compliant / Not compliant]
    E --> E2[Enhanced jailbreak detection<br>iOS]
    E --> E3[Compliance status validity<br>30 dager standard]

```

Policyer kan tildeles både bruker- og enhetesgrupper, men bruk av enhetsgrupper gir mer presise rapporter når enheten ikke er registrert av den primære brukeren. I Intune finnes et sett med generelle compliance-innstillinger som påvirker hvordan enheter uten tildelt policy skal behandles, hvor lenge compliance-status er gyldig, og om forbedret jailbreak-deteksjon skal aktiveres for iOS.

![](assets/Pasted%20image%2020260313121844.png)

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Opprettet compliance‑policy] --> B[Velg tildelingsmetode]

    B --> C1[Brukergrupper]
    C1 --> D1[Alle brukerens enheter vurderes]

    B --> C2[Enhetsgrupper]
    C2 --> D2[Anbefalt når primær bruker ikke har registrert enheten]
    D2 --> E2[Mer presis rapportering]

    C1 --> F[Policy aktiv]
    C2 --> F

```

Selve policykonfigurasjonen består av å velge plattform, definere krav som OS-versjon, passordregler, kryptering, antivirus og jailbreak/root-deteksjon, og deretter bestemme hvilke tiltak som skal iverksettes ved avvik. Tiltak kan være alt fra epostvarsler til låsing eller pensjonering av enheten, og kan tidsstyres for å gi brukeren en grace-periode før strengere handlinger trer i kraft.

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Start: Create Policy] --> B[Velg plattform]
    B --> C[Navngi policy]
    C --> D[Konfigurer compliance settings]

    D --> D1[OS‑versjonskrav]
    D --> D2[Passordregler]
    D --> D3[Kryptering]
    D --> D4[Antivirus]
    D --> D5[Jailbreak/root‑deteksjon]

    D --> E[Konfigurer Actions for noncompliance]
    E --> E1[Send e‑postvarsel]
    E --> E2[Fjern/lås enhet]
    E --> E3[Retire device]
    E --> E4[Grace‑periode før tiltak]

    E --> F[Assignments]
    F --> G[Review + Create]

```


```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    %% IMPLEMENTERING
    A[Forutsetninger] --> A1[Entra ID P1/P2 + Intune-lisenser]
    A --> A2[Støttede plattformer<br>Android / iOS / macOS / Windows]
    A --> A3[Intune-registrering kreves]

    A3 --> B[Generelle compliance-innstillinger]
    B --> B1[Mark devices with no policy<br>Compliant / Not compliant]
    B --> B2[Enhanced jailbreak detection<br>iOS]
    B --> B3[Compliance status validity<br>30 dager standard]

    %% POLICYKONFIG
    B --> C[Opprett compliance‑policy]
    C --> C1[Velg plattform]
    C --> C2[Navngi policy]
    C --> C3[Konfigurer compliance settings]

    C3 --> C3a[OS‑versjonskrav]
    C3 --> C3b[Passordregler]
    C3 --> C3c[Kryptering]
    C3 --> C3d[Antivirus]
    C3 --> C3e[Jailbreak/root‑deteksjon]

    C --> D[Actions for noncompliance]
    D --> D1[E‑postvarsel]
    D --> D2[Fjern/lås enhet]
    D --> D3[Retire device]
    D --> D4[Grace‑periode før tiltak]

    %% TILDELING
    D --> E[Tildeling av policy]
    E --> E1[Brukergrupper<br>Alle brukerens enheter vurderes]
    E --> E2[Enhetsgrupper<br>Anbefalt når primær bruker ikke har registrert enheten]

    E --> F[Review + Create]
    F --> G[Policy aktiv og overvåkes i Intune]

```

## [Explore conditional access](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/5-explore-conditional-access)

Conditional Access fungerer som et intelligent kontrollpunkt som vurderer tilgangsforsøk basert på både hvem brukeren er og hvordan tilgangen skjer. Prinsippet bygger på _When this happens -> Then do this_, der et sett med betingelser utløser en definert respons. To forhold er alltid obligatoriske:
- Hvilke brukere som forsøkerå få tilgang
- Hvilke apper som er målet.

I tillegg kan andre faktorer inkluderes, som enhetstype, nettverksplassering eller risiko.

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Bruker forsøker tilgang] --> B[Vurder brukerkontekst]
    B --> B1[Hvem er brukeren]
    B --> B2[Hvilken app forsøkes åpnet]

    B --> C[Vurder betingelser]
    C --> C1[Enhetstype]
    C --> C2[Nettverksplassering]
    C --> C3[Sign‑in risiko]
    C --> C4[Compliance‑status fra Intune]

    C --> D[Evaluer policy]
    D --> E1[Tillat tilgang]
    D --> E2[Krev MFA]
    D --> E3[Krev registrering i Intune]
    D --> E4[Blokker tilgang]

```


Tilgangskontrollen skjer i samspill mellom Intune og Entra ID. Intune leverer informasjon om compliance-status, mens Entra ID evaluerer denne informasjonen opp mot gjeldende Conditional Access-policyer. Dersom kravene ikke er oppfylt, kan tilgangen blokkeres eller det kan kreves ytterlige sikkerhetstiltak, som MFA. Brukren kan også bli bedt om å registrere enheten eller rette opp evt. avvik før tilgang gis.

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Intune vurderer compliance] --> B[Compliance-status sendes til Entra ID]
    B --> C[Conditional Access evaluerer status]
    C --> D1[Tilgang tillates]
    C --> D2[Tilgang krever ekstra tiltak<br>f.eks. MFA]
    C --> D3[Tilgang blokkeres]
    C --> D4[Bruker må registrere enheten<br>eller rette avvik]

```


Conditional Access gir særlig verdi i situasjoner der risikoen varierer. Det kan innebære å kreve MFA for apper med høyere beskyttelsesbehov, skjerpe krav når brukeren befinner seg på et utrygt nettverk, eller begrense Microsoft 365 tilgang til enheter som er administrert og oppfyller organisasjonens krav. Resultatet er en fleksibel og risikobasert tilgangsmodell som støtter [_Zero Trust_-prinsippene](../../Glossary/Zero-Trust.md) og sikrer at bare autoriserte brukere under riktige betingelser får tilgang til virksomhetsdata. 

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Tilgangsforsøk] --> B[Vurder risiko]

    B --> C1[Normal risiko]
    C1 --> D1[Tillat tilgang<br>eller krev MFA]

    B --> C2[Økt risiko]
    C2 --> D2[Krev MFA<br>eller administrert enhet]

    B --> C3[Høy risiko]
    C3 --> D3[Blokker tilgang<br>eller krev passordreset]

    D1 --> E[Beskyttet tilgang]
    D2 --> E
    D3 --> E


```
Conditional Access tilpasser krav etter risiko

## [Create conditional access policies](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/6-create-conditional-access-policies)

Conditional Access bygger på et sett med betingelser og kontroller som avgjør hvordan tilgang til organisasjonsdata skal håndteres. Betingelsene definerer _når_ en policy skal tre i kraft, basert på faktorer som plattform, plassering eller hvilke klientapplikasjoner som brukes. Kontrollene definerer _hva_ skal skje når betingelsene er oppfylt, f.eks å blokkere tilgang eller kreve ekstra sikkerhetstiltak før brukeren får fortsette.


![](assets/Pasted%20image%2020260313125853.png)

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Start: Definer policy] --> B[Velg brukere eller grupper]
    A --> C[Velg skyapper]

    A --> D[Konfigurer betingelser]
    D --> D1[Plattform]
    D --> D2[Plassering]
    D --> D3[Klientapplikasjoner]
    D --> D4[Sign‑in risiko]
    D --> D5[Compliance-status]

    A --> E[Velg kontroller]
    E --> E1[Krev MFA]
    E --> E2[Krev registrering i Intune]
    E --> E3[Blokker tilgang]
    E --> E4[Tillat tilgang med krav]

    E --> F[Policy aktiv]

```

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Intune vurderer compliance] --> B[Compliance-status sendes til Entra ID]
    B --> C[Conditional Access evaluerer betingelser]

    C --> D1[Tillat tilgang]
    C --> D2[Krev MFA eller andre tiltak]
    C --> D3[Blokker tilgang]
    C --> D4[Omdiriger til registrering eller remediating]

    D1 --> E[Sikker tilgang]
    D2 --> E
    D3 --> E
    D4 --> E

```

Policyer konfigureres i Intune-adminsenteret og tildeles brukere eller gruppre, sammen med valgte skyapper som skal omfattes. Dette gjør det mulig å styre tilgang på en målrettet og risikobasert måte. Conditional Access kan også brukes mot [_Exchange ActiveSync (AES)_](../../Glossary/Exchange-ActiveSync.md) , slik at tilgang til epost styres etter samme prinsipper. Når dette kombineres med compliance-krav, sikres det at bare administrerte og godkjente enheter får tilgang til Exchange-data, både lokalt og i skyen.

Integrasjonen mellom Intune, Exchange og Entra ID gjør det mulig å blokkere ukjente eller ikke-administrerte enheter, kreve registrering, eller veilede brukeren gjennom nødvendige steg for å oppfylle kravene. Intune Exchange-connectoren synkroniserer ActiveSync-poster og kobler dem til Intune-administrerte enheter, slik at tilgang kan styres konsekvent og automatisk.

![](assets/Pasted%20image%2020260313125916.png)

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TD

    A[Bruker forsøker å få tilgang til e‑post] --> B[Exchange ActiveSync registrerer forespørsel]
    B --> C[Entra ID mottar forespørsel]

    C --> D[Evaluer CA-policyer]
    D --> D1[Krev MFA]
    D --> D2[Krev Intune-registrering]
    D --> D3[Blokker tilgang]
    D --> D4[Tillat tilgang]

    C --> E[Intune Exchange Connector]
    E --> F[Synkroniser ActiveSync-enheter]
    F --> G[Koble til Intune-administrerte enheter]

    D1 --> H[Kontrollert tilgang]
    D2 --> H
    D3 --> H
    D4 --> H

```


## [Module assessment](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/7-knowledge-check)

1. _Which of the following items is a synchronization protocol that allows mobile phone users to access their email, calendar, contacts, and tasks, and continue to access this information when they're working offline?_

	Exchange ActiveSync

2. _As the Desktop Administrator for World Wide Importers, Alan Deyoung wants to create Conditional Access policies to provide granular access control over organizational data while allowing users to work from essentially any device and location. In which of the following scenarios will Conditional Access be especially beneficial for World Wide Importers?_

	Enabling employees to use a corporate application on their personal device

## [Summary](https://learn.microsoft.com/en-us/training/modules/implement-device-compliance/8-summary)

Device compliance policies gir en strukturert måte å sikre at krav til sikkerhet og drift etterleves uten å skape unødvendig friksjon for brukerne. Krav som minimum OS‑versjon, passordregler eller kryptering kan defineres på forhånd, og brukeren får selv velge når det passer å gjennomføre nødvendige endringer. Samtidig kan Conditional Access begrense tilgangen til organisasjonsressurser så lenge kravene ikke er oppfylt. Når brukeren har gjort det som kreves, fjernes restriksjonene umiddelbart, noe som skaper en forutsigbar og brukervennlig sikkerhetsmodell.

- Compliance fungerer som _grunnmuren_ i hele sikkerhetsmodellen for moderne administrasjon
- Det er her Intune og Entra ID (Conditional Access) _kobles sammen i praksis_
- Det er avgjørende å forstå _hvordan enheter vurderes_, og hva som skjer når krav ikke oppfylles
