---
title: Microsoft Entra ID
nav_order:
parent:
has_children:
nav_exclude: true
---
Microsoft Entra ID er Microsofts skybaserte løsning for identitets- og tilgangsadministrasjon. Den leverer identiteter, autentisering, policyer og sikkerhetsmekanismer som beskytter brukere, applikasjoner og ressurser. 
Entra ID er en del av [Microsoft Entra produktfamilien], som omfatter flere tjenester innen identitet, tilgang og nettverkssikkerhet. 

![](Pasted%20image%2020260114111526.png)

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