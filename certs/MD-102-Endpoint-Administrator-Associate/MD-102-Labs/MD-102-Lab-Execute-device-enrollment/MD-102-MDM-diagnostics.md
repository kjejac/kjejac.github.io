---
layout: default
title: Analyser MDM‑diagnostikk etter enrollment
nav_order: 7
parent: Execute device enrollment
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
  - MD-102/MDM
  - MD-102/MDMenrolled
  - MD-102/MDMonboardet
  - MD-102/Diagnostics
  - MD102/Enrollment
---
# Analyser MDM‑diagnostikk etter enrollment

## Mål
Forstå hvordan enrollment‑problemer feilsøkes i praksis.

## Refleksjon

Feilsøkingen minner meg om SCCM‑klienten. Hvis SCCM‑klienten manglet eller var feilregistrert, fikk enheten ikke policyer, apper eller status. MDM‑diagnostikk viser det samme mønsteret: join‑status, policy‑leveranse, agent‑status og sync‑feil. Erfaringen fra SCCM gjør det intuitivt å forstå hva som skjer når enrollment feiler. Dette bekrefter hvorfor moderne cloud‑utrulling ikke trenger imaging, alt som tidligere ble “bakt inn” i et image kan nå verifiseres og feilsøkes direkte via MDM‑kanalen

For Intune har man fire verktøy for feilsøking. Detaljnivået på informasjonen vil variere:
- _Begrenset informasjon_: `dsregcmd /status`
- _Begrenset informasjon_: Settings > Accounts > Access work or school > Info
- _Omfattende informasjon_: Event Viewer > DeviceManagement‑Enterprise‑Diagnostics‑Provider
- _Meget omfattende informasjon_: `mdmdiagnosticstool.exe -area DeviceEnrollment -cab c:\temp\mdm.cab`

I dsregcmd ser jeg primært etter AzureAdJoined, MdmUrl og PRT‑status, siden disse tre verdiene gir et raskt bilde av om enrollment faktisk er vellykket.

## Verifiseringer

- Entra‑join status
- MDM‑registrering
- TenantId / MdmUrl
- PRT‑status
- TPM‑status
- Last successful sync
- Error codes
- Policy delivery status

IME‑status i Event Viewer er også en indikator på om policyer og apper vil leveres etter enrollment, spesielt HKCU‑policyer som krever IME.

## Vanlige feil og hvordan de løses

_Feil:_ Enheten er AzureAdJoined = NO<br>
_Årsak:_ Workplace Join feilet<br>
_Løsning:_ Re‑join via Access work or school > Disconnect > Reconnect

_Feil:_ MdmUrl mangler<br> 
_Årsak:_ MDM‑registrering feilet <br>
_Løsning:_ Sjekk Autopilot‑profil, sync, sjekk Entra device object

_Feil:_ PRT = NO <br>_Årsak:_ TPM ikke klar / policy ikke levert<br>
_Løsning:_ TPM‑reset, sjekk policy readiness

_Feil:_ Policyer hentes ikke <br>
_Årsak:_ Sync feiler / feil gruppe <br>
_Løsning:_ Sjekk dynamisk gruppe, sync, sjekk DM‑events

## Steg for steg

1. Enheten registreres i Entra
2. MDM‑kanalen etableres
3. PRT opprettes
4. TPM valideres
5. Policyer hentes
6. IME installeres (hvis nødvendig)
7. Enheten blir compliant

Denne flyten viser hvorfor imaging ikke lenger er nødvendig. Alle kritiske konfigurasjoner leveres dynamisk etter enrollment, og kan feilsøkes med MDM‑diagnostikk.

### Relevante lab 1

[Endre språk, region- og keyboard-innstillinger](MD-102-Configure-Enrollment-Status-Page-LangRegion-Keyboard-24H.md): 
Labben viser hvordan policyer leveres etter enrollement, og hvordan feil i MDM-registrering eller IME påvirker brukeroppsettet.

### Relevant lab 2
[Client administration status](../MD-102-Lab-Explore-endpoint-management/MD-102-Client-administration-status.md): Labben viser hvordan du verifiserer om enheten faktisk styres av Intune etter enrollment. Du ser om MDM‑kanalen er aktiv, om policyer leveres, og om Windows rapporterer riktig administrasjonsmodell. Dette er nyttig fordi feil administrasjonsstatus (f.eks. “MDM: None”) forklarer hvorfor policyer, PRT eller IME ikke fungerer som forventet.

### Relevant lab 3
[Device information (Entra ID)](../MD-102-Lab-Explore-endpoint-management/MD-102-Device-information-EntraID.md): Labben viser hvordan du sjekker device‑objektet i Entra ID: join‑type, registreringsstatus, grupper og tilordninger. Dette er sentralt da feil i Entra‑registreringen (f.eks. feil join‑type eller manglende gruppemedlemskap) er en vanlig årsak til at MDM‑kanalen ikke etableres, policyer ikke leveres, eller PRT ikke opprettes.

### Relevant lab 4
[MDM-Diagnostics](../MD-102-Lab-Explore-endpoint-management/MD-102-MDM-Diagnostics.md): Viser hvordan språk‑, region‑ og tastaturoppsett fungerer som et praktisk eksempel på om MDM‑kanalen leverer policyer etter enrollment. Disse innstillingene styres av HKCU‑policyer, som kun blir satt når enheten er riktig Entra‑registrert, MDM‑kanalen er aktiv, PRT er gyldig og IME kjører. Hvis disse verdiene ikke endres, er det et klart tegn på feil i join‑status, MDM‑registrering, gruppetilordning eller IME‑installasjon.