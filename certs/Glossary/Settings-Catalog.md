---
layout: default
title: Settings Catalog
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
  - MD-102/OMA-URI
  - MD-102/GPO
  - MD-102/MDM
  - MD-102/Windows
  - MD-102/macOS
  - MD-102/iPadOS
  - MD-102/Android
  - MD-102/ADMX
  - MD-102/AppleDeclarativeDeviceManagment
  - MD-102/DDM
---
Settings catalog **samler alle konfigurerbare innstillinger i Intune i en konsolidert visning**, slik at du slipper å lete gjennom ulike maler eller OMA‑URI‑profiler.

Dette gjør det enklere å:

- finne relevante innstillinger
- se hele bredden av hva som kan konfigureres
- bygge presise og målrettede profiler

## Gir _granulær kontroll_ – tilsvarer GPO‑nivå

Microsoft beskriver Settings catalog som en **naturlig overgang fra tradisjonelle Group Policy Objects (GPO)** til moderne, skybasert MDM‑styring.

Du starter fra blank profil og legger kun til de innstillingene du vil styre, ingen skjulte standarder eller forhåndsdefinerte maler.

## Støtter alle store plattformer

Settings catalog fungerer på:

- Windows
- macOS
- iOS/iPadOS
- Android (AOSP og Android Enterprise)
- tvOS / visionOS

Dette gjør den til den mest fleksible konfigurasjonsmetoden i Intune.

## Erstatter mange tidligere policytyper

Settings catalog **erstatter behovet for:**

- Administrative Templates (ADMX)
- Custom OMA‑URI‑profiler
- Flere eldre malbaserte profiler

Eksempel: Chrome‑policyer på Windows som tidligere krevde OMA‑URI kan nå konfigureres direkte i Settings catalog.

## Støtter moderne funksjoner som Copilot og DDM

Microsoft fremhever at Settings catalog er tett integrert med:

### ✔ Microsoft Copilot i Intune

Copilot kan:

- forklare innstillinger
- identifisere konflikter
- oppsummere profiler
- gi sikkerhets‑ og bruker‑impact‑analyse

### ✔ Apple Declarative Device Management (DDM)

DDM‑funksjoner som software update, passcode, Safari‑styring m.m. er tilgjengelig direkte i katalogen.

## Konflikthåndtering og rapportering

Settings catalog har innebygget støtte for:

- konfliktanalyse
- visning av hvilke innstillinger som vinner
- rapportering av policy‑status

Dette gjør feilsøking betydelig enklere enn med eldre profiler.

## Kontinuerlig oppdatert

Microsoft legger fortløpende til nye innstillinger i katalogen. Den offisielle kilden for full liste er IntunePMFiles/DeviceConfig‑repoet.



[Create a policy using settings catalog in Microsoft Intune - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/device-configuration/settings-catalog/&tabs=ios%2Csc-search-filter%2Csc-reporting)
[Common tasks and features in the settings catalog - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/device-configuration/settings-catalog/common-tasks)