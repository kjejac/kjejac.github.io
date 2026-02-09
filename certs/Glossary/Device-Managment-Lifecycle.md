---
layout: default
title: Device Managment Lifecycle
nav_order:
parent:
has_children:
nav_exclude: true
has_toc:
tags:
  - MD-102
  - MD-102/DeviceManagmentLifecycle
---
Device Management Lifecycle (DML) er en strategisk prosess for å håndtere hele livssyklusen til enheter, fra innkjøp til avhending. Det innebærer planlegging, anskaffelse, klargjøring, drift, vedlikehold og til slutt avhending av enheter som ansatte bruker i jobben. DML sikrer at hver enhet brukes effektivt og gir maksimal verdi. Med en god DML‑prosess kan IT alltid svare på spørsmål som:
- Hva skjedde med en ansatts gamle laptop?
- Hvilke enheter nærmer seg utskifting?
- Hvordan begrunner vi behovet for nye enheter?

DML handler om å ha en strukturert prosess for hele enhetens livssyklus:
1. Planlegging  
	- Definere behov, standarder, sikkerhetskrav og plattformer.
2. Anskaffelse  
	- Kjøpe enheter gjennom godkjente kanaler (f.eks. ABM for Apple, Zero‑touch for Android).
3. Provisioning / Enrollment  
	- Registrere enheter i Intune via:
		- Autopilot (Windows)
		- ADE/DEP (iOS)
		- Android Enterprise
		- Company Portal (BYOD)
			- Dette er kjernen i MD‑102.
4. Drift og vedlikehold  
	- Policyer, compliance, app‑distribusjon, oppdateringer, sikkerhetstiltak.
5. Support og feilsøking  
	- Remote actions, rapportering, overvåking.
6. Avhending / Decommissioning  
	- Wipe, retire, fjerne fra Intune, dokumentere avhending.