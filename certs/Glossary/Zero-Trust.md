---
title: Zero Trust
nav_order:
parent:
has_children:
nav_exclude:
---
Zero Trust er en sikkerhetsstrategi, ikke et produkt eller en tjeneste. Det er entilnærmingen til hvordan man utformer og implementeringen sikkerhet basert på et sett med grunnleggende prinsipper. 

Zero Trust består av tre hovedprinsipper:
- _Verify explicitly_: Autentiser og autoriser basert på alle tilgjengelige datapunkter
- _Use least privilege access_: Begrens tilgang med _Just-In-Time_ og _Just-Enough-Access_ (JIT/JEA), risikobaserte, adaptive policyer samt databeskyttelse
- _Assume breach_: Minimer skadeomfang og segmenter tilgang. Verifiser ende til ende kryptering og bruk analyse for å få innsikt, oppdage trusler og styrke sikkerheten

### Zero Trust i MD-102
Handler om hvordan du 
- konfigurer
- håndhever
- administrerer 
sikkerhet på enheter, brukere og apper gjennom _Entra ID, Intune og Defender_.

#### Verify explicitly
Sikre at tilgang baseres på alle tilgjengelige signaler for å sikre at bruker og enhet faktisk er det de utgir seg for å være:
- Conditional Access
- MFA
- Entra ID-basert identitetskontroll
- Compliance-policyer i Intune
- Device state (compliant, hybrid join, managed)

#### Use least privilege access
Sørge for at brukere og enheter kun får nødvendig tilgang, særdeles viktig i BYOD-scenarioer:
- JIT/JEA
- App-basert Conditional Access-policyer
- Begrenset tilgang til ressurser basert på risiko
- Intune-policyer som styrer hva enheter kan gjøre
- [MAM-policyer](certs/Glossary/Mobile-Application-Management-(MAM).md) som beskytter data uten å gi full enhetskontroll

##### JIT/JEA
> _“Least privilege access means users and devices only get the access they need, when they need it.”_

Oppnås gjennom:
- Conditional Access
- App‑beskyttelse
- Enhetscompliance
- Rollebasert tilgang (RBAC) i Intune
- Databeskyttelse (MAM/MDM)
#### Assume breach
Reduser skadeomfang når/hvis noe går galt:
- Segmentering av tilgang (Conditional Access + grupper + roller)
- Defender for Endpoint for trusseloppdagelse
- Ende til ende kryptering (Bitlocker, app-beskyttelse)
- Logging og overvåkning via Entra ID og Defender
- Automatiserte responser basert på risiko

