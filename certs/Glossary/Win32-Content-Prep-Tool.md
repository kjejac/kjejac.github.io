---
layout: default
title: Win32 Content Prep Tool / IntuneWinAppUtil.exe)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - "#MD-102/IntuneWinAppUtil"
  - MD-102/Win32ContentPrepTool
  - MD-102/IntuneWin
  - MD-102/IntuneManagementExtension
---
_Win32 Content Prep Tool_, også kjent som _IntuneWinAppUtil.exe_, brukes til å konvertere tradisjonelle Windows‑applikasjoner (EXE, MSI, skript) til _.intunewin‑formatet_, som Intune kan distribuere som Win32‑apper.

Verktøyet pakker installasjonsfilene i en komprimert og kryptert container. Dette gjør distribusjonen mer effektiv, sikrer at innholdet ikke manipuleres, og muliggjør avansert administrasjon gjennom _Intune Management Extension (IME)_.

For MD‑102 er dette viktig fordi _alle Win32‑apper i Intune må pakkes med dette verktøyet_.

### Viktige egenskaper (MD‑102 relevant)

- _Konverterer EXE, MSI og skript til .intunewin_ Intune kan ikke distribuere rå EXE‑filer.
- _Komprimerer og krypterer innholdet_ Reduserer båndbredde og beskytter installasjonsfiler.
- _Brukes sammen med Intune Management Extension_ IME håndterer installasjon, logging, retry og status.
- _Støtter komplekse installasjoner_ For eksempel PowerShell‑baserte installasjoner eller apper med mange filer.
- _Gir fleksibilitet_ Administrator definerer installasjonskommandoer, avinstallasjonskommandoer, detection rules og return codes.

### Begrensninger

- Kan ikke brukes til UWP eller Microsoft Store‑apper
- Støtter ikke differensielle oppdateringer
- Krever at administrator definerer detection rules manuelt
- Hele pakken må lastes ned ved oppdatering