---
layout: default
title: Uke 7 – Refleksjoner
nav_order: 7
parent: Microsoft 365 Endpoint Administrator
has_children: true
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Endpoint
  - MD-102/Autopilot
  - MD-102/OOBE
  - MD-102/EntraID
  - MD-102/Intune
  - MD-102/MDM
  - MD-102/Windows10
  - MD-102/Windows11
  - MD-102/ZTI
  - MD-102/MDT
  - MD-102/WindowsADK
  - MD-102/ConfigurationManager
  - MD-102/LTI
  - MD-102/Sysprep
  - MD-102/IntuneSuite
  - MD-102/ZeroTrust
  - MD-102/EndpointPrivilegeManagement
  - MD-102/EndpointAnalytics
  - MD-102/MicrosoftTunnel
  - MD-102/CA
  - MD-102/MFA
  - MD-102/DefenderEndpoint
  - MD-102/Authentication
  - MD-102/EPM
  - MD-102/RBAC
  - MD-102/MAM
  - MD-102/VPN
  - MD-102/DynamicProvisioning
  - MD-102/Provisioning
  - MD-102/ConfigurationDesigner
  - MD-102/EntraJoin
  - MD-102/AlwaysOnVPN
  - MD-102/CSP
  - MD-102/VDA
  - MD-102/License
  - MD-102/VirtualDesktop
  - MD-102/AzureVirtualDesktop
  - MD-102/VDI
  - MD-102/Security
  - MD-102/Apps
  - MD-102/AppVirtualization
  - MD-102/FSLogix
  - MD-102/MultiSession
  - MD-102/RDS
  - MD-102/CredentialGuard
  - MD-102/Windows365
  - MD-102/EA
  - MD-102/VNet
  - MD-102/CloudPC
  - MD-102/GPO
  - MD-102/EntraHybridJoin
  - MD-102/ANC
  - MD-102/CoManagement
  - MD-102/SharePoint
  - MD-102/ExchangeOnline
  - MD-102/EntraConnect
  - MD-102/USMT
  - MD-102/KnownFolderMove
  - MD-102/KFM
  - MD-102/ESR
---
# Deploy using cloud based tools

Når jeg jobber meg gjennom denne modulen, merker jeg at den treffer et område som både er kjent og fremmed på samme tid. Jeg kjenner igjen mange av prinsippene fra ConfigMgr, AD og Azure AD, og det gjør at jeg har noe å stå på. Men selve måten ting gjøres på i Intune og Autopilot er likevel ganske annerledes enn det jeg er vant til. Det er ikke lenger imaging, task sequences og kontroll over hver minste detalj. Det er mer deklarativt, mer skybasert og mer avhengig av at jeg stoler på at plattformen gjør jobben.

Det gjør at modulen føles tyngre. Ikke fordi konseptene er vanskelige, men fordi jeg ikke har den samme praktiske erfaringen å knytte det til. Jeg har ikke stått i en Autopilot utrulling eller jobbet med [Device Preparation (DDP)](../../Glossary/Device-Preparation.md) i praksis. Jeg har ikke sett hvordan en enhet går fra fabrikk til ferdig konfigurert uten at jeg rører den. Derfor blir mye av dette teoretisk, og jeg må jobbe mer for å visualisere hvordan det faktisk fungerer.

Samtidig merker jeg at grunnlaget mitt fra ConfigMgr og AD hjelper meg mer enn jeg trodde. Jeg kjenner igjen logikken bak policyer, profiler, oppdateringsstyring og livssyklus. Jeg kjenner igjen tankesettet rundt standardisering, kontroll og sikkerhet. Det som er nytt, er måten alt dette leveres på. I stedet for imaging og task sequences er det Autopilot og [Enrollment Status Page (ESP)](../../Glossary/Enrollment-Status-Page.md) . I stedet for GPO er det Settings Catalog. I stedet for SCCM collections er det Entra grupper. Og i stedet for lokale tjenester er det Entra ID som er kontrollplanet.

Det som kanskje overrasker meg mest, er hvor mye av dette som egentlig handler om identitet. Når jeg ser på [Autopilot](../../Glossary/Windows-Autopilot.md), DPP, appdistribusjon, [Compliance](../../Glossary/Compliance-Intune.md) og [Conditional Access](../../Glossary/Conditional-Access.md), så er alt bygget rundt [Entra ID](../../Glossary/Microsoft-Entra-ID.md). Det gjør at jeg må tenke mer helhetlig enn før. Det er ikke lenger enhetsstyring isolert fra identitet. Det er en samlet modell der alt henger sammen.

Når jeg ser på helheten, forstår jeg hvorfor dette er fremtiden. Det er enklere, mer skalerbart og mer tilpasset en verden der enheter ikke står på et kontor, men er spredt overalt. Det er også tydelig at dette er et område jeg må jobbe mer med. Ikke fordi det er vanskelig, men fordi jeg trenger mer praktisk erfaring for at det skal sitte. Jeg må se en Autopilot utrulling i praksis. Jeg må kjenne hvordan ESP oppfører seg. Jeg må teste DPP og se hvordan appene ruller inn.

Modulen gir meg et godt teoretisk grunnlag, men jeg kjenner at jeg trenger å bygge videre på det med praksis. Samtidig ser jeg at jeg har et fortrinn i forståelsen av prinsippene bak. Jeg vet hvordan enhetsadministrasjon fungerer. Jeg vet hvordan identitet fungerer. Jeg vet hvordan livssyklus fungerer. Nå handler det om å oversette det jeg kan fra on premises til skyen.

---

| Tema                  | Oppgave                                                                                    | Status | Notater                                                                                                                                                                                                                                                |
| --------------------- | ------------------------------------------------------------------------------------------ | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Autopilot             | Forklare hva Windows Autopilot er og hvorfor det brukes                                    | ✅      | Autopilot klargjør nye Windows‑enheter direkte fra skyen uten imaging. Enheten registreres i Entra ID og Intune, og konfigureres automatisk med profiler, apper og policyer. Brukeren logger inn og enheten settes opp etter virksomhetens standarder. |
| Autopilot             | Forstå forskjellen mellom Autopilot‑moduser (User‑driven, Pre‑provisioned, Self‑deploying) | ✅      | User‑driven: vanlig brukeroppsett. Pre‑provisioned: IT klargjør enheten før bruker får den. Self‑deploying: helt automatisk, ingen brukerinteraksjon (krever TPM 2.0).                                                                                 |
| Autopilot             | Beskrive hvordan Autopilot‑profiler fungerer                                               | ✅      | Deployment profiles styrer OOBE‑opplevelsen, navnestandard, join‑type (Entra join / hybrid), og om brukeren kan hoppe over steg.                                                                                                                       |
| Autopilot             | Forstå Enrollment Status Page (ESP)                                                        | ✅      | ESP sikrer at nødvendige apper, policyer og profiler installeres før brukeren får skrivebordet. Hindrer feil og sikrer standardisert oppsett.                                                                                                          |
| Autopilot             | Kjenne til Device Preparation (DPP)                                                        | ✅      | Ny Autopilot‑opplevelse som erstatter deler av ESP. Gir raskere og mer stabil utrulling. Bruker blocking apps og forbedret statusvisning.                                                                                                              |
| Enhetsregistrering    | Forstå forskjellen mellom Entra join, Entra hybrid join og MDM‑only                        | ✅      | Entra join: moderne administrasjon. Hybrid: koblet til AD + Entra. MDM‑only: kun Intune, ingen Entra‑identitet.                                                                                                                                        |
| Enhetsregistrering    | Beskrive registreringsmetoder for Windows                                                  | ✅      | Autopilot, manual enrollment, bulk enrollment (provisioning package), Azure VM join.                                                                                                                                                                   |
| Enhetsregistrering    | Forstå hvordan brukere registrerer enheter                                                 | ✅      | Brukeren logger inn med Entra‑konto → enheten registreres automatisk i Intune.                                                                                                                                                                         |
| Konfigurasjon         | Forklare hva Configuration Profiles er                                                     | ✅      | Brukes til å konfigurere innstillinger for sikkerhet, brukeropplevelse, nettverk, enhetsrestriksjoner osv. Distribueres via Intune.                                                                                                                    |
| Konfigurasjon         | Forstå forskjellen mellom Settings Catalog, Templates og Custom                            | ✅      | Settings Catalog: mest fleksibelt, alle innstillinger. Templates: forhåndsdefinerte profiler. Custom: OMA‑URI for avanserte innstillinger.                                                                                                             |
| Konfigurasjon         | Beskrive hvordan policy‑konflikter håndteres                                               | ✅      | Intune bruker “last writer wins” for enkelte innstillinger, men Settings Catalog har tydelig prioritet. Konflikter vises i rapporter.                                                                                                                  |
| Applikasjonsutrulling | Distribuere apper via Intune                                                               | ✅      | Win32, Store‑apper, LOB‑apper, web‑apper. Tildeles brukere eller enheter.                                                                                                                                                                              |
| Applikasjonsutrulling | Forstå Enterprise App Management                                                           | ✅      | Intune Suite‑funksjon. Microsoft‑pakkede Win32‑apper, automatisk oppdatering, enklere livssyklus.                                                                                                                                                      |
| Applikasjonsutrulling | Forstå forskjellen mellom Required, Available og Uninstall                                 | ✅      | Required: installeres automatisk. Available: brukeren kan installere via Company Portal. Uninstall: fjernes automatisk.                                                                                                                                |
| Oppdateringer         | Forklare Windows Update for Business                                                       | ✅      | Skybasert styring av Windows‑oppdateringer. Bruker Update Rings og Feature Update Policies.                                                                                                                                                            |
| Oppdateringer         | Forstå Update Rings                                                                        | ✅      | Styrer når enheter får kvalitetsoppdateringer, deferrals, deadlines og restart‑atferd.                                                                                                                                                                 |
| Oppdateringer         | Forstå Feature Update Policies                                                             | ✅      | Låser enheter til en spesifikk Windows‑versjon. Gir forutsigbarhet og kontroll.                                                                                                                                                                        |
| Oppdateringer         | Beskrive Autopatch                                                                         | ✅      | Automatiserer patching av Windows, Office, Edge og Teams. Bruker ring‑basert utrulling.                                                                                                                                                                |
| Sikkerhet             | Forstå rollen til Entra ID i skybasert utrulling                                           | ✅      | Identitet er kontrollplanet. Autentisering, Conditional Access, compliance og tilgang styres av Entra ID.                                                                                                                                              |
| Sikkerhet             | Implementere compliance‑policyer                                                           | ✅      | Definerer krav som må være oppfylt for tilgang. Kombineres med Conditional Access.                                                                                                                                                                     |
| Sikkerhet             | Forstå Device Compliance vs Device Configuration                                           | ✅      | Compliance = krav. Configuration = innstillinger. Begge brukes i utrulling.                                                                                                                                                                            |
| Sikkerhet             | Forstå Zero Trust i utrulling                                                              | ✅      | Least privilege, verifisering av identitet og enhet, policy‑styrt tilgang.                                                                                                                                                                             |
| Rapportering          | Bruke Intune‑rapporter for utrulling                                                       | ✅      | ESP‑status, app‑installasjonsstatus, policy‑samsvar, enhetshelse.                                                                                                                                                                                      |
| Rapportering          | Forstå forskjellen mellom built‑in reports og Advanced Analytics                           | ✅      | Built‑in: grunnleggende. Advanced Analytics: dyp innsikt, device timeline, anomalies, resource performance.                                                                                                                                            |