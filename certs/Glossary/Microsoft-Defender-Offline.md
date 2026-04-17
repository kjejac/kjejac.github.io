---
layout: default
titleMicrosoft Defender Offline:
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Defender
  - MD-102/Antivirus
  - MD-102/DefenderAntivirus
---
Microsoft Defender Offline er et skanneverktøy som kjører fra et eget, isolert miljø utenfor Windows. Det brukes når skadevare er så dypt integrert i systemet at den ikke kan fjernes mens Windows kjører. Dette gjelder særlig rootkits, MBR infeksjoner og annen vedvarende skadevare som forsøker å skjule seg før operativsystemet starter.

Verktøyet starter i Windows Recovery Environment og kjører en full skanning med oppdaterte definisjoner. Siden skanningen skjer utenfor Windows kjernen, kan den oppdage og fjerne trusler som ellers ville vært skjult. Dette gjør Microsoft Defender Offline til et viktig verktøy i situasjoner der vanlig skanning ikke er nok.

# Når Microsoft Defender Offline bør brukes

- Mistanke om rootkits eller annen skjult skadevare
- Vedvarende infeksjoner som kommer tilbake etter vanlig skanning
- Når Windows Security anbefaler det etter funn av alvorlige trusler
- Når du vil bekrefte at et system er helt rent etter et utbrudd

# Viktige krav

- Microsoft Defender Antivirus må være aktivt
- WinRE må være aktivert
- BitLocker bør suspenderes før skanningen for å unngå krav om gjenopprettingsnøkkel
- Administratorrettigheter kreves for å starte skanningen

# MD 102 relevans

- forklare hva Microsoft Defender Offline gjør og hvorfor det brukes
- forstå forskjellen mellom vanlig skanning og offline skanning
- kjenne til scenarier der offline skanning er nødvendig
- vite hvilke krav som må være oppfylt for at skanningen skal fungere
- se hvordan dette inngår i en helhetlig strategi for endepunktbeskyttelse

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

    A[Microsoft Defender Offline]

    A --> B[Formål]
    B --> B1[Fjerner skjult skadevare]
    B --> B2[Kjører utenfor Windows]

    A --> C[Hvordan det fungerer]
    C --> C1[Starter i WinRE]
    C --> C2[Bruker oppdaterte definisjoner]
    C --> C3[Full systemskanning]

    A --> D[Når det brukes]
    D --> D1[Mistanke om rootkits]
    D --> D2[Vedvarende infeksjoner]
    D --> D3[Anbefalt av Windows Security]

    A --> E[Krav]
    E --> E1[Defender aktiv]
    E --> E2[WinRE aktiv]
    E --> E3[BitLocker suspendert]

```

<a href="/certs/diagrams/defender-offline.html" target="_blank" rel="noopener">Stort diagram</a>