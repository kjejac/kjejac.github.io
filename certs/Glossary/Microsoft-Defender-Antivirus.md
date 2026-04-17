---
layout: default
title: Microsoft Defender Antivirus
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Defender
  - MD-102/Endpoint
  - MD-102/DefenderEndpoint
  - MD-102/DefenderAntivirus
  - MD-102/Antivirus
---
Microsoft Defender Antivirus er standard antivirusmotor i Windows 10 og Windows 11. Den bruker maskinlæring, big data analyse og skybasert intelligens for å oppdage og blokkere nye trusler i løpet av millisekunder. Den overvåker filer, prosesser og nettverkstrafikk i sanntid og fungerer både alene og som del av Microsoft Defender for Endpoint.

Viktige egenskaper:

- _Sanntidsbeskyttelse_ som overvåker filer, prosesser og nedlastinger.
- _Skybasert beskyttelse_ som gir rask respons på nye trusler.
- _Maskinlæring og prediktiv analyse_ for å stoppe ukjent malware.
- _Integrasjon med Intelligent Security Graph_ for global trusselintelligens.
- _Innebygd i Windows_, ingen installasjon nødvendig.
- _Støtte for både online og offline scenarier_ med oppdaterte signaturer.

For MD 102 er det viktig å forstå at Defender Antivirus er grunnlaget for neste generasjons beskyttelse og kreves for flere funksjoner i Attack Surface Reduction, Network Protection og Controlled Folder Access.

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

    A[Microsoft Defender Antivirus]

    A --> B[Sanntidsbeskyttelse]
    B --> B1[Overvåker filer og prosesser]
    B --> B2[Stopper skadelig aktivitet i sanntid]

    A --> C[Skybasert beskyttelse]
    C --> C1[Rask blokkering av nye trusler]
    C --> C2[Intelligent Security Graph]

    A --> D[Maskinlæring]
    D --> D1[Prediktiv analyse]
    D --> D2[Oppdager ukjent malware]

    A --> E[Integrasjon i Windows]
    E --> E1[Innebygd i Windows 10 og 11]
    E --> E2[Fungerer med Defender for Endpoint]

    A --> F[Offline og online]
    F --> F1[Lokal intelligens]
    F --> F2[Skyoppdateringer når tilgjengelig]

```

<a href="/certs/diagrams/defender-antivirus.html" target="_blank" rel="noopener">Stort diagram</a>

[Microsoft Defender Antivirus in Windows Overview - Microsoft Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/microsoft-defender-antivirus-windows?utm_source=copilot.com)