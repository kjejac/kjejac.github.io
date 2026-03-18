---
layout: default
title: Microsoft Graph Explorer
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/GraphExplorer
---
**Microsoft Graph Explorer er et gratis, nettbasert verktøy fra Microsoft som lar deg teste, utforske og kjøre Microsoft Graph‑API‑spørringer direkte i nettleseren – uten å skrive kode eller sette opp et utviklingsmiljø.** Det fungerer som et “API‑laboratorium” for Microsoft 365‑data som brukere, enheter, e‑post, Teams, Intune‑ressurser og mye mer. [Microsoft Developer](https://developer.microsoft.com/en-us/graph/graph-explorer) [Microsoft Learn](https://learn.microsoft.com/en-us/graph/graph-explorer/graph-explorer-overview)

### Hva Microsoft Graph Explorer er

Microsoft Graph Explorer er en **interaktiv web‑klient** for Microsoft Graph API – Microsofts samlede endepunkt for data i Microsoft 365, Entra ID, Intune, Teams, OneDrive, Outlook og hundrevis av andre tjenester.

Ifølge Microsoft Learn og Microsoft Developer:

- Det er et **nettbasert verktøy** for å teste Microsoft Graph‑spørringer. [Microsoft Learn](https://learn.microsoft.com/en-us/graph/graph-explorer/graph-explorer-overview)
- Du kan kjøre **GET, POST, PATCH, DELETE** direkte mot Graph API. [Windows Report](https://windowsreport.com/what-is-microsoft-graph-explorer/)
- Du kan bruke en **demo‑tenant** eller logge inn i din egen. [Microsoft Learn](https://learn.microsoft.com/en-us/graph/graph-explorer/graph-explorer-overview)
- Det viser **forespørsel + respons**, inkludert JSON‑data, headers og statuskoder. [Microsoft Developer](https://developer.microsoft.com/en-us/graph/graph-explorer)
- Det viser hvilke **tillatelser** en spørring krever, og lar deg godkjenne dem. [Microsoft Learn](https://learn.microsoft.com/en-us/graph/graph-explorer/graph-explorer-overview)
- Det fungerer som en “**playground**” for å lære Graph API uten utvikleroppsett. [TheWindowsClub](https://www.thewindowsclub.com/microsoft-graph-everything-need-know)

### Hva du kan gjøre i Graph Explorer

#### Utforske Microsoft 365‑data

Du kan hente data som:

- brukerprofil
- e‑post
- kalender
- OneDrive‑filer
- Teams‑kanaler
- Entra ID‑objekter
- Intune‑enheter og policyer

[Microsoft Developer](https://developer.microsoft.com/en-us/graph/graph-explorer)

#### Kjøre ferdige eksempelforespørsler

Graph Explorer har en stor meny med ferdige queries, f.eks.:

- _GET my profile_
- _GET my mail_
- _GET list items in my drive_
- _GET my manager_

[Microsoft Developer](https://developer.microsoft.com/en-us/graph/graph-explorer)

#### Teste Intune‑relaterte API‑er

Du kan hente:

- enhetslister
- compliance‑status
- app‑installasjoner
- policy‑konfigurasjon

Dette er nyttig i MD‑102 når du jobber med rapportering, automatisering og feilsøking.

---

#### Se og endre API‑tillatelser

Graph Explorer viser hvilke **OAuth‑tillatelser** som kreves for en spørring og lar deg godkjenne dem direkte.  

[Microsoft Learn](https://learn.microsoft.com/en-us/graph/graph-explorer/graph-explorer-overview)

#### Se kodeeksempler

Graph Explorer kan vise hvordan samme spørring ser ut i:

- C#
- JavaScript
- PowerShell
- cURL

[Windows Report](https://windowsreport.com/what-is-microsoft-graph-explorer/)

### Relevanse for MD‑102

I MD‑102 brukes Microsoft Graph Explorer til å:

- inspisere Intune‑data (enheter, compliance, apps)
- teste API‑kall før man automatiserer med PowerShell eller scripts
- forstå hvordan Intune‑rapportering og Data Warehouse henger sammen
- lære hvordan Microsoft 365‑data er strukturert
- feilsøke enheter og policyer via Graph‑endepunkter

Graph Explorer er derfor et **læringsverktøy** og et **feilsøkingsverktøy** for Endpoint Administrator‑rollen.
