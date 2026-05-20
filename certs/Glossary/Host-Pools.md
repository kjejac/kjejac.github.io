---
layout: default
title: Host pools
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/VDI
  - MD-102/VirtualDesktop
---
En host pool er en samling virtuelle maskiner som leverer skrivebord eller apper til brukere i Azure Virtual Desktop. Host poolen bestemmer hvordan brukere kobles til, hvordan belastning fordeles og om hver bruker får sin egen maskin eller deler kapasitet med andre.

Det finnes to hovedtyper host pools:

- **Pooled**: Flere brukere deler samme virtuelle maskin. Dette gir høy tetthet og lavere kostnader. Brukere tildeles en tilgjengelig sesjon basert på belastningsfordeling og MaxSessionLimit.
- **Personal**: Hver bruker får sin egen dedikerte virtuelle maskin. Dette gir en mer forutsigbar og personlig opplevelse, men krever mer kapasitet.
    

Host pools bruker en tildelingsmetode som styrer hvordan brukere kobles til maskiner, for eksempel breadth first eller depth first. Autoscale kan brukes for å starte og stoppe maskiner basert på belastning eller tidsplan.

Host pools er kjernen i AVD og avgjør både kostnader, ytelse og brukeropplevelse.

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
flowchart LR

    A[Host pool] --> B[Pooled]
    A --> C[Personal]

    B --> B1[Flere brukere per VM]
    B --> B2[MaxSessionLimit]
    B --> B3[Belastningsfordeling]

    C --> C1[En bruker per VM]
    C --> C2[Dedikert miljø]

    A --> D[Tildelingsmetoder]
    D --> D1[Breadth first]
    D --> D2[Depth first]
    D --> D3[Load balancing]

    A --> E[Autoscale]
    E --> E1[Starter VM ved behov]
    E --> E2[Stopper VM ved lav belastning]

```

