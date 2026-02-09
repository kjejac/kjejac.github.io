---
layout: default
title: Enroll devices using Microsoft Configuration Manager
nav_order: 2
parent: Uke 2 – Refleksjoner
has_children:
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/SCCM
  - MD-102/ConfigurationManager
---
## [Introduction](https://learn.microsoft.com/en-us/training/modules/enroll-devices-use-endpoint-configuration-manager/1-introduction)
Modulen introduserer alternativer for klientutrulling, administrasjon og overvåkning som er tilgjengelige når du bruker Configuration Manager.

### Læringsmål 
- Beskrive Microsoft Endpoint Manager
- Forstå fordelene ved å administrere en klient med Configuration Manager
- Rulle ut Configuration Manager klienter
- Overvåke Configuration Manager klienten
- Administrere enheter i Configuration Manager

## [Deploy the Microsoft Configuration Manager client](https://learn.microsoft.com/en-us/training/modules/enroll-devices-use-endpoint-configuration-manager/2-deploy-configuration-manager-client)
[Configuration Manager](../../Glossary/Microsoft-Configuration-Manager.md) klienten er nøkkelen til å administrere Windowsenheter effektivt. Når klienten er installert, får IT-avdelingen full innsikt i maskinvare og programvare. De kan distribuere apper og OS, og kan administrere enhetene både lokalt og via skyfunksjoner. Brukerne får også fordeler, som tilgang til en selvbetjent programkatalog og muligheten til å styre når installasjoner kan forstyrre dem.

De vanligste metodene for å rulle ut klienten er:
- _Client push_: Startes direkte fra ConfigMgr konsollen og bruker AD integrasjon for å finne enheter. Enkelt, men kan gi mye nettverkstrafikk.
- _Manuell installasjon_: Kjøring av `ccmsetup.exe` eller MSI med tilpassede parametere. Fleksibelt, men tidkrevende uten automatisering. `Ccmsetup.exe  SMSSITECODE=AUTO CCMLOGMAXSIZE=10000 CCMLOGMAXHISTORY=2`
- _OS utrulling_: Klienten bygges inn i en task sequence og installeres når enheten settes opp første gang. Passer for nye maskiner eller reinstallasjoner.
- _Intune_: Moderne metode som brukes i co-management. Intune installerer klienten og kobler enheten til _Cloud Management Gateway_.

## [Monitor the Microsoft Configuration Manager client](https://learn.microsoft.com/en-us/training/modules/enroll-devices-use-endpoint-configuration-manager/3-monitor-configuration-manager-client)
All overvåkning skjer i ConfigMgr konsollet etter at klienten er installert på enheten. Den har flere innebygde indikatorer for å oppdage problemer tidlig.
- _Client online status_: Viser om enheten er koblet til sin _Management Point_. Klienten sender jevnlig ping, og mangler det respons i 5 minutter regnes klienten som offline
- _Client activity_: Viser om klienten har kommunisert med ConfigMgr de siste 7 dagene. Aktivitet inkluderer policyforespørsler, heartbeat meldinger og maskinvareinventar
- _Primary User_: Konsollen viser hvem som mest sannsynlig er hovedbrukeren av enheten, basert på innlogginger over 60 dager
- _Operating System Build_: OS versjon og annen inventardata vises uten behov for ekstern tilkobling til enheten
- _Client check_: Klienten kjører jevnlig helsesjekker og kan rette enkelte problemer automatisk. Kan også utvides med compliance innstillinger
- _Co-management og Intune_: [Intune](../../Glossary/Microsoft-Intune.md) tilbyr også compliance kontroller, men ConfigMgr brukes ofte for avanserte remediering, spesielt når kreves fil eller konfigurasjonsendringer

## [Manage the Microsoft Configuration Manager client](https://learn.microsoft.com/en-us/training/modules/enroll-devices-use-endpoint-configuration-manager/4-manage-configuration-manager-client)
Når ConfigMgr klienten installeres på en enhet og blir tilordnet en site, vises enheten i `Assets and Compliance --> Devices`.
Enheten blir deretter medlem av en eller flere _collections_, som brukes til å gruppere enheter eller brukere med felles egenskaper, f.eks. OS type eller installerte apper.
Fra en collection eller en enkelt enhet kan du utføre ulike administrasjonsoppgaver ved å høyreklikke.

Vanlige klienthandlinger er:
- _Start Resource Explorer_: Viser inventardata som OS info, minne og installerte apper
- _Start Policy Retrival_: Tvinger klienten til å hente policyer fra site-serveren
- _Add to a collection_: Legger enheten direkte i en valgt collection
- _Client Settings RSOP_: Viser hvilke klientinnstillinger som gjelder for enheten

## [Module assessment](https://learn.microsoft.com/en-us/training/modules/enroll-devices-use-endpoint-configuration-manager/5-knowledge-check)
1. _Which Configuration Manager console feature gives you the ability to see if a device is connected to its assigned management point?_
	Client Online Status

2. _To manage a Windows computer using Configuration Manager, there are multiple ways to deploy the client. What are the four most common methods of deployment?_
	Client push, Manual deployment, OS Deployment, Microsoft Intune

## [Summary](https://learn.microsoft.com/en-us/training/modules/enroll-devices-use-endpoint-configuration-manager/6-summary)
ConfigMgr klienten gir admins mulighet for å spore programvare, hente maskinvare- og programvareinventar, samt administrere og distribuere OS og LoB apps.

For brukere gir klienten en selvbetjeningsportal der de kan installere programvare selv.

De fire vanligste metodene for å distribuere klienten er:
- Client push
- Manuell installasjon
- OS utrulling
- Intune

For problemløsning har ConfigMgr funksjoner som
- Client status
- Client activity
- Primary user
- OS build
- Client check

Collections benyttes til å gruppere enheter og brukere for målrettede utrullinger og rapportering.