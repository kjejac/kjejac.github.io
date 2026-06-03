---
layout: default
title: Microsoft Edge Internet Explorer mode
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Edge
---
_Internet Explorer mode (IE mode)_ i Microsoft Edge gjør det mulig å kjøre eldre webapplikasjoner som krever Internet Explorer 11, samtidig som man bruker en moderne nettleser. Dette er viktig i virksomheter som fortsatt har intranettløsninger, ActiveX‑baserte apper eller portaler som ikke fungerer i moderne nettlesere.

IE mode bruker:

- _Chromium‑motoren_ for moderne nettsteder
- _MSHTML/Trident‑motoren_ fra Internet Explorer 11 for eldre nettsteder

Bare nettsteder som er definert i en _Enterprise Mode Site List_ åpnes i IE mode. Alle andre nettsteder rendres som moderne sider.

IE mode støtter blant annet:

- dokumentmoduser og enterprise moduser
- ActiveX
- Browser Helper Objects
- IE‑relaterte sikkerhetssoner
- F12‑verktøy for IE via IEChooser

IE mode støtter _ikke_:

- IE‑verktøylinjer
- IE‑navigasjonsinnstillinger
- F12‑verktøy for IE11 eller Edge

IE mode aktiveres via:

- Enterprise Mode Site List
- Group Policy
- Edge‑innstillinger (Allow sites to be reloaded in IE mode)

Dette gjør IE mode til en overgangsløsning for organisasjoner som må støtte eldre apper samtidig som de moderniserer nettleserplattformen.

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

    A[Start<br>Behov for eldre webapplikasjoner] --> B[Microsoft Edge med IE mode]
    B --> C[Moderne nettsteder<br>Chromium motor]
    B --> D[Eldre nettsteder<br>MSHTML IE11 motor]

    D --> E[Enterprise Mode Site List<br>Definerer hvilke sider som åpnes i IE mode]

    E --> F[Støttet funksjonalitet<br>Dokumentmoduser, ActiveX, BHO, sikkerhetssoner, IEChooser]
    E --> G[Ikke støttet<br>IE verktøylinjer, IE navigasjon, F12 i IE11/Edge]

    F --> H[Aktivering via Group Policy<br>Configure Internet Explorer integration]
    F --> I[Aktivering via Edge<br>Allow sites to be reloaded in IE mode]

    H --> J[Legacy sider åpnes i IE mode]
    I --> J
    C --> K[Moderne sider åpnes som vanlig]

    J --> L[Enhetlig nettleseropplevelse i Edge]

```