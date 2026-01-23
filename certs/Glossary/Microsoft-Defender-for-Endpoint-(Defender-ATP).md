---
title: Microsoft Defender for Endpoint (Defender ATP)
nav_order:
parent:
has_children:
nav_exclude: true
---
Microsoft Defender for Endpoint (Defender ATP) er en avansert sikkerhetsplattform for endepunkter, utviklet for større organisasjoner. Løsningen forebygger, oppdager, undersøker og responderer på moderne trusler mot enheter som laptop-er, telefoner, PC-er, aksesspunkter, routere og brannvegger.

Plattformen er en del av [Microsoft Defender XDR](https://learn.microsoft.com/en-us/defender-xdr/) og kan blant annet integreres med [Microsoft Intune](Microsoft-Intune.md) for enhetlig administrasjon og sikkerhet. 

Defender for Endpoint støtter flere operativsystem:
- Windows
- macOS
- LInux
- Android
- iOS

### Integrasjon med Intune
- _Onboarding av enheter_, enheter blir registrert i Defender for Endpoint via Intune-policyer
- _Compliance-integrasjon_, Defender for Endpoint rapporterer risikoer til Intune. Risikovurderingen brukers i _compliance-policyer_, noe som påvirker tilgangen til ressurser for enheten
- _Conditional Access_, risikovurderingen for enheten kan brukes som kriterium for Conditional Access-regler
- _Endpoint security-policyer_, Intune kan distribuere sikkerhetsinnstillinger for å styrke enheten før den vurderes av Defender for Endpoint
### Lisenser
Defender for Endpoint har tre forskjellige lisensvalg:
- [Microsoft Defender for Business](https://learn.microsoft.com/en-us/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-business)
- [Defender for Endpoint Plan 1](https://learn.microsoft.com/en-us/defender-endpoint/defender-endpoint-plan-1)
- [Defender for Endpoint Plan 2](https://learn.microsoft.com/en-us/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#which-licenses-provide-the-rights-for-users-to-benefit-from-the-service-1)

[Microsoft Defender for Endpoint - Microsoft Defender for Endpoint | Microsoft Learn](https://learn.microsoft.com/en-us/defender-endpoint/microsoft-defender-endpoint)