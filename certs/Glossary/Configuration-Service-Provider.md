---
layout: default
title: Configuration Service Provider (CSP)
nav_order:
parent:
has_children:
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CSP
---
En Configuration Service Provider (CSP) er et grensesnitt som lar Intune og andre MDM‑tjenester lese, endre og fjerne konfigurasjonsinnstillinger på Windows‑enheter. CSP‑ene fungerer som et bindeledd mellom MDM‑systemet og selve operativsystemet, og mange av innstillingene de styrer tilsvarer registry‑nøkler eller systemfiler.

CSP‑er kan sammenlignes med GPO‑klientsideutvidelser: de gir tilgang til å konfigurere funksjoner og policyer på en standardisert måte. De brukes av både Microsoft Intune og andre MDM‑leverandører, og mottar innstillinger i SyncML‑format, som sendes fra en MDM‑server.

For IT‑administratorer er CSP‑er helt sentrale. De gjør det mulig å styre alt fra sikkerhet og nettverk til funksjoner og restriksjoner på Windows‑klienter og de ligger bak mange av de moderne administrasjonsmulighetene som brukes i organisasjoner i dag.