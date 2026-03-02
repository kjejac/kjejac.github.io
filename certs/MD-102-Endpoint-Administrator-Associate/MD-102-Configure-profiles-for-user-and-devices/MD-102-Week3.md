---
layout: default
title: Uke 3 – Refleksjoner
nav_order: 3
parent: Microsoft 365 Endpoint Administrator
has_children: true
nav_exclude:
has_toc: false
tags:
  - MD-102
  - MD-102/Windows10
  - MD-102/Windows11
  - MD-102/SCCM
  - MD-102/Intune
---
Denne modulen har vist meg hvor stor forskjell det er mellom klassisk AD-basert klientdrift og skybasert administrasjon. I tradisjonelle AD-miljøer er brukerprofiler, GPOer, roaming-profiler, Folder Redirection og lokale profilstyringsmekanismer helt sentrale. De fungerer, men de tunge og avhengig av lokal infrastruktur.

Moderne administrasjon går i en helt annen retning, der enhets- og brukeropplevelse flyttes gradvis fra lokal kontroll til [Entra ID](../../Glossary/Microsoft-Entra-ID.md), [Intune](../../Glossary/Microsoft-Intune.md), OneDrive og [Enterprise State Roaming](../../Glossary/Enterprise-State-Roaming.md). I stedet for å håndtere store profiler, NTUSER.DAT-feil og treg innlogging, bruker man skybasert synkronisering av innstillinger og filer. Det gir en mer forutsigbar og robust brukeropplevelse, spesielt når brukere bytter enheter eller jobber hybrid.

Der AD og SCCM krever detaljstyring, patching av servere og vedlikehold av filservere, profiler og GPOer, legger moderne administrasjon opp til en modell der policyer, profiler og dataflyt er enklere og mindre sårbare.

For min egen del har modulen gjort det lettere å se hvordan min kompetanse fra AD og SCCM kan oversettes til moderne administrasjon. Prinsippene er de samme, men verktøyene og arkitekturen er langt mer fleksible. Det gir et bedre grunnlag for å planlegge migrasjoner, feilsøke helhetlig og støtte brukere i et miljø der identiteten har kommet i sentrum for enheten.

Jeg har fortsatt de praktiske oppgavene igjen i denne modulen, og kommer tilbake til refleksjonen når jeg får anledning til å jobbe mer konsentrert med stoffet.

---

| **Tema**                | **Oppgave**                                | **Status** | **Notater**                                                                                                         |
| ----------------------- | ------------------------------------------ | ---------- | ------------------------------------------------------------------------------------------------------------------- |
| Konfigurasjonsprofiler  | Forstå hva enhetsprofiler brukes til       | ✅          | Profiler definerer innstillinger for enheter og brukere: Wi‑Fi, VPN, e‑post, sertifikater, bakgrunn, sikkerhet osv. |
|                         | Opprette en ny konfigurasjonsprofil        | ⬜          | Velg plattform (Windows, iOS, Android, macOS) og mal. Intune -> Devices -> Configuration profiles.                  |
|                         | Tilordne profilen til en gruppe            | ⬜          | Bruk dynamiske eller statiske Entra‑grupper. Viktig for målretting.                                                 |
|                         | Verifisere at profilen anvendes            | ⬜          | Sjekk _Device status_ og _Per‑setting status_. Feilsøk via Event Viewer og `MDMDiagReport.html`.                    |
| Administrative maler    | Forstå hva Administrative Templates er     | ✅          | GPO‑lignende innstillinger levert via Intune. Brukes for Windows og Office.                                         |
|                         | Opprette og konfigurere en mal             | ⬜          | Eksempler: OneDrive KFM, Windows Update, Office‑policyer.                                                           |
|                         | Teste at innstillinger slår inn            | ⬜          | Bruk `gpresult /h` eller Intune‑rapportering.                                                                       |
| Security baselines      | Forstå hensikten med sikkerhetsbaselines   | ✅          | Microsofts anbefalte sikkerhetsinnstillinger. Rask måte å sikre enheter på.                                         |
|                         | Tilordne en baseline                       | ⬜          | Velg f.eks. . Defender baseline eller Windows 10/11 baseline.                                                       |
|                         | Evaluere baseline‑resultater               | ⬜          | Sjekk _Reports -> Security baselines_. Se etter konflikter.                                                         |
| Compliance policies     | Forstå hva compliance‑policyer gjør        | ✅          | Definerer krav som enheter må oppfylle: kryptering, passord, OS‑versjon, root/jailbreak.                            |
|                         | Opprette en compliance‑policy              | ⬜          | Brukes sammen med Conditional Access for å blokkere ikke‑kompatible enheter.                                        |
|                         | Teste compliance‑flyt                      | ⬜          | Bruk test‑VM. Sjekk hvordan Intune rapporterer status.                                                              |
| Custom profiles         | Forstå når man bruker OMA‑URI/JSON         | ✅          | Brukes når standardprofiler ikke dekker behov. Krever nøyaktighet.                                                  |
|                         | Opprette en tilpasset profil               | ⬜          | Krever dokumentasjon fra leverandør eller Microsoft.                                                                |
|                         | Validere at profilen fungerer              | ⬜          | Feilsøk via `MDMDiagReport.html` og Intune‑status.                                                                  |
| Enrollment restrictions | Forstå registreringsbegrensninger          | ✅          | Styrer hvilke enheter som kan registreres (plattform, OS‑versjon, personlig/bedriftseid).                           |
|                         | Opprette og teste begrensninger            | ⬜          | Prøv å registrere en blokkert enhet for å verifisere.                                                               |
| User profiles           | Forstå brukerprofiler i Intune             | ✅          | Enterprise State Roaming, synkronisering av innstillinger.                                                          |
|                         | Aktivere og teste ESR                      | ⬜          | Gjelder Windows‑brukere i Entra ID.                                                                                 |
| Rapportering            | Bruke rapporter for profiler og compliance | ✅          | Intune -> Reports -> Device configuration / Compliance.                                                             |
| Grupper og målretting   | Opprette riktige Entra‑grupper             | ⬜          | Dynamiske grupper for automatisering.                                                                               |
| RBAC og scope tags      | Forstå rollebasert tilgang                 | ⬜          | Viktig i større miljøer eller MSP‑scenarier.                                                                        |
