---
layout: default
title: Device Preparation forenkler utrulling
nav_order: 6
parent: Execute device enrollment
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
  - MD-102/Autopilot
  - MD-102/Device
---
# Device Preparation forenkler utrulling

## Mål
Forstå hvordan Device Preparation forenkler utrulling uten imaging.

## Refleksjon

For meg minner Device Preparation om hvordan jeg jobbet med Task Sequence i SCCM.  Der var hele poenget å få en enhet fra “blank” til “klar for bruker” gjennom en sekvens av steg. Device Preparation gjør det samme, bare uten imaging og uten lokal infrastruktur. Readiness‑stegene føles som moderne preflight checks: nettverk, sikkerhet, policyer og required apps må være på plass før enheten kan tas i bruk. Det gir den samme tryggheten som en konfigurert Task Sequence, men med en mye enklere og skybasert modell. Erfaringen fra SCCM gjør det mer intuitivt å se hva Device Preparation prøver å løse, og hvorfor det er en viktig del av Autopilot‑opplevelsen.

## Verifiseringer

1. Enheten går inn i Device Preparation‑modus etter OOBE 
	- Dette bekrefter at Autopilot‑profilen er riktig tildelt og at readiness‑motoren starter. (Samme følelse som når en Task Sequence starter i SCCM.)
2. Readiness‑stegene vises og oppdateres 
	- Device Preparation evaluerer:
		- nettverk
		- sikkerhet
		- policyer
		- required apps (samme som preflight checks i SCCM)
3. Enheten havner i riktig gruppe
	- Dette er en av de viktigste verifiseringene. Device Preparation er avhengig av at enheten blir medlem av gruppen som inneholder:
		- required apps
		- sikkerhetspolicyer
		- konfigurasjoner
		- eventuelle compliance‑krav
	- Feil eller forsinket gruppetilordning gir umiddelbare stopp i readiness‑stegene. (Samme logikk som SCCM collections: feil collection = ingen TS, ingen required apps.)
4. Required apps begynner å installere
	- Dette bekrefter at IME er installert og at app‑tilordningen fungerer. Hvis required apps ikke starter > IME mangler eller gruppetilordningen er feil.
5. Device Preparation fullfører uten stopp 
	- Fullføring betyr:
		- alle readiness‑stegene er grønne
		- required apps er installert
		- policyer er levert
		- enheten går videre til Account setup Dette er Intune‑versjonen av “TS completed successfully”.
6. Event Viewer viser IME‑aktivitet
	- Under: `Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider` Du skal se:
		- IME installeres
		- IME starter
		- Win32‑motoren kjører
		- policyer leveres Dette er samme type agent‑verifisering som i SCCM.
7. Enheten ender i en fullkonfigurert tilstand Språk, region, SmartScreen, ASR, Network Protection, Controlled Folder Access og andre HKCU‑policyer skal være satt.

## Vanlige feil og hvordan de løses

_Feil:_ Required apps installeres ikkeetter Device Preparation, enheten er ikke ferdig konfigurert     <br>
_Årsak:_ IME mangler, feil gruppe, feil tilordning     <br>
_Løsning:_ Sjekk IME, gruppetilordning, required‑tilordning

_Feil:_ Security readiness stopper, sikkerhetspolicyer leveres ikke<br>
_Årsak:_ Policyer ligger i feil gruppe eller krever IME<br>
_Løsning:_ Flytt policyer til enhetsgruppe, verifiser med IME

_Feil:_ Policy readiness feiler, HKLM-policyer leveres ikke<br>
_Årsak:_ MDM-kanalen leverer ikke, eller policyer ligger feil<br>
_Løsning:_ Sjekk MDM-policyer, gruppetilordning, konflikter

_Feil:_ Enheten havner ikke i riktig gruppe, required apps og policyer vises ikke i Device Preparation<br>
_Årsak:_ Dynamisk regel matcher ikke DeviceId<br>
_Løsning:_ Sjekk dynamisk regel, group tag, Autopilot-profil

_Feil:_ IME installeres ikke, Win32-motoren mangler<br>
_Årsak:_ Ingen Win32-innhold tilordnet<br>
_Løsning:_ Tilordne Win32-app/script, resync

_Feil:_ Required apps feiler, apper stopper under installasjon<br>
_Årsak:_ Detection rule, install command, IME-timing<br>
_Løsning:_ Sjekk IME-logger, detection rule, reboot-krav

_Feil:_ Enheten fullfører, men er halvkonfigurert. Mangler språk, region, SmartScreen ASR osv.<br>
_Årsak:_ HKCU-policyer mangler IME<br>
_Løsning:_ Sjekk IME, required apps, HKCU-policyer

## Steg for steg

1. Enheten registreres i Autopilot og havner i riktig gruppe
2. Device Preparation starter og evaluerer readiness (nettverk, policy, sikkerhet, apper)
3. IME installeres og begynner å levere Win32‑apper og HKCU‑policyer
4. Required apps og policyer fullfører, og enheten går videre til Account setup
5. Enheten ender i en fullkonfigurert tilstand uten imaging

[Endre språk‑, region‑ og keyboard‑innstillinger](MD-102-Configure-Enrollment-Status-Page-LangRegion-Keyboard-24H.md) viser hvordan Device Preparation og IME leverer HKCU-policyer som tidligere ble satt via imaging. Den demonstrerer hvordan moderne cloud provisioning erstatter tradisjonell OSD. 
