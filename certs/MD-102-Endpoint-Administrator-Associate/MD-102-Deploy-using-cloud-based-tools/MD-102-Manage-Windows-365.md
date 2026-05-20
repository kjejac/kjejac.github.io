---
layout: default
title: Manage Windows 365
nav_order: 4
parent: Uke 7 – Refleksjoner
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Windows365
  - MD-102/Windows11
  - MD-102/License
  - MD-102/EA
  - MD-102/CSP
  - MD-102/EntraID
  - MD-102/VNet
  - MD-102/CloudPC
  - MD-102/Provisioning
  - MD-102/GPO
  - MD-102/MDM
  - MD-102/Intune
  - MD-102/EndpointAnalytics
  - MD-102/Security
  - MD-102/CA
  - MD-102/MFA
  - MD-102/EntraHybridJoin
  - MD-102/DefenderEndpoint
  - MD-102/ANC
---
# [Manage Windows 365](https://learn.microsoft.com/en-us/training/modules/manage-windows-365/)

## [Introduction](https://learn.microsoft.com/en-us/training/modules/manage-windows-365/1-introduction/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.deploy-cloud-based-tools)

_Windows 365_ gir brukere en personlig og sikker Windows 11 opplevelse som kan brukes fra hvilken som helst enhet.Løsningen kombinerer fleksibiliteten til virtuelle klienter med enkelheten fra moderne administrasjon. Den gjør det mulig å levere en fullverdig Windows klient uten behov for lokal maskinvare, og passer godt for organisasjoner som ønsker skalerbarhet, sikker tilgang og enhetlig administrasjon. 

Administrasjon av Windows 365 skjer gjennom kjente verktøy som Endpoint Manager, der admins kan konfigurere, sikre og overvåke cloud PCer på samme måte som fysiske klienter. Sikkerhetsmodellen bygger på Microsoft 365 plattformen og gir beskyttelse gjennom identitet, tilgangskontroll og moderne sikkerhetsfunksjoner.

Windows 365 tilbyr flere utrullingsalternativer og lisensmodeller som gjør det mulig å tilpasse løsningen til ulike behov, fra enkeltbrukere til store organisasjoner. Målet er å gi konsistent og sikker Windows opplevelse uavhengig av hvor brukeren befinner seg.

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
flowchart LR

    A[Windows 365] --> B[Personlig Windows 11 opplevelse]
    A --> C[Tilgang fra hvilken som helst enhet]
    A --> D[Administrasjon i Endpoint Manager]
    D --> E[Konfigurasjon og sikkerhet]
    A --> F[Fleksible utrullingsalternativer]
    A --> G[Lisensmodeller tilpasset behov]

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

flowchart LR

    A[Windows 365] --> B[Personlig og sikker Windows 11 opplevelse]
    A --> C[Tilgang fra hvilken som helst enhet]
    A --> D[Skybasert administrasjon]

    %% Funksjoner
    A --> E[Nøkkelfunksjoner]
    E --> E1[Full Windows klient i skyen]
    E --> E2[Alltid oppdatert og tilgjengelig]
    E --> E3[Integrert med Microsoft 365]

    %% Administrasjon
    A --> F[Administrasjon]
    F --> F1[Konfigureres i Endpoint Manager]
    F --> F2[Policyer og apper administreres som fysiske klienter]
    F --> F3[Overvåking og innsikt]

    %% Sikkerhet
    A --> G[Sikkerhetsmodell]
    G --> G1[Bygger på Microsoft 365 sikkerhet]
    G --> G2[Identitet og tilgangskontroll]
    G --> G3[Beskyttelse med moderne sikkerhetsfunksjoner]

    %% Utrulling
    A --> H[Utrullingsalternativer]
    H --> H1[Standard image eller egendefinert image]
    H --> H2[Automatisert provisjonering]
    H --> H3[Skalerbar for små og store miljøer]

    %% Lisens
    A --> I[Lisensiering]
    I --> I1[Flere lisensmodeller]
    I --> I2[Valg basert på behov og kapasitet]
    I --> I3[Støtte for ulike brukergrupper]

    %% Mål
    A --> J[Mål for løsningen]
    J --> J1[Forenkle administrasjon]
    J --> J2[Gi fleksibel tilgang]
    J --> J3[Øke sikkerhet og produktivitet]

```

## [Explore Windows 365](https://learn.microsoft.com/en-us/training/modules/manage-windows-365/2-explore-windows-365/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.deploy-cloud-based-tools)

_Windows 365_ gir hver bruker en personlig Cloud PC som kjører en full Windows opplevelse i skyen. Løsningen gir økt produktivitet, sikkerhet og fleksiblitet, og gjør det mulig å levere en komplett Windows klient uten lokal maskinvare. Cloud PCer opprettes automatisk når en _lisens tildels_, og brukeren får en dedikert virtuell maskin som kan nås fra hvilken som helst enhet.

Windows 365 er tilgjenglig i to forskjellige utgaver som dekker ulike behov i organisasjoner.

### Windows 365 Business

_Windows 365 Business_ er laget for organisasjoner med opptil 300 brukere. Det kreves ingen forhåndslisenser, og det er ingen avhengighet til Azure eller AD. Cloud PCer provisjoneres automatisk med et standard image, og administrasjonen er enkel. Brukere kan _stare, tilbakestille_ og _feilsøke_ fra Windows 365 portalen. Business støtter tilgang fra alle plattformer og gir en standard brukerrolle som kan endres ved behov.

Business har begrenset administrasjon, ingen støtte for GPO eller avansert [Intune](../../Glossary/Microsoft-Intune.md) styring, og ingen innebygd overvåkning. Sikkerhetsfunksjoner som [Conditional Access](../../Glossary/Conditional-Access.md) og [Defender](../../Glossary/Microsoft-Defender-for-Endpoint.md) krever egne lisenser.

 [Getting started with Windows 365 Business and Cloud PCs](https://learn.microsoft.com/en-us/windows-365/business/get-started-windows-365-business)

### Windows 365 Enterprise

_Windows 365 Enterprise_ er laget for store organisasjoner og støtter et ubegrenset antall brukere. Denne utgaven gir mulighet til å bruke egne images, avansert provisjonering, nettverksvalg og full Intune integrasjon. _Enterprise_ bruker [Entra ID](../../Glossary/Microsoft-Entra-ID.md) og kan også bruke AD.

_Enterprise_ gir full administrasjonskontroll, inkludert policyer, Windows Update, apper, overvåkning, feilsøking, resizing av Cloud PCer og tilgang til _on premise_ ressurser.

_Enterprise_ krever Windows Enterprise, Intune og Entra ID P1 for hver bruker.

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
flowchart LR

    A[Windows 365] --> B[Cloud PC for hver bruker]
    A --> C[Full Windows opplevelse i skyen]
    A --> D[Tilgang fra hvilken som helst enhet]

    B --> E[Windows 365 Business]
    E --> E1[For mindre organisasjoner]
    E --> E2[Ingen krav til Azure eller AD]
    E --> E3[Automatisk provisjonering med standard image]
    E --> E4[Enkel administrasjon og begrenset styring]

    B --> F[Windows 365 Enterprise]
    F --> F1[For større organisasjoner]
    F --> F2[Egendefinerte images og avansert provisjonering]
    F --> F3[Intune integrasjon og full administrasjon]
    F --> F4[Bruk av Entra ID og AD DS]

```

<a href="/certs/diagrams/deploy-w365-diff.html" target="_blank" rel="noopener">Stort diagram</a>


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

flowchart LR

    A[Windows 365] --> B[Cloud PC for hver bruker]
    A --> C[Økt produktivitet og sikkerhet]
    A --> D[Fleksibel og skalerbar løsning]

    B --> E[To utgaver: Business og Enterprise]

    %% Business
    E --> F[Windows 365 Business]
    F --> F1[Laget for små organisasjoner]
    F --> F2[Ingen krav til Azure eller AD]
    F --> F3[Kjøpes via Microsoft 365 Admin Center]
    F --> F4[Automatisk provisjonering med standard image]
    F --> F5[Begrenset administrasjon]

    %% Enterprise
    E --> G[Windows 365 Enterprise]
    G --> G1[Laget for større organisasjoner]
    G --> G2[Støtter egne images og avansert provisjonering]
    G --> G3[Integrert med Intune]
    G --> G4[Bruker Microsoft Entra ID og AD DS]
    G --> G5[Ubegrenset antall brukere]

    %% Sammenligning
    A --> H[Administrasjon og funksjoner]
    H --> H1[Business: enkel administrasjon]
    H --> H2[Enterprise: full Intune styring]
    H --> H3[Enterprise støtter GPO, MDM, resizing, overvåking]

    %% Sikkerhet
    A --> I[Sikkerhet]
    I --> I1[Conditional Access]
    I --> I2[Microsoft Defender for Endpoint]
    I --> I3[Sikkerhetsbaselines i Enterprise]

    %% End user
    A --> J[Brukeropplevelse]
    J --> J1[Standard brukerrolle som kan endres]
    J --> J2[Tilgang via Windows 365 portal eller Remote Desktop]
    J --> J3[Fungerer på alle plattformer]

    %% Nettverk og lisens
    A --> K[Lisens og nettverk]
    K --> K1[Business: ingen lisenskrav]
    K --> K2[Enterprise: krever Windows Enterprise, Intune og Entra ID P1]
    K --> K3[Ulike datagrense nivåer basert på RAM]

```

<a href="/certs/diagrams/deploy-w365.html" target="_blank" rel="noopener">Stort diagram</a>

## [Configure Windows 365](https://learn.microsoft.com/en-us/training/modules/manage-windows-365/3-configure-windows-365/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.deploy-cloud-based-tools)

Konfigurasjonen skjer i Intune og består av fire hovedoppgaver: 
1. tildele lisenser
2. opprette Azure nettverkstilkobling
3. velge / last opp image
4. opprette provisjoneringspolicyer

Når dette er på plass, behandles Cloud PCer som vanlige enheter og kan administreres med de samme profilene og appdistribusjonene som fysiske klienter.

### Assign licenses to users

Brukere må tildeles en Windows 365 lisens før de kan få en Cloud PC. Lisenser kan tildes enkeltbrukere eller grupper. Når lisensen er aktiv, kan brukeren provisjoneres automatisk.

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
flowchart TB
    A[Tildel Windows 365 lisens] --> B[Velg bruker eller gruppe]
    B --> C[Velg Windows 365 produkt]
    C --> D[Bruk Assign for å aktivere lisensen]
    D --> E[Bruker kan provisjoneres]

```

### Create an Azure network connection

[Azure network connection (ANC)](../../Glossary/Azure-network-connection.md) brukes når Cloud PCer skal kobles til organisasjonens domene og få tilgang til lokale ressurser. Dette krever et virtuelt nettverk i Azure med forbindelse til DC. Oppsettet inkluderer valg av abo, ressursgruppe, nettverk, subnet, og domenekonto.

![](assets/Pasted-image-20260505190511.png)

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
flowchart TB
    A[Start opprettelse av ANC] --> B[Velg abonnement og ressursgruppe]
    B --> C[Velg virtuelt nettverk og subnett]
    C --> D[Oppgi AD domain og OU]
    D --> E[Legg inn servicekonto]
    E --> F[Fullfør og opprett tilkobling]

```

[Create Azure network connection](https://learn.microsoft.com/en-us/windows-365/enterprise/create-azure-network-connection)
[Edit Azure network connection](https://learn.microsoft.com/en-us/windows-365/enterprise/edit-azure-network-connection)
[Delete Azure network connection](https://learn.microsoft.com/en-us/windows-365/enterprise/delete-azure-network-connection)

### Configure a custom device image (optional)

Windows 365 tilbyr ferdige images som oppdateres månedlig. Disse inkluderer optimaliseringer og evt Microsoft 365 apps. Organisasjoner som trenger egne tilpasninger kan laste opp inntil 20 egendefinerte images i Azure og bruke dem i provisjoneringspolicyer.

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
flowchart TB
    A[Velg galleriimage eller lag eget] --> B[Galleriimage med månedlige oppdateringer]
    A --> C[Egendefinert image lastes opp i Azure]
    C --> D[Legg til image i Intune]
    D --> E[Image kan brukes i provisjoneringspolicy]

```

1. [Add or delete custom device images](https://learn.microsoft.com/en-us/windows-365/enterprise/add-device-images)

### Create provisioning policies

Provisjoneringspolicyer bestemmer hvordan Cloud PCer opprettes. Policyen definerer netterkstilkobling, image og hvilke grupper som skal få Cloud PCer. Når policyen er aktiv opprettes Cloud PCer automatisk for brukere med gyldig lisens.

![](assets/Pasted-image-20260505191149.png)

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
flowchart TB
    A[Start ny policy] --> B[Gi policy navn]
    B --> C[Velg ANC]
    C --> D[Velg image type]
    D --> E[Velg grupper som skal få Cloud PC]
    E --> F[Opprett policy]
    F --> G[Cloud PC opprettes automatisk]

```

1. [Create provisioning policies](https://learn.microsoft.com/en-us/windows-365/enterprise/create-provisioning-policy)

### Configure and apply device and app configuration profiles

Når en Cloud PC er provisjonert, administreres de som fysiske enheter. Intune profiler, apper og policyer kan brukes på samme måte som ellers. Dette gir en enhetlig administrasjonsmodell for både fysiske og virtuelle klienter.

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
flowchart TB
    A[Cloud PC provisjonert] --> B[Bruk Intune profiler]
    B --> C[Tildel apper til brukere og grupper]
    C --> D[Administrasjon som fysisk enhet]

```

### Business vs Enterprise

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
flowchart LR

    A[Configure Windows 365] --> B[Business]
    A --> C[Enterprise]

    %% Business
    B --> B1[Standard image]
    B --> B2[Ingen Azure nettverkstilkobling]
    B --> B3[Ingen egendefinerte images]
    B --> B4[Enkel provisjonering]
    B --> B5[Begrenset administrasjon]

    %% Enterprise
    C --> C1[Azure nettverkstilkobling]
    C --> C2[Egendefinerte images]
    C --> C3[Avanserte provisjoneringspolicyer]
    C --> C4[Full Intune administrasjon]
    C --> C5[Domeneintegrasjon og lokale ressurser]

```

## [Administer Windows 365](https://learn.microsoft.com/en-us/training/modules/manage-windows-365/4-administer-windows-365/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.deploy-cloud-based-tools)

Dette gjelder i praksis _Enterprise_, da administrasjon skjer gjennom Intune. _Business_ har ikke full Intune integrasjon og støtter derfor ikke de fleste handlingene som beskrives her.

Cloud PCer administreres som vanlige enheter, og admin kan bruke profiler, apper, oppdateringer og sikkerhetspolicyer på samme måte som på fysiske enheter. Cloud PCer har i tillegg tre unike handlinger:
- reprovisioning
- Resize
- Collect diagnostic

### Remote actions

Cloud PCer støtter vanlige fjernhandliger som restart, sync, rename, quick scan, full scan og Defender oppdatering. I tillegg har de tre som er spesifikke for Cloud PCer; reprovisioning, resize og collect diagnostics. Disse handlingene krever Intune administrasjon og er derfor knyttet til Enterprise.

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
flowchart LR
    A[Remote actions] --> B[Restart]
    A --> C[Sync]
    A --> D[Rename]
    A --> E[Quick scan]
    A --> F[Full scan]
    A --> G[Update Windows Defender]

    A --> H[Unike Cloud PC handlinger]
    H --> H1[Reprovisioning]
    H --> H2[Resize]
    H --> H3[Collect diagnostics]

```

### Reprovisioning

_Reprovisioning_ oppretter en helt ny Cloud PC basert på provisjoneringspolicyen. Dette brukes når en Cloud PC oppfører seg uforutsigbart eller når en ren start er nødvendig. Brukeren må sikre egne data da prosessen ikke beholder apper eller filer.

![](assets/Pasted-image-20260505193153.png)

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
flowchart LR
    A[Reprovisioning] --> B[Cloud PC tilbakestilles til starttilstand]
    B --> C[Data og apper beholdes ikke automatisk]
    C --> D[Anbefalt å sikre data først]

    A --> E[Bruksscenarier]
    E --> E1[Test av ulike konfigurasjoner]
    E --> E2[Cloud PC oppfører seg uforutsigbart]
    E --> E3[Bruker ønsker en ren Cloud PC]

    A --> F[Prosess]
    F --> F1[Intune > Devices > Cloud PC > Reprovision]
    F --> F2[Velg Yes]
    F --> F3[Nytt Cloud PC opprettes]
    F --> F4[Bruker mottar ny tilgang]

```

### Resize a Cloud PC

_Resize gjør det mulig å oppgradere RAM, CPU og lagringsplass_. Det er kun mulig å øke lagringsstørrelsen. Handlingen krever riktige roller, tilgjengelige lisenser og at brukeren er logget ut. 

![](assets/Pasted-image-20260505193351.png)

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
flowchart LR
    A[Resize Cloud PC] --> B[Oppgrader RAM]
    A --> C[Oppgrader CPU]
    A --> D[Øk lagringsplass]

    D --> D1[Lagring kan kun økes]

    A --> E[Krav]
    E --> E1[Global Admin eller Intune Service Admin]
    E --> E2[Cloud PC må være provisioned]
    E --> E3[Bruker må være logget ut]

    A --> F[Prosess]
    F --> F1[Intune > Devices > Cloud PC > Resize]
    F --> F2[Velg tilgjengelig SKU]
    F --> F3[Velg Resize]
    F --> F4[Bruker kobles fra og PC restartes]

    A --> G[Lisenser]
    G --> G1[Bruker betalte lisenser først]
    G --> G2[Deretter trial lisenser]
    G --> G3[Feil hvis lisenser mangler]

```

[Device management overview for Cloud PCs](https://learn.microsoft.com/en-us/windows-365/enterprise/device-management-overview)

## [Module assessment](https://learn.microsoft.com/en-us/training/modules/manage-windows-365/5-knowledge-check/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.deploy-cloud-based-tools)

1. Which Windows 365 feature enables users to securely access their Cloud PC from any device with an internet connection and a compatible web browser?

	Remote Desktop Web Access

2. Which of the following features is exclusive to Windows 365 Enterprise and unavailable in Windows 365 Business?

	Custom Cloud PCs

3. Contoso is interested in deploying Windows as virtual sessions. The company has 150 users, and it wants a solution that provides ready-to-use Cloud PCs with simple management options. It doesn't want any licensing prerequisites or any dependencies on Active Directory. Given these requirements, which of the following solutions should Contoso use?

	Windows 365 Business

## [Summary](https://learn.microsoft.com/en-us/training/modules/manage-windows-365/6-summary/?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.deploy-cloud-based-tools)

Modulen gir en samlet forståelse av hvordan Windows 365 brukes til å levere en personlig og sikker Windows 11 opplevelse uavhengig av hvor brukeren befinner seg eller hvilken plattform som brukes. Løsningen gjør det mulig å standardisere administrasjon, styrke sikkerhet og gi fleksibel tilgang til en fullverdig Windows klient i skyen.

Jeg har fått innsikt i de viktigste funksjonene i Windows 365 og hvordan de bidrar til en enklere og mer forutsigbar administrasjon. Modulen viser hvordan tjenesten settes opp, administreres og sikres, og hvordan Cloud PCer kan tilpasses ulike organisatoriske behov.

Jeg har blitt kjent med ulike utrullingsmetoder og hvordan lisensmodellen påvirker valg av løsning. Samlet gir dette et helhetlig grunnlag for å administrere og optimalisere Windows 365 i en moderne endepunktadministrasjon.

