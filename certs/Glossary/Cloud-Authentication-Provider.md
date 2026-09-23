---
layout: default
title: Cloud Authentication Provider (CloudAP)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/EntraID
  - MD-102/EntraJoin
  - MD-102/Authentication
  - MD-102/PRT
  - MD-102/PrimaryRefreshToken
  - MD-102/SSO
  - MD-102/EntraIDSSO
---
_CloudAP_ (Cloud Authentication Provider) er Windows‑komponenten som håndterer autentisering mot _Microsoft Entra ID_ på en Entra‑tilknyttet enhet. Den fungerer som broen mellom Windows‑innlogging og Entra‑basert identitet.

CloudAP gjør følgende:

- mottar og lagrer _Primary Refresh Token (PRT)_ etter Entra‑innlogging
- bruker PRT til å hente nye tokens for apper og tjenester
- sørger for _single sign‑on (SSO)_ i Windows‑miljøet
- håndterer fornyelse av tokens og policykrav fra Entra ID
- integrerer med Windows Credential Provider for å gi en sømløs innloggingsopplevelse

CloudAP er dermed den mekanismen som gjør at en Entra‑joined Windows‑enhet kan autentisere seg mot skyen uten lokal AD, og er en nøkkelkomponent i moderne administrasjon.

[Join Windows 11 Devices to Microsoft Entra ID During OOBE - Microsoft Entra ID | Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity/devices/device-join-out-of-box)