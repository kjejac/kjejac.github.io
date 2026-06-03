---
layout: default
title: MSHTML
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/MSHTML
  - MS-102/Trident
  - MD-102/Edge
  - MD-102/LOB
---
**MSHTML**, også kjent som **Trident**, er den gamle renderingsmotoren som ble brukt av Internet Explorer 11. Den er fortsatt inkludert i Windows av én grunn: **IE mode i Microsoft Edge**.

MSHTML brukes når:

- eldre webapplikasjoner krever Internet Explorer 11
- nettsteder trenger ActiveX, Browser Helper Objects eller gamle dokumentmoduser
- virksomheter har intranettløsninger som ikke fungerer i moderne nettlesere

MSHTML støtter:

- ActiveX
- Browser Helper Objects
- eldre dokumentmoduser (IE5–IE11)
- enterprise moduser
- IE sikkerhetssoner
- F12‑verktøy via IEChooser

MSHTML støtter **ikke**:

- moderne webstandarder som Chromium håndterer
- moderne JavaScript‑ytelse
- moderne sikkerhetsmodeller
- IE verktøylinjer i IE mode
- F12‑verktøy i Edge

I MD‑102 er MSHTML viktig fordi:

- IE mode bruker MSHTML for eldre nettsteder
- administrator må vite når MSHTML brukes og når Chromium brukes
- site lists styrer hvilke nettsteder som åpnes med MSHTML

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%
flowchart TB

    A[MSHTML<br>Trident motor] --> B[Brukt av Internet Explorer 11]
    B --> C[Brukt i IE mode i Microsoft Edge]

    C --> D[Støtter<br>ActiveX, BHO, dokumentmoduser, sikkerhetssoner]
    C --> E[Ikke støtter<br>Moderne webstandarder, moderne F12 verktøy]

    D --> F[Eldre nettsteder åpnes i IE mode]
    E --> G[Moderne nettsteder åpnes med Chromium]

    F --> H[Kompatibilitet for gamle LOB apper]
    G --> I[Moderne ytelse og sikkerhet]

```