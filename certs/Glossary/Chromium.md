---
layout: default
title: Chromium
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Edge
---
_Chromium_ er et åpent kildekodeprosjekt som danner grunnlaget for flere moderne nettlesere, inkludert _Microsoft Edge_, _Google Chrome_, _Opera_, _Brave_ og mange flere.

Chromium gir:

- _Rask og sikker nettlesermotor_ (Blink + V8 JavaScript‑motor)
- _Moderne webstandarder_ (HTML5, CSS3, WebAssembly, WebGPU osv.)
- _Hyppige sikkerhetsoppdateringer_
- _Utvidelsesstøtte_ via Chrome Web Store‑kompatible APIer
- _Sandkasse‑basert sikkerhetsmodell_

Microsoft Edge bygger på Chromium, men legger til:

- Microsoft‑spesifikke sikkerhetsfunksjoner
- Enterprise‑policyer
- IE mode
- Integrasjon med Microsoft 365 og Windows

Chromium er viktig i MD‑102 fordi:

- Edge bruker Chromium som motor
- Webkompatibilitet og ytelse styres av Chromium
- Administratorer må forstå forskjellen mellom _Chromium‑motoren_ og _IE mode (MSHTML)_
- Mange policyer og nettleserfunksjoner i Edge er direkte basert på Chromium‑arkitekturen

_Chromium_ = moderne motoren i Edge
_MSHTML_ = eldre motoren brukt i IE mode