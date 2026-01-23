---
title: Azure Virtual Desktop (AVD)
nav_order:
parent:
has_children:
nav_exclude: true
---
Azure Virtual Desktop, AVD,  er en tjeneste for virtuelle skrivebord og applikasjoner som kjører på Azure. Den gjør det mulig å levere Windowsmaskiner og apper til brukere uansett hvor de befinner seg, sikkert og skarbart fra skyen.

### Kjernefunksjoner
- _Virtuelle Windowsmiljøer_, støtter Windows 10/11 og Server som full desktop eller [RemoteApp-applikasjoner](RemoteApp.md)
- _Single-session og multisession_, mulighet for en bruker pr VM eller flere brukere samtidig for bedre kostnadseffektivitet. Dette er unikt for Windows 10/11 Enterprise Multisession
- _Applikasjonsleveranse_, distribusjon av Microsoft 365 Apps for enterprise og egne applikasjoner (Win32, MSIX, AppX) i et virtuelt miljø
- _Erstatter tradisjonelle RDS-miljøer_, AVD kan brukes som et moderne alternativ til Remote Desktop Services (RDS) lokalt
- _Enhetlig administrasjon_, administrasjon av virtuelle skrivebord og apper på tvers av Windows-versjoner via en samlet plattform

### Integrasjon med Intune
- _Intune-administrasjon av AVD-session hosts_, policyer, apper, sikkerhet administreres som vanlige Windows-klienter via Intune
- _Entra ID-integrasjon_, AVD støtter Entra ID basert autentisering og tilgangsstyring
- _Conditional Access_, AVD tilgang kan styres med Conditional Access policyer for økt sikkerhet
- _Sikkerhetsfordeler_, Virtuelle enheter kan beskyttes med Defender for Endpoint og inngå i compliance policyer

