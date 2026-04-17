---
layout: default
title: Windows Defender System Guard
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/SystemGuard
  - MD-102/Endpoint
  - MD-102/DefenderEndpoint
  - MD-102/Defender
---
Windows Defender System Guard beskytter systemintegriteten gjennom hele livssyklusen. Løsningen isolerer kritiske tjenester i en egen sikker beholder og sørger for at systemet ikke kan manipuleres av angripere, selv om de får høy privilegert tilgang. System Guard samler flere integritetsfunksjoner i en helhetlig modell som styrker plattformens motstandskraft.

## Maintain the integrity of the system as it starts

System Guard bygger på en maskinvarebasert rot av tillit gjennom Secure Boot og UEFI. Dette hindrer at uautoriserte komponenter som bootkits og rootkits kan starte før Windows. Bare signerte og sikre Windows filer og drivere lastes inn. Når oppstarten er fullført, aktiveres antimalwareløsningen for å skanne tredjepartsdrivere. Dette sikrer at systemet starter i en tilstand med høy integritet.

## Maintain integrity of the system after it is running (run time)

System Guard bruker virtualiseringsbasert sikkerhet til å isolere kritiske tjenester som Credential Guard, Device Guard, Virtual TPM og deler av Exploit Guard. Disse tjenestene ligger i et maskinvareisolert miljø som ikke kan manipuleres selv om angriperen får SYSTEM nivå eller kompromitterer kjernen. Dette gir et robust forsvar mot avanserte angrep.

## Validate platform integrity after Windows is running (run time)

System Guard tar integritetsmålinger under oppstart og lagrer dem i TPM 2.0 i et maskinvareisolert område. Målingene signeres og kan hentes av administrasjonsverktøy som Intune eller Configuration Manager for ekstern validering. Dersom integriteten ikke kan bekreftes, kan tilgang til ressurser nektes. Dette bygger på et assume breach prinsipp og gir en viktig kontrollmekanisme i moderne sikkerhetsarkitektur.

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

    A[Explore Windows Defender System Guard]

    A --> B[Maintain the integrity of the system as it starts]
    B --> B1[Secure Boot og UEFI etablerer rot av tillit]
    B --> B2[Bare signerte og sikre filer og drivere lastes]
    B --> B3[Antimalware skanner tredjepartsdrivere]

    A --> C[Maintain integrity of the system after it is running]
    C --> C1[Virtualiseringsbasert sikkerhet]
    C --> C2[Isolasjon av Credential Guard og Device Guard]
    C --> C3[Beskyttelse selv ved SYSTEM nivå kompromiss]

    A --> D[Validate platform integrity after Windows is running]
    D --> D1[TPM 2.0 lagrer integritetsmålinger]
    D --> D2[Målinger signeres og kan hentes eksternt]
    D --> D3[Brukes til å nekte tilgang ved manglende integritet]

```

<a href="/certs/diagrams/system-guard.html" target="_blank" rel="noopener">Stort diagram</a>


[Explore Windows Defender System Guard ](https://learn.microsoft.com/en-us/training/modules/manage-microsoft-defender-endpoint/7-explore-windows-defender-system-guard)