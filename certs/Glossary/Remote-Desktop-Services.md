---
layout: default
title: Remote Desktop Services (RDS)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/RDS
  - MD-102/WindowsServer
  - MD-102/RemoteApp
---
Remote Desktop Services er en rollebasert infrastruktur i Windows Server som lar autoriserte brukere koble seg til enten et fullstendig skrivebord eller enkeltapplikasjoner via RemoteApp. All kjøring skjer på serveren, mens klienten kun mottar brukergrensesnittet gjennom Remote Desktop Protocol. Dette reduserer administrasjon fordi apper installeres og vedlikeholdes ett sted, og brukere får en konsistent opplevelse uansett enhet. 

RDS støtter både multi session serverbaserte skrivebord og VDI baserte enkeltsesjonsmaskiner, slik at organisasjoner kan velge riktig modell for kostnad, ytelse og kompatibilitet. Data forblir i datasenteret, og sikkerheten styrkes gjennom kryptert tilgang, MFA og sentralisert kontroll. 

En komplett RDS infrastruktur består av flere roller: RD Session Host for å kjøre sesjoner, RD Connection Broker for lastbalansering og sesjonsgjenoppretting, RD Web Access for portaltilgang, RD Gateway for sikker ekstern tilgang og RD Licensing for lisenshåndtering. Disse rollene kan skaleres og distribueres etter behov. 

RDS brukes ofte når organisasjoner ønsker full kontroll over miljøet, data og infrastruktur, eller når applikasjoner krever serverbasert kjøring. Det gir høy tetthet per server, god kostnadseffektivitet og mulighet for avansert tilpasning og integrasjon. 

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

    A[Remote Desktop Services] --> B[Sentralisert kjøring]
    B --> B1[Apper og skrivebord kjøres på server]
    B --> B2[Klient mottar kun UI via RDP]

    A --> C[Kjernekomponenter]
    C --> C1[RD Session Host]
    C --> C2[RD Connection Broker]
    C --> C3[RD Web Access]
    C --> C4[RD Gateway]
    C --> C5[RD Licensing]

    A --> D[Sikkerhet]
    D --> D1[Kryptert tilgang]
    D --> D2[MFA og tilgangskontroll]
    D --> D3[Data forblir i datasenter]

    A --> E[Bruksscenarier]
    E --> E1[Multi session skrivebord]
    E --> E2[RemoteApp publisering]
    E --> E3[VDI for enkeltbrukere]

    A --> F[Fordeler]
    F --> F1[Redusert administrasjon]
    F --> F2[Kostnadseffektivitet]
    F --> F3[Konsistent brukeropplevelse]

```



[Remote Desktop Services overview in Windows Server | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/overview)