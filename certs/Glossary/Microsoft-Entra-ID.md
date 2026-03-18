---
title: Microsoft Entra ID
nav_order:
parent:
has_children:
nav_exclude: true
---
Microsoft Entra ID er Microsofts skybaserte løsning for identitets- og tilgangsadministrasjon. Den leverer identiteter, autentisering, policyer og sikkerhetsmekanismer som beskytter brukere, applikasjoner og ressurser. 
Entra ID er en del av Microsoft Entra produktfamilien, som omfatter flere tjenester innen identitet, tilgang og nettverkssikkerhet. 

![Pasted image 20260114111526](assets/Pasted%20image%2020260114111526.png)

### Kjernefunksjoner
- _Identitetsadministrasjon_, Entra ID oppretter, administrerer og sikrer brukerkontoer og grupper
- _Autentisering_, støtte for passord, passordløse metoder, MFA og sikker pålogging
- _Tilgangsstyring_, Entra ID bruker roller, tillatelser og tilgangspolicyer for å kontrollere tilganger til ressursene
- _Conditional Access_, policyer som kombinerer signaler som bruker, enhet, plassering og risiko for å kontrollere tilgang
- _Identity Protection_, oppdager risikofylte pålogginger og brukere. Automatisert respons.

### Integrasjon med Intune
Entra ID er fundamentet for moderne administrasjon i Intune:
- _Enhetsregistrering_, enheten registreres i Entra ID som en del av Intune-administrasjonen
- _Enhetsidentitet_, gir enhetsobjekter som brukes i compliance-policyer og Condtional Access
- _Autopilot-integrasjon_, Windowsenhetene kobles til Entra ID under utrulling
- _Sikker tilgang_, Condtional Access bruker signalene fra Entra ID og Intune for å styre tilgang til ressurser

### Lisenser P1 og P2

_Microsoft Entra ID P1 og P2 bygger på hverandre: P1 gir deg moderne tilgangskontroll som Conditional Access, mens P2 legger på avansert risikobasert sikkerhet og styring av privilegerte roller._ Dette er sentralt i MD‑102 fordi P1 er minimum for Conditional Access‑scenarier, mens P2 brukes i mer avanserte Zero Trust‑miljøer.  

- _P1 er minimum_ for å jobbe med Conditional Access og moderne sikkerhetspolicyer.
- _P2 brukes i mer avanserte scenarioer_, spesielt rundt risikobasert tilgang og styring av privilegerte roller.

#### Microsoft Entra ID P1

Gir avansert identitets- og tilgangsstyring for organisasjoner som trenger moderne sikkerhet og hybrid identitet.

_Nøkkelfunksjoner

- _Conditional Access_ – krever P1 [m365corner.com](https://m365corner.com/m365-blogs/microsoft-entra-id-free-vs-p1-vs-p2.html)
- _Hybrid identity_ (Azure AD Connect)
- _Self-Service Password Reset (SSPR) for brukere_
- _Dynamic Groups_
- _Enterprise App Management_
- _Microsoft Entra ID Governance (grunnleggende)_
- Inkludert i _Microsoft 365 E3_ og _Business Premium_ [Microsoft](https://www.microsoft.com/en-us/security/business/microsoft-entra-pricing)

_Typisk bruk:_  
Organisasjoner som trenger moderne tilgangskontroll, MFA‑policyer og sikkerhetsstandarder.

#### Microsoft Entra ID P2

Legger til avansert sikkerhet, risikobasert tilgang og full identitetsstyring.

_Nøkkelfunksjoner (fra Microsoft Learn og M365 Blogs)_

- _Identity Protection_ (risikobasert MFA, risikobasert blokkering) – krever P2 [m365corner.com](https://m365corner.com/m365-blogs/microsoft-entra-id-free-vs-p1-vs-p2.html)
- _Privileged Identity Management (PIM)_ – krever P2 [m365corner.com](https://m365corner.com/m365-blogs/microsoft-entra-id-free-vs-p1-vs-p2.html)
- _Full Entra ID Governance_ (Access Reviews, Lifecycle Workflows)
- _Automatisert risikohåndtering_
- Inkludert i _Microsoft 365 E5_ [nexetic.com](https://nexetic.com/complete-guide-to-microsoft-entra-id-pricing-and-plans/)

_Typisk bruk:_  
Miljøer med høye sikkerhetskrav, compliance‑krav eller behov for kontroll av privilegerte roller.


| Funksjon                             | Entra ID Free | _P1_ | _P2_ |
| ------------------------------------ | ------------- | ---- | ---- |
| Single Sign‑On                       | ✔             | ✔    | ✔    |
| MFA                                  | Begrenset     | ✔    | ✔    |
| Conditional Access                   | ✖             | _✔_  | _✔_  |
| SSPR for brukere                     | ✖             | ✔    | ✔    |
| Identity Protection                  | ✖             | ✖    | _✔_  |
| Privileged Identity Management (PIM) | ✖             | ✖    | _✔_  |
