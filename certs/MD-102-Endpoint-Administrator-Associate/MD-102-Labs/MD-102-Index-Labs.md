---
layout: default
title: Labs
nav_order: 9
parent: Microsoft 365 Endpoint Administrator
has_children: true
nav_exclude:
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
---
# Explore Endpoint Management


| **Hovedaktivitet**                                                                                                               | **Mål**                                                                     |
| -------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| [Undersøk administrasjonsstatus for en Windows‑enhet](MD-102-Explore-endpoint-management/MD-102-Client-administration-status.md) | Forstå hvordan Windows‑enheter identifiserer administrasjonsmodell.         |
| [Analyser enhetens sikkerhetsstatus i Windows Security](MD-102-Explore-endpoint-management/MD-102-Client-Windows-Security.md)    | Forstå hvordan Windows Security fungerer som samlet sikkerhetsflate.        |
| [Utforsk Intune‑portalen og enhetsoversikten](MD-102-Explore-endpoint-management/MD-102-Intune-portal.md)                        | Forstå hvordan Intune presenterer enhetsstatus og policy‑anvendelse.        |
| [Undersøk enhetens MDM‑diagnostikk](MD-102-Explore-endpoint-management/MD-102-MDM-Diagnostics.md)                                | Forstå hvordan MDM‑registrering og policy‑henting kan feilsøkes.            |
| [Test administrasjon via Company Portal](MD-102-Explore-endpoint-management/MD-102-Company-Portal-App-Web.md)                    | Forstå brukeropplevelsen i moderne administrasjon.                          |
| [Sjekk policy‑anvendelse på klienten](MD-102-Explore-endpoint-management/MD-102-Policies.md)                                     | Forstå hvordan policyer leveres og oppdateres på klienten.                  |
| [Analyser forskjellen mellom MDM og GPO](MD-102-Explore-endpoint-management/MD-102-MDM-vs-GPO)                                   | Forstå hvorfor moderne administrasjon erstatter tradisjonell GPO‑styring.   |
| [Utforsk Endpoint Security‑oversikten i Intune](MD-102-Explore-endpoint-management/MD-102-Endpoint-Security-portal)              | Forstå hvordan Intune samler sikkerhetsstyring i én portal.                 |
| [Test enhetsinformasjon via Entra ID](MD-102-Explore-endpoint-management/MD-102-Device-information-EntraID.md)                   | Forstå hvordan Entra ID fungerer som identitetsfundament for enhetsstyring. |

# Execute Device Enrollment

| **Hovedaktivitet**                               | **Mål**                                                                       |
| ------------------------------------------------ | ----------------------------------------------------------------------------- |
| Konfigurer automatisk MDM‑registrering           | Forstå hvordan enheter automatisk registreres i Intune ved Entra‑tilknytning. |
| Utfør en ren Entra join                          | Forstå hvordan Entra join fungerer som fundament for moderne administrasjon.  |
| Test Entra ID‑registrering (Azure AD Registered) | Forstå forskjellen mellom registrering og full Entra join.                    |
| Konfigurer Enrollment Status Page (ESP)          | Forstå hvordan ESP styrer brukeropplevelsen under utrulling.                  |
| Importer en enhet til Autopilot                  | Forstå hvordan enheter registreres i Autopilot før utrulling.                 |
| Test Autopilot Device Preparation                | Forstå hvordan Device Preparation forenkler utrulling uten imaging.           |
| Analyser MDM‑diagnostikk etter enrollment        | Forstå hvordan enrollment‑problemer feilsøkes i praksis.                      |

# Configure profiles for user and devices

| **Hovedaktivitet**                                        | **Mål**                                                               |
| --------------------------------------------------------- | --------------------------------------------------------------------- |
| Opprett en konfigurasjonsprofil for Windows‑innstillinger | Forstå hvordan Settings catalog brukes til moderne MDM‑konfigurasjon. |
| Opprett en Administrative Templates‑policy                | Mestre ADMX‑basert styring i Intune.                                  |
| Konfigurer en Wi‑Fi‑profil                                | Forstå hvordan nettverksprofiler distribueres via Intune.             |
| Opprett en VPN‑profil                                     | Forstå hvordan VPN‑konfigurasjon leveres via MDM.                     |
| Opprett en e‑postprofil (Exchange Online)                 | Forstå hvordan Intune kan konfigurere brukeropplevelsen direkte.      |
| Konfigurer en Device Restrictions‑policy                  | Forstå hvordan enhetsbegrensninger håndheves i Intune.                |
| Opprett en Edge‑policy for brukere                        | Forstå forskjellen mellom bruker‑ og enhetsmålretting.                |
| Test Scope tags og RBAC                                   | Forstå hvordan Intune segmenterer administrasjon i større miljøer.    |
| Analyser policy‑anvendelse på klienten                    | Forstå hvordan policyer leveres og feilsøkes på klienten.             |

# Examine application management

|**Hovedaktivitet**|**Mål**|
|---|---|
|Opprett og distribuer en Win32‑app|Forstå moderne Win32‑distribusjon og detection‑logikk.|
|Distribuer Microsoft 365 Apps via Intune|Se hvordan Intune bruker ODT i bakgrunnen og forenkler Office‑utrulling.|
|Opprett og test en Microsoft Store‑app|Forstå forskjellen mellom Required og Available i praksis.|
|Opprett en app‑konfigurasjonspolicy|Mestre app‑konfigurasjon (MDM/MAM) i Intune.|
|Opprett en app‑beskyttelsespolicy (MAM)|Forstå hvordan app‑beskyttelse fungerer uten full enhetsadministrasjon.|
|Test IE mode for en eldre webapplikasjon|Forstå samspillet mellom Chromium og MSHTML i applikasjonskompatibilitet.|
|Opprett en avinstallasjonspolicy|Forstå livssyklusstyring av apper.|
|Test app‑supercedence|Mestre versjonsstyring i Intune.|
|Analyser app‑installasjonsfeil|Forstå feilsøking i moderne applikasjonshåndtering.|
|Test Company Portal‑opplevelsen|Forstå brukeropplevelsen i moderne app‑distribusjon.|

# Manage authentication and compliance

| **Hovedaktivitet**                                              | **Mål**                                                                          |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| Konfigurer multifaktorautentisering (MFA) for en testbruker     | Forstå hvordan MFA beskytter identiteter og brukes i moderne administrasjon.     |
| Konfigurer Windows Hello for Business                           | Forstå passordløs autentisering og hvordan WHfB erstatter tradisjonelle passord. |
| Test Self‑Service Password Reset (SSPR)                         | Forstå hvordan brukere kan administrere egne passord sikkert.                    |
| Opprett en compliance‑policy                                    | Forstå hvordan compliance definerer krav til enheter.                            |
| Simuler en non‑compliant enhet                                  | Forstå hvordan Intune identifiserer og rapporterer avvik.                        |
| Opprett en Conditional Access‑regel som krever compliant device | Forstå samspillet mellom compliance og Conditional Access.                       |
| Test blokkering av tilgang fra non‑compliant enhet              | Forstå hvordan Conditional Access håndhever sikkerhet i praksis.                 |
| Analyser compliance‑rapporter                                   | Forstå hvordan compliance‑status overvåkes og feilsøkes.                         |
| Konfigurer en Device Health‑attestering                         | Forstå hvordan helsetilstand brukes som del av compliance.                       |

# Manage endpoint security

|**Hovedaktivitet**|**Mål**|
|---|---|
|Konfigurer Microsoft Defender Antivirus via Intune|Forstå hvordan Defender AV styres via MDM.|
|Opprett og test Attack Surface Reduction (ASR) regler|Forstå forskjellen på Audit og Block og hvordan ASR påvirker klienten.|
|Konfigurer Controlled Folder Access|Se hvordan ransomware‑beskyttelse fungerer i praksis.|
|Konfigurer Exploit Protection|Mestre system‑ og app‑spesifikke mitigations.|
|Aktiver og test Network Protection|Forstå hvordan SmartScreen‑basert nettverksbeskyttelse fungerer.|
|Konfigurer BitLocker via Intune|Forstå BitLocker‑policyer og rapportering.|
|Konfigurer Windows Defender Firewall via Intune|Mestre brannmurprofiler og regelstyring.|
|Opprett Connection Security Rules (IPsec)|Forstå IPsec‑autentisering og transport/tunnel‑modus.|
|Aktiver Credential Guard og LSA Protection|Forstå isolasjon av legitimasjon og beskyttet LSASS.|
|Bruk Security Baselines|Forstå hvordan baselines forenkler sikkerhetsstyring.|
|Onboard en enhet til Microsoft Defender for Endpoint|Forstå EDR‑integrasjon og sensorfunksjon.|
|Konfigurer Device Control (USB‑styring)|Mestre granularitet i enhetskontroll.|
|Overvåk og analyser sikkerhetsstatus|Forstå hvordan rapportering brukes i drift.|
|Simuler et angrep og se EDR‑respons|Forstå samspillet mellom AV, EDR og XDR.|

# Deploy using on-premises based tools

|**Hovedaktivitet**|**Mål**|
|---|---|
|Installer og konfigurer Windows ADK + WinPE|Forstå grunnlaget for alle on‑premises distribusjonsverktøy.|
|Opprett et MDT Deployment Share|Mestre grunnstrukturen i MDT og hvordan et deployment share bygges opp.|
|Generer og test et MDT‑bootimage|Forstå hvordan WinPE og MDT samarbeider i en utrulling.|
|Legg til applikasjoner i MDT|Forstå applikasjonshåndtering i MDT og forskjellen på MSI/EXE.|
|Opprett en Custom Task Sequence i MDT|Mestre tilpasning av utrullingslogikk.|
|Konfigurer ODT for Microsoft 365 Apps|Forstå hvordan ODT brukes i on‑premises scenarier.|
|Opprett en SCCM‑applikasjon|Knytte eksisterende SCCM‑erfaring til MD‑102‑relevant kontekst.|
|Bruk USMT i MDT|Forstå migrering av brukerdata i on‑premises verktøy.|
|Opprett en fullstendig Zero‑Touch‑utrulling i MDT|Se hvordan MDT kan automatisere hele prosessen uten brukerinteraksjon.|
|Analyser loggfiler fra MDT og ODT|Mestre feilsøking i on‑premises distribusjonsmiljøer.|

# Deploy using cloud based tools

| **Hovedaktivitet**                              | **Mål**                                                       |
| ----------------------------------------------- | ------------------------------------------------------------- |
| Konfigurer Windows Autopilot Device Preparation | Forstå hvordan moderne utrulling fungerer uten imaging.       |
| Importer en enhet til Autopilot                 | Mestre hele Autopilot‑registreringsprosessen.                 |
| Konfigurer Enrollment Status Page (ESP)         | Forstå hvordan ESP styrer opplevelsen under utrulling.        |
| Konfigurer enhetsregistrering i Entra ID        | Forstå hvordan identitet og enhetsregistrering henger sammen. |
| Opprett og test en Device Configuration‑policy  | Mestre grunnleggende MDM‑konfigurasjon.                       |
| Opprett en Device Compliance‑policy             | Forstå hvordan compliance brukes i moderne administrasjon.    |
| Distribuer Microsoft 365 Apps via Intune        | Forstå hvordan Intune bruker ODT i bakgrunnen.                |
| Distribuer en Win32‑app via Intune              | Mestre moderne app‑distribusjon i skyen.                      |
| Konfigurer Windows Update for Business          | Forstå moderne oppdateringsstyring.                           |
| Test Autopatch                                  | Se hvordan Microsoft automatiserer oppdateringer.             |
| Analyser enhetsstatus og utrullingsfeil         | Forstå hvordan feilsøking gjøres i cloud‑basert utrulling.    |
