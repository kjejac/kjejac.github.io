---
title: Windows edition details
nav_order:
parent:
has_children:
nav_exclude: true
tags:
  - MD-102
  - MD-102/Windows10
  - MD-102/Windows11
---
### Windows Home
Rettet mot privatbrukere, og har funksjoner som 
- Edge, Windows Hello, virtuelle skrivebord
- Innebygde apper (Mail, kalender, foto)
- Enhetskryptering, brannmur, virusbeskyttelse
- [Always on VPN](./Always-on-VPN-(AON).md)
- Automatiske oppdateringer

### Windows Pro
Bygger videre på Windows Home og retter seg mot SMB og avanserte brukere. Nøkkelfunksjonene er:
- Windows Autopilot og Dynamisk Provisioning
- MDM-støtte
- Domain Join og Microsoft Entra ID Join
- Group Policy
- BitLocker og Windows Information Protection
- Assigned Access og Remote Desktop
- Client Hyper-V
- Microsoft Store for Business
- Windows Update for Business
- Entreprise State Roaming

### Windows Pro for Workstations
For krevende arbeidsbelastninger, bygger videre på Pro. 
- ReFS (Resilient File System)
- Persistent Memory (NVDIMM-N)
- SMB Direct (RDMA-nettverk)
- Støtte for opptil 4 CPUer og 6 TB RAM

### Windows Enterprise
Bygger videre på Pro, utviklet for store organisasjoner. Kun tilgjengelig via Volume Licensing. Noen nøkkelfunksjoner er:
- BranchCache
- Startmeny-kontroll via MDM/GPO
- Defender Credential Guard, Application Control og Application Guard
- App-V og UE-V (Microsoft User Experience Virtualization)
- Rettigheter for virtuelle skrivebord
- DirectAccess (men Always On VPN anbefales)

### Windows LTSC
En spesialutgave for stabile, uendrede miljøer (medisinsk, industrielt). Kjennetegn: 
- Ingen funksjonsoppgraderinger
- Kun sikkerhetsoppdateringer
- Ingen Microsoft Store
- Ingen Edge (kan installeres manuelt)
- Færre innebygde apper
- Ny versjon ca hvert tredje år

### Windows Pro EDU / EDU
Funksjonmessig som Pro og Enterprise, men tilpasset skolemiljøer. Kun tilgjengelig via akademiske avtaler.

### Windows IoT/IoT Enterprise
For dedikerte enheter som minibanker, POS-terminaler og medisinsk utstyr. Lisensieres av produsenten, ikke sluttbrukeren.
- IoT-Core: Minimal versjon som kjører en app
- IoT Enterprise: Full Enterprise-utgave med spesialfunksjoner