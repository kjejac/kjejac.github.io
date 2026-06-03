---
layout: default
title: Uke 8 – Refleksjoner
nav_order:
parent: Microsoft 365 Endpoint Administrator
has_children: true
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/MAM
  - MD-102/Intune
  - MD-102/ConfigurationManager
  - MD-102/GPO
  - MD-102/MDM
  - MD-102/MAM-WE
  - MD-102/EMM
  - MD-102/ExchangeOnline
  - MD-102/Android
  - MD-102/iOS
  - MD-102/WIP
  - MD-102/EdgeForBusiness
  - MD-102/IEmode
  - MD-102/Microsoft365Apps
  - MD-102/Apps
  - MD-102/KMS
  - MD-102/MAK
  - MD-102/ODT
  - MD-102/Office
  - MD-102/MSHTML
  - MS-102/Trident
  - MD-102/Edge
  - MD-102/Windows10
  - MD-102/Windows11
  - MD-102/MicrosoftStore
  - MD-102/AppleStore
  - MD-102/GooglePlay
  - MD-102/IntuneManagementExtension
  - MD-102/C2R
  - MD-102/IntuneWin
  - MD-102/PowerShell
  - MD-102/EndpointConfigurationManager
  - MD-102/SCCM
  - MD-102/DeploymentTypes
  - "#MD-102/IntuneWinAppUtil"
  - MD-102/Win32ContentPrepTool
  - MD-102/AppleConfigurator
  - MD-102/Store
  - MD-102/LOB
  - MD-102/Apple
  - MD-102/ABM
  - MD-102/COPE
  - MD-102/COBO
  - MD-102/AVD
  - MD-102/Windows365
  - MD-102/IntuneSuite
  - MD-102/Autopilot
  - MD-102/Defender
  - MD-102/DefenderEndpoint
  - MD-102/EntraID
  - MD-102/Security
---
# Examine application management

Modulen oppleves som litt krevende når man kommer fra et miljø der SCCM og tradisjonelle distribusjonsmetoder har vært hovedverktøyene. 
I SCCM er applikasjonshåndtering konkret og detaljstyrt: pakker bygges, distribusjonspunkter administreres, og statusmeldinger gir full innsikt i hva som skjer på klientene. I [Intune](../../Glossary/Microsoft-Intune.md) er mye av denne tekniske kontrollen forenklet bort, og det kan gjøre stoffet tyngre å ta inn når praktisk erfaring mangler.

Modulen gjør det klart at applikasjonshåndtering i Intune handler mer om å beskrive ønsket resultat enn om å styre selve prosessen steg for steg. I stedet for å definere nøyaktig hvordan en installasjon skal foregå, beskrives ønsket sluttresultat, og Intune sørger for gjennomføringen. Dette krever en annen måte å tenke på enn i SCCM, der administrator har hatt full kontroll over hver detalj.

Modulen introduserer flere nye begreper og arbeidsmåter: app‑typer, tilordning, [app‑beskyttelse (MAM)](../../Glossary/Mobile-Application-Management.md) , app‑konfigurasjon og monitorering. Selv om dette virker uvant, er det egentlig en videreføring av kjente konsepter fra SCCM, bare pakket inn i en skyorientert modell.

For eksempel:

- Tilordning i Intune tilsvarer i stor grad deployments i SCCM.
- [Win32‑apper](../../Glossary/IntuneWin.md) i Intune bygger på samme grunnide som tradisjonelle SCCM‑applikasjoner.
- Microsoft 365 Apps‑distribusjon i Intune bygger på [Office-Deployment-Tool (ODT)](../../Glossary/Office-Deployment-Tool.md), men uten behov for manuell XML‑håndtering.
- Monitorering gir mindre detaljert innsikt enn SCCM, men dekker de viktigste behovene.

[IE-mode](../../Glossary/IE-mode.md) og nettleseradministrasjon er også nye temaer i modulen, men gir mening når de ses som en form for «kompatibilitetslag» for eldre [LOB‑applikasjoner](../../Glossary/Line-of-Business-Apps.md) , på samme måte som enkelte eldre apper tidligere krevde spesielle SCCM‑tilpasninger.

Når alt settes sammen gir modulen et helhetlig bilde av hvordan applikasjoner håndteres i en skybasert administrasjonsmodell. For meg som kommer fra SCCM og ODT, handler læringsprosessen først og fremst om å oversette eksisterende kompetanse til en ny plattform, heller enn å starte helt fra bunnen av.

|SCCM‑tankegang|Intune‑tankegang|
|---|---|
|Pakker og apper|App‑typer|
|Deployments|Tilordning|
|DP‑infrastruktur|Microsoft CDN|
|Statusmeldinger|Monitorering|
|ODT manuelt|Intune Office‑profil|
|IE11 fallback|IE mode|

---

| **Tema**                        | **Oppgave**                                                      | **Status** | **Notater**                                                              |
| ------------------------------- | ---------------------------------------------------------------- | ---------- | ------------------------------------------------------------------------ |
| App‑typer i Intune              | Forstå Win32, Microsoft Store, web apps og Microsoft 365 Apps    | ✅          | Viktig å vite når hver type brukes og hvilke begrensninger som gjelder.  |
| Tilordning av apper             | Beherske Required, Available og Uninstall                        | ✅          | Tilsvarer deployments i SCCM, men mer intensjonsbasert.                  |
| Win32‑apper                     | Forstå IntuneWin‑pakking, detection rules og return codes        | ✅          | Nærmest SCCM‑logikk; mest teknisk del av modulen.                        |
| Microsoft 365 Apps              | Forstå hvordan Intune bruker ODT i bakgrunnen                    | ✅          | Konfigurasjon via GUI, men bygger på samme prinsipper som ODT.           |
| Office Deployment Tool (ODT)    | Kjenne til /download, /configure og configuration.xml            | ✅          | Relevante paralleller til tidligere erfaring.                            |
| Office Customization Tool (OCT) | Lage configuration.xml grafisk                                   | ✅          | Brukes som forberedelse til ODT‑basert installasjon.                     |
| App‑beskyttelse (MAM)           | Forstå app‑beskyttelsespolicyer for mobile apper                 | ✅          | Gjelder primært BYOD og mobilbrukere.                                    |
| App‑konfigurasjon (MAM/MDM)     | Konfigurere app‑innstillinger via Intune                         | ✅          | Viktig for Outlook, Edge og Microsoft 365‑apper.                         |
| Nettleseradministrasjon         | Forstå Edge‑policyer og administrasjon                           | ✅          | Omfatter oppdateringer, sikkerhet og administrerte innstillinger.        |
| IE mode                         | Forstå samspillet mellom Chromium og MSHTML                      | ✅          | Brukes for eldre LOB‑applikasjoner; styrt via site list.                 |
| Enterprise Mode Site List       | Administrere hvilke nettsteder som åpnes i IE mode               | ✅          | Kritisk for kompatibilitet i virksomheter med eldre systemer.            |
| Monitorering av apper           | Bruke Intune til å se installasjonsstatus og feil                | ✅          | Mindre detaljert enn SCCM, men dekker hovedbehovene.                     |
| Avinstallasjon og oppdatering   | Forstå hvordan Intune håndterer livssyklus                       | ✅          | Intune styrer oppdateringer automatisk for flere apptyper.               |
| App‑avhengigheter               | Kjenne til hvordan Win32‑apper kan ha dependencies               | ✅          | Viktig for komplekse applikasjoner.                                      |
| App‑supercedence                | Forstå hvordan nye versjoner kan erstatte gamle                  | ✅          | Intune‑versjon av SCCM supersedence.                                     |
| Company Portal                  | Forstå brukeropplevelsen for tilgjengelige apper                 | ✅          | Viktig for Available‑tilordninger.                                       |
| Ikke‑registrerte enheter        | Forstå hvordan apper kan gjøres tilgjengelige uten MDM           | ✅          | Gjelder scenarier med lav administrasjonsgrad.                           |
| Distribusjonskilder             | Forstå Microsoft CDN og hvordan innhold leveres                  | ✅          | Erstatter SCCM‑distribusjonspunkter. Microsoft Store‑apper og web‑apper. |
| Feilsøking                      | Kjenne til loggfiler, Intune Management Extension og statuskoder | ✅          | Nødvendig for praktisk drift.                                            |