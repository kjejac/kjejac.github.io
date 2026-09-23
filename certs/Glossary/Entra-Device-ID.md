---
layout: default
title: Entra Device ID
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/EntraID
  - MD-102/EntraJoin
  - MD-102/PRT
  - MD-102/PrimaryRefreshToken
  - MD-102/CA
  - MD-102/SSO
  - MD-102/EntraIDSSO
  - MD-102/MDM
  - MD-102/Authentication
---
_Device ID_ er den unike identiteten som en Windows‑enhet får når den blir _Microsoft Entra joined_. Den opprettes i Entra ID under join‑prosessen og brukes til å:

- identifisere enheten i organisasjonens katalog
- knytte enheten til brukeren som logger inn
- gjøre det mulig for Entra ID å utstede PRT (Primary Refresh Token)
- gi Intune og andre administrasjonstjenester et fast referansepunkt
- håndheve policyer, tilgangskontroll og sikkerhetskrav på enhetsnivå

Device ID fungerer dermed som _den tekniske identiteten_ som moderne administrasjon bygger på. Uten Device ID kan ikke enheten delta i Entra‑basert autentisering, SSO, MDM‑registrering eller Conditional Access.

[Join Windows 11 Devices to Microsoft Entra ID During OOBE - Microsoft Entra ID | Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity/devices/device-join-out-of-box)
