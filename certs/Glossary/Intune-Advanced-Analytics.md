---
layout: default
title: Advanced Analytics in Microsoft Intune Suite
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
  - MD-102/IntuneSuite
  - MD-102/PowerBI
  - MD-102/Compliance
  - MD-102/ThreatDetection
  - MD-102/License
  - MD-102/EndpointAnalytics
---
Intune Advanced Analytics er et tillegg i Intune Suite som gir **dypere innsikt i enheters ytelse, stabilitet og brukeropplevelse** enn det som finnes i standard Endpoint Analytics. Løsningen bygger på **telemetri fra Windows‑enheter** og gir IT mulighet til å jobbe mer proaktivt, redusere supportkostnader og forbedre brukeropplevelsen.

Advanced Analytics utvider Endpoint Analytics med:

- **Resource performance report** – viser CPU og RAM‑problemer per modell og produsent
- **Battery health report** – overvåker batterikvalitet og degradering over tid
- **Anomalies report** – oppdager regresjoner etter endringer i miljøet
- **Device timeline** – lav latens og flere hendelser for raskere feilsøking
- **Device query** – nesten sanntids spørringer mot enheter for konfigurasjon og status
- **Custom device scopes** – filtrering av rapporter basert på scope tags

Dette gjør det mulig å:

- identifisere ytelsesproblemer før brukerne merker dem
- oppdage trender og avvik etter policyendringer
- benchmarke organisasjonen mot andre miljøer
- prioritere utskifting av maskinvare basert på faktiske data

### Krav

- Windows‑enheter må være Intune‑administrert eller co‑managed
- Enhetene må være Entra‑joined eller hybrid joined
- Funksjonen krever Intune Suite eller egen Advanced Analytics‑lisens

### MD‑102

Advanced Analytics viser hvordan Intune:

- bruker data for å forbedre drift og brukeropplevelse
- støtter proaktiv feilsøking
- gir innsikt som styrker Zero Trust og samsvar
- reduserer behovet for manuell feilsøking

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

    A[Intune Advanced Analytics] --> B[Datagrunnlag]
    B --> B1[Endpoint Analytics telemetri]
    B --> B2[Nesten sanntids data]

    A --> C[Rapporter]
    C --> C1[Resource performance]
    C --> C2[Battery health]
    C --> C3[Anomalies]
    C --> C4[Device timeline]

    A --> D[Verktøy]
    D --> D1[Device query]
    D --> D2[Custom device scopes]

    A --> E[Fordeler]
    E --> E1[Proaktiv feilsøking]
    E --> E2[Bedre brukeropplevelse]
    E --> E3[Benchmarking]
    E --> E4[Redusert supportbelastning]

    A --> F[Krav]
    F --> F1[Intune eller co-managed]
    F --> F2[Entra joined]
    F --> F3[Intune Suite eller add-on]

```


[Advanced Analytics Overview - Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/intune/advanced-analytics/"Advanced Analytics Overview - Microsoft Intune | Microsoft Learn")
[Advanced Analytics | Intune Suite | Intune | michaelsendpoint.com](https://michaelsendpoint.com/intune/intune_suite/advanced_analytics.html)