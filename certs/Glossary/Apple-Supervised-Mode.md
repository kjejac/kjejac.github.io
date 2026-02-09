---
layout: default
title: Apple Supervised Mode
nav_order:
parent:
has_children:
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/AppleSupervisedMode
  - MD-102/Apple
---
Supervised mode er en forsterket administrasjonsmodus for iOS/iPadOS som gir IT langt større kontroll over enheten enn vanlig MDM‑registrering. Den brukes nesten alltid på bedriftseide enheter.

## Hva supervised mode gir (viktigste punkter)
- Flere policyer og restriksjoner (f.eks. blokkere AirDrop, iMessage, App Store, Siri, USB‑tilbehør).
- Stille installasjon av apper uten brukerinteraksjon.
- Mer avansert konfigurasjon, som web‑innholdsfiltre, global proxy, og Single App Mode.
- Bedre sikkerhet – IT kan låse ned enheten mye mer enn på BYOD.
- Automatisk aktivering når en enhet registreres via ADE/DEP.

## Hvordan en enhet blir supervised
Det finnes to måter:
1. Automated Device Enrollment (ADE/DEP)
	– Enheten kjøpes via Apple/autoriserte forhandlere
	– Legges i Apple Business Manager
	– Tilordnes Intune
	→ Supervised aktiveres automatisk ved første oppstart

2. Apple Configurator (manuell)
	– Brukes når enheter ikke kommer via ABM
	– Krever fysisk tilgang og Mac
	→ Enheten blir supervised etter klargjøring

## Når supervised bør brukes
- Alltid på bedriftseide enheter
- Kiosker, skoler, delte enheter
- Enheter som skal ha strenge sikkerhetskrav
- Når du trenger stille app‑installasjon eller avanserte restriksjoner

## Kort huskeliste
BYOD → ikke supervised
Bedriftseid → supervised
ADE = automatisk supervised
Configurator = manuell supervised