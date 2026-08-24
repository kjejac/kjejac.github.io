---
layout: default
title: Reputation-basert protection
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/WindowsSecurity
  - MD-102/Defender
  - MD-102/SmartScreen
  - MD-102/DefenderAntivirus
---
Reputation‑based protection i Windows Security er et sett med funksjoner som blokkerer filer, apper, nettsteder og nedlastinger som har dårlig eller ukjent omdømme basert på Microsofts sikkerhetsintelligens. Det beskytter mot:

- _Potensielt uønskede apper (PUA)_ som adware, bundlere og evasion‑programmer
- _Skadelige eller mistenkelige nedlastinger_ (SmartScreen sjekker filer mot kjente skadelige programmer og ser om filer mangler etablert omdømme)
- _Phishing og skadelige nettsteder_ ved å sjekke URL‑er mot Microsofts dynamiske lister over rapporterte phishing‑ og malware‑sider

Funksjonen ligger under _Windows Security → App & browser control → Reputation‑based protection_ og fungerer sammen med Microsoft Defender Antivirus og SmartScreen. Den gir et ekstra lag med beskyttelse ved å stoppe trusler før de får kjøre eller lastes ned.

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

    A[Filer / Apper / URLer] --> B[Reputasjonssjekk<br>SmartScreen / PUA]
    B --> C[Microsoft sikkerhetsintelligens<br>Phishing / Malware / Omdømme]
    C --> D[Tillat]
    C --> E[Varsle]
    C --> F[Blokker]

```