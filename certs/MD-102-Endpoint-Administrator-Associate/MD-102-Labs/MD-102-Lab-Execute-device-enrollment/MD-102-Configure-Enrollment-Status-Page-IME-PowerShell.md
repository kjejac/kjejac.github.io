---
layout: default
title: Forstå IME som leveringsmotor i ESP
nav_order: 4
parent: Konfigurere Enrollment Status siden
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
  - MD-102/Baseline
  - MD-102/ScriptExecution
  - MD-102/Policy
  - MD-102/PowerShell
  - MD-102/IntuneManagementExtension
  - MD-102/IME
---
# Forstå IME som leveringsmotor i ESP

## Mål
Forstå hvordan _Intune Management Extension (IME)_ fungerer som leveringsmotor for Win32‑apper, scripts og HKCU‑policyer i Autopilot, og hvorfor ESP er avhengig av både MDM‑kanalen og IME for å fullføre enheten.

## Refleksjon

Arbeidet med Autopilot og IME minner mye om hvordan SCCM‑klienten fungerte i et tradisjonelt miljø. I SCCM var klienten selve motoren som leverte apper, scripts, policyer og status. Hvis SCCM‑klienten manglet, stoppet alt opp: apper ble ikke installert, scripts ble ikke kjørt, og policyer ble stående som “pending”. Det samme skjer i Intune når IME ikke er til stede. IME er i praksis den moderne sky‑versjonen av SCCM‑klienten, og uten den får ikke enheten den konfigurasjonen den skal ha.

Oppgaven viser at ESP ikke er en leveringsmotor, men en kontrollflate som kun viser status for det som faktisk blir levert. Når Device Preparation‑policyen kun inneholder MDM‑policyer, installeres ikke IME, og ESP stopper på apper, sikkerhetspolicyer og brukeroppsett. Resultatet er en halvkonfigurert enhet som mangler Win32‑apper, PowerShell‑scripts og alle HKCU‑policyer. Dette inkluderer språk, region, SmartScreen, ASR, Network Protection og Controlled Folder Access. Event Viewer viser det samme symptombildet som en SCCM‑klient som ikke er til stede: _IME not present_ eller _IME pending install_.

Når IME installeres, faller hele sikkerhetskonfigurasjonen på plass. Win32‑motoren starter, scripts leveres, HKCU‑policyer settes, og ESP kan fullføre. Dette gir en forståelse av hvorfor IME er en basis‑komponent i moderne Autopilot‑miljøer, og hvorfor en stabil og forutsigbar klientopplevelse er avhengig av at IME fungerer fra starten av. Parallellen til SCCM gjør det enklere å forstå Intune‑logikken: uten en fungerende agent finnes det ingen leveringsmotor, og uten leveringsmotor finnes det ingen fullverdig klient.

## Verifiseringer

### GUI

Se under Settings om språk og region er satt korrekt. Sjekk også om SmartScreen, ASR og andre brukerbaserte sikkerhetsinnstillinger er levert.

### PowerShell

```PowerShell
Get-MpComputerStatus
Get-MpPreference
Get-NetFirewallProfile
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer'
```

## Vanlige feil og hvordan de løses

_Feil:_ IME blir ikke installert under Autopilot eller ESP<br>
_Årsak:_ IME installeres kun når enheten har minst en Win32-app eller PowerShell-script tilordnet. Uten dette ser Intune ingen grunn til å installere IME-agenten<br>
_Løsning:_ Tilordne en Win32-app (f.eks. Notepad++) eller et PowerShell-script til enheten. Kjør ny sync eller start en ny Autopilot-utrulling

_Feil:_ ESP viser "Completed", men klienten mangler ASR, Network protection og Controlled Folder Accsses<br>
_Årsak:_ Disse sikkerhetsfunksjonene leveres via IME (Win32-motoren), ikke via MDM-kanalen. Hvis IME ikke er installert, leveres ikke disse policyene<br>
_Løsning:_ Sørg for at IME installeres ved å tilordne minst en Win32-app eller PowerShell-script. Kjør ny sync og verifiser at IME-agenten starter

_Feil:_ Policyer som ligger i `HKCU` (brukerprofilen) blir ikke levert<br>
_Årsak:_ HKCU-policyer krever IME og PowerShell. MDM-kanalen leverer kun `HKLM`-policyer og kan ikke skrive til `HKCU`<br>
_Løsning:_ Imstaller IME ved å tilordne Win32-app eller script. Kjør scriptet med "Run using logged-on credentials = Yes"

_Feil:_ Device Preperation-policyen ser fortsatt aktiv ut, selv om Assignments er fjernet<br>
_Årsak:_ Device Preperation-policyer er knyttet til _Device group_, som ikke kan fjernes. Så lenge enheten fortsatt er "eliigible", vil policyen se aktiv ut selv om Assignments er slettet<br>
_Løsning:_ Fjernn enheten fra Device group (ZTDId eller tilsvarende). Vent til Intune oppdaterer eligibility-statusen. Policyen vil da ikke lenger vises som aktiv

## Steg for steg

### Autopilot-utrulling uten IME

IME installeres kun når enheten har en tilordnet _Win32-app_ eller _PowerShell-script_. Hvis Device Preparation-policyen kun inneholder MDM-policyer, vil IME ikke bli installert. Under oppsettet (etter innlogging med Entra-kontoen) vil ESP derfor stoppe på _Apps_ og _Security policies_, og Win32-apper og PowerShell-scripts blir ikke levert. Dette fører til at HKCU-policyer som språk, region, SmartScreen og ASR ikke blir satt. Event Viewer vil vise _IME not present_ eller _IME pending install_.



