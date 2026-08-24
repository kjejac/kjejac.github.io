---
layout: default
title: Second-level Address Translation (SLAT)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Virtualization
  - MD-102/HyperV
  - MD-102/WindowsServer
  - MD-102/Windows10
  - MD-102/Windows11
---
Second Level Address Translation er en maskinvarebasert virtualiseringsteknologi som forbedrer ytelsen i virtuelle maskiner ved å redusere kostnaden for minneoversettelse. Moderne prosessorer fra Intel og AMD har egne implementasjoner: Intel bruker Extended Page Tables, mens AMD bruker Rapid Virtualization Indexing. SLAT gjør at hypervisoren kan håndtere minneoversettelser mer effektivt, noe som reduserer CPU‑belastning og gir raskere og mer stabile virtuelle maskiner. Dette er spesielt viktig for Hyper V og andre virtualiseringsfunksjoner i Windows 10 og Windows 11.

SLAT er et krav for flere Windows‑funksjoner som Hyper V, Windows Sandbox, Windows Subsystem for Android og Virtual Machine Platform. Uten SLAT vil disse funksjonene enten ikke fungere eller gi dårlig ytelse.

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

    A[VM gjør minneforespørsel] --> B[Guest OS oversetter virtuell adresse]
    B --> C[SLAT håndterer gjest til fysisk oversettelse]
    C --> D[CPU bruker EPT eller RVI]
    D --> E[Hurtigere minnetilgang uten shadow page tables]
    E --> F[Redusert CPU belastning og bedre ytelse]

```


[What Is SLAT (Second Level Address Translation) in Windows 11?](https://www.digitalcitizen.life/what-is-slat-second-level-address-translation-in-windows-11)
[Second Level Address Translation - Wikipedia](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)