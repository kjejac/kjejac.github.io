---
title: Windows Autopilot
nav_order:
parent:
has_children:
nav_exclude: true
tags:
  - MD-102
  - MD-102/Autopilot
---
Windows Autopilot er en samling av teknologier som brukes til å sette opp og forhåndskonfigurere nye Windows-enheter slik at de er klare til bruk med minimal innsats fra IT.

Autopilot kan også brukes til å nullstille, klargjøre på nytt eller gjenopprette eksisterende enheter. Fordelen at IT-avdelingen trenger svært lite lokal infrastruktur, samtidig som prosessen blir enkel og forutsigbar for både brukere og administratorer.

### Prosessoversikt
Nye enheter leveres med en OEM-optimalisert Windows-installasjon. 
Under _deploy_-fasen blir denne tilpasset til organisasjonens oppsett:
- Innstillinger og policyer blir anvendt
- Apps blir installert
- Windowsversjonen aktiveres med organisasjonens lisens 

![](Pasted%20image%2020260113124934.png)

Når første fase er fullført, kan enheten administreres med:
- [Microsoft Intune](Microsoft-Intune.md)
- Windows Update client policies
- Microsoft Configuration Manager
- Tilsvarende verktøy fra tredjepart.

[Windows Autopilot and Windows Autopilot device preparation documentation | Microsoft Learn](https://learn.microsoft.com/en-us/autopilot/)
