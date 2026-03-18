---
layout: default
title: Enable organizational access
nav_order: 2
parent: Uke 4 – Refleksjoner
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/AlwaysOnVPN
  - MD-102/VPN
  - MD-102/PPTP
  - MD-102/L2TP
  - MD-102/SSTP
---
## [Introduction](https://learn.microsoft.com/en-us/training/modules/organizational-access/1-introduction)

Behovet for å jobbe eksternt og samtidig få sikker tilgang til organisasjonsressurser er nå helt vanlig. Selv om tjenester som OneDrive og SharePoint Online gjør det enkelt å jobbe i skyen, finnes det fortsatt mange ressurser som kun er tilgjengelige på det interne bedriftsnettverket. For å nå disse ressursene må brukeren etablere en VPN‑tilkobling.

Modulen tar for seg:
- hvordan brukere kan få tilgang til interne bedriftsressurser
- hvilke typer VPN‑løsninger som finnes
- hva [_Always On VPN_](../../Glossary/Always-on-VPN.md) er og hvordan det fungerer
- hvordan du konfigurerer Always On VPN i praksis

## [Enable access to organization resources](https://learn.microsoft.com/en-us/training/modules/organizational-access/2-enable-access-to-organization-resources)

Windows Server 2016 og nyere, sammen med Windows 10 og nyere klienter, tilbyr flere måter for brukere å få tilgang til interne organisasjonsressurser når de befinner seg utenfor bedriftsnettverket. Tradisjonelt har dette vært gjort via _VPN_, der en Remote Access‑server i Windows Server håndterer og terminerer tilkoblingen. Tidligere ble dette ofte gjort med [PPTP (Point-to-Point-Tunneling-Protocol)](../../Glossary/Point-to-Point-Tunneling-Protocol.md), [L2TP (Layer-2-Tunneling-Protocol)](../../Glossary/Layer-2-Tunneling-Protocol.md) eller [SSTP (Secure-Socket-Tunneling-Protocol)](../../Glossary/Secure-Socket-Tunneling-Protocol.md).

I moderne Windows‑miljøer finnes _flere alternativer_ for ekstern tilgang:

### Work Folders

[Work Folders](../../Glossary/Work-Folders.md) lar brukere synkronisere innhold fra bestemte mapper på filservere, selv når de er utenfor det interne nettverket.

### Web Application Proxy

[WAP](../../Glossary/Web-Application-Proxy.md) Brukes til å publisere interne apper og tjenester til internett via sikre, webbaserte protokoller.

### DirectAccess

[DirectAccess](../../Glossary/DirectAccess.md) er en eldre teknologi som ga sømløs tilgang uten at brukeren måtte starte en VPN‑tilkobling manuelt. Den muliggjorde også ekstern administrasjon av klienter via ConfigMgr og Group Policy.

### Always On VPN

[Always on VPN](../../Glossary/Always-on-VPN.md) er den moderne etterfølgeren til DirectAccess. Gir en _vedvarende, automatisk og sikker tilkobling_ til interne ressurser når klienten er på internett. Tilgjengelig for Windows 10 Pro/Enterprise/Education og nyere.

### Remote Access server‑rollen
 
De fleste teknologiene over bygger på [_Remote Access‑rollen_](../../Glossary/Remote-Access.md) i Windows Server, som består av:
- Remote Access Service (RAS)
- Routing
- Web Application Proxy

Når du installerer DirectAccess og VPN (RAS), setter du opp _RAS Gateway_, som kan brukes på flere måter:

#### RAS Gateway – Single tenant

- Tradisjonell VPN for sluttbrukere
- Always On VPN
- Site‑to‑site VPN mellom lokasjoner
- NAT for tilgang til eksterne ressurser
- Støtte for BGP for dynamisk ruting

#### RAS Gateway – Multitenant

Brukes i virtualiserte miljøer og datasentre, spesielt for CSP‑scenarier. Støtter:
- Point‑to‑site VPN for leietakere
- Site‑to‑site VPN mellom kunders lokasjoner og datasenter
- BGP og NAT for fleksibel ruting

## Viktig begrensning

Remote Access‑rollen _kan ikke_ brukes på virtuelle maskiner i Microsoft Azure. Azure‑VM‑er støtter ikke VPN, DirectAccess eller andre Remote Access‑funksjoner fra Windows Server.

## [Explore VPN types and configuration](https://learn.microsoft.com/en-us/training/modules/organizational-access/3-explore-vpn-types-configuration)

Denne delen forklarer hvordan VPN fungerer i Windows‑miljøer, og hvilke tunneling‑protokoller og klienttyper som støttes. VPN etablerer en _punkt‑til‑punkt‑tilkobling_ mellom en ekstern klient og organisasjonens nettverk via internett. Klienten kobler til en _remote access‑server_, som autentiserer brukeren og ruter trafikken videre til interne ressurser.

### Built-in VPN client

Windows har en innebygd VPN‑klient som kan konfigureres til å bruke flere tunneling‑protokoller. Både klient og server må bruke samme protokoll. Siden beskriver støtte for:

- [_IKEv2 (Internet-Key-Exchange-v2_)](../../Glossary/Internet-Key-Exchange-v2.md) – moderne, sikker protokoll med konfigurerbare kryptografiske egenskaper.
- _L2TP/[IPsec](../../Glossary/Internet-Protocol-Security.md) med PSK_ – kan settes opp via VPNv2 CSP.
- _PPTP_ – eldre protokoll, minst sikker.
- _SSTP_ – fungerer kun på Windows desktop; brukes automatisk hvis valgt.

| Protokoll    | Når den brukes                     | Hvorfor det er nyttig å vite               |
| ------------ | ---------------------------------- | ------------------------------------------ |
| _IKEv2_      | Moderne miljøer, Always On VPN     | Mest stabil, best sikkerhet, støttes bredt |
| _SSTP_       | Når IKEv2 blokkeres av brannmur    | Går over TCP 443, fungerer nesten alltid   |
| _L2TP/IPsec_ | Eldre miljøer eller spesielle krav | Krever PSK, mer legacy                     |
| _PPTP_       | Aldri                              | Utdatert og usikkert                       |

Hvis du ikke vet hvilken protokoll som skal brukes, kan du velge _Automatic_, som prøver protokollene fra mest til minst sikker.

### Universal Windows Platform VPN plug-in

Windows støtter også [UWP‑baserte VPN‑plug‑ins](../../Glossary/Universal-Windows-Platform.md), som lar tredjepartsleverandører lage moderne, app‑baserte VPN‑klienter uten behov for systemdrivere. Eksempler er Pulse Secure, Cisco AnyConnect, F5 Access, SonicWall Mobile Connect og Check Point Capsule.

For slike løsninger må organisasjonen samarbeide med leverandøren for å konfigurere nødvendige innstillinger.

## [Explore Always On VPN](https://learn.microsoft.com/en-us/training/modules/organizational-access/4-explore-always-vpn)

[_Always On VPN_](../../Glossary/Always-on-VPN.md) er en Windows 10 og Windows 11‑teknologi som gir brukere _automatisk og vedvarende tilgang_ til organisasjonens interne nettverk når de er koblet til internett. I motsetning til tradisjonell VPN trenger ikke brukeren å starte tilkoblingen manuelt – den kan etableres automatisk, til og med _før innlogging_, dersom den er konfigurert som Device Tunnel.

Always On VPN er etterfølgeren til DirectAccess og tilbyr en lignende sømløs opplevelse, men med _enklere implementering_, _større fleksibilitet_ og _bredere støtte_, inkludert Windows Home‑enheter.

## Hva Always On VPN tilbyr

- Automatisk tilkobling uten brukerhandling.
- Re‑tilkobling automatisk etter nettverksbrudd.
- Støtte for både _user authentication_ og _device authentication_.
- Fungerer på _domenejoinede_, _ikke‑domenejoinede_ og _Entra‑administrerte_ enheter.
- Bruk av moderne autentiseringsmetoder som _Windows Hello for Business_ og _MFA_.
- Mulighet for _Conditional Access_ og [compliance‑policyer](../../Glossary/Compliance‑Policy.md) .
- Trafikkfiltre for å begrense hvilke interne ressurser som er tilgjengelige.

## Protokoller og nettverk

Always On VPN støtter:

- IKEv2
- SSTP
- L2TP/IPsec
- IPv4 og IPv6

## Administrasjon og distribusjon

- Kan ikke administreres via AD DS eller Group Policy.
- Må konfigureres via _Intune_, _Configuration Manager_ eller _PowerShell_.
- Krever et _XML‑basert VPN‑profiloppsett_.
- Windows Server 2022+ med Remote Access‑rollen kan terminere Always On VPN, men også tredjeparts VPN‑gatewayer (Cisco, Juniper, Palo Alto m.fl.) støttes.

## [Deploy Always On VPN](https://learn.microsoft.com/en-us/training/modules/organizational-access/5-deploy-always-vpn)

Denne siden beskriver hvilke _infrastrukturkomponenter_ som må være på plass før du kan rulle ut Always On VPN. Målet er å sikre at klienter kan koble seg til interne ressurser på en trygg og stabil måte.

## Infrastrukturkrav

For å implementere Always On VPN trenger du følgende:

- _Active Directory‑miljø_ med interne og eksterne DNS‑soner. Den interne sonen skal være et delegert subdomene av den eksterne (f.eks. _corp.contoso.com_ under _contoso.com_).
- _[PKI](../../Glossary/Public-Key-Infrastructure.md) / AD CS_ En fungerende sertifikat-infrastruktur for å utstede nødvendige klient‑ og serversertifikater.
- [_NPS‑server (RADIUS)_(Network-Policy-Server)](../../Glossary/Network-Policy-Server.md) Kan være en eksisterende NPS‑installasjon eller en ny. Brukes til autentisering og autorisasjon av VPN‑tilkoblinger.
- _Remote Access‑server (RAS Gateway)_ Må støtte IKEv2 og LAN‑ruting. Krever to nettverkskort og plasseres i perimeter‑nettverket.
- _Perimeter‑nettverk med to brannmurer_ Brannmurene må tillate trafikk for både VPN og RADIUS.
- _Fysisk server eller VM_ For RAS Gateway‑rollen. VMer krever VLAN‑støtte på verten.
- _Administrativ tilgang_ Du må være medlem av Administrators‑gruppen eller tilsvarende.
- _Et administrasjonsverktøy_ Intune, Configuration Manager eller annet MDM‑verktøy som kan distribuere Always On VPN‑profilen (CSP‑basert og leverandøruavhengig).

![](assets/Pasted%20image%2020260309140758.png)

[Deploy Always On VPN](https://learn.microsoft.com/en-us/windows-server/remote/remote-access/vpn/always-on-vpn/deploy/always-on-vpn-deploy-deployment)

## [Module assessment](https://learn.microsoft.com/en-us/training/modules/organizational-access/6-knowledge-check)

1. _In addition to having DC/DNS servers, what are the three required technologies needed before deploying Always On VPN?_

	Network Policy Server (NPS) (RADIUS), a Certificate Authority (CA) server, and a Remote Access (Routing/VPN) server

2. _Which three tools are primarily used to deploy and manage the Always On VPN feature?_
	
	Configuration Manager, Microsoft Intune or PowerShell

## [Summary](https://learn.microsoft.com/en-us/training/modules/organizational-access/7-summary)

Mange organisasjoner krever at enheter bruker _VPN_ for å få tilgang til interne ressurser. Selv om brukere kan starte VPN manuelt, gjør _Always On VPN_ dette sømløst ved å koble til automatisk når en ressurs krever det.

Always On VPN er en funksjon i _Windows Server_, og for å ta det i bruk må organisasjonen sette opp nødvendige serverroller og tjenester, inkludert:

- _NPS‑server_
- _Certificate Authority (CA)_
- _Remote Access‑server_

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
flowchart TD

    A[Organizational Access] --> B[VPN]
    B --> B1[Brukere kan koble til manuelt]
    B --> B2[Krever Remote Access-server]
    B --> B3[Brukes for tilgang til interne ressurser]

    A --> C[Always On VPN]
    C --> C1[Automatisk tilkobling]
    C --> C2[Krever serverroller: NPS, CA, Remote Access]
    C --> C3[Brukes når ressurser krever VPN]
    C --> C4[Distribueres via Intune/MDM]

    A --> D[Infrastruktur]
    D --> D1[NPS-server]
    D --> D2[Certificate Authority]
    D --> D3[Remote Access-server]

    A --> E[Formål]
    E --> E1[Sømløs tilgang til interne ressurser]
    E --> E2[Bedre sikkerhet og kontroll]
    E --> E3[Automatisert brukeropplevelse]

```

[Configure Windows 10 Client Always On VPN Connections | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/remote/remote-access/vpn/always-on-vpn/deploy/vpn-deploy-client-vpn-connections)
[Deploy Always On VPN](https://learn.microsoft.com/en-us/windows-server/remote/remote-access/vpn/always-on-vpn/deploy/always-on-vpn-deploy-deployment).