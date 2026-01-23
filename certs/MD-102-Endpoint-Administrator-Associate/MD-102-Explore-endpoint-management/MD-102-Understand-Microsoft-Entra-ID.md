---
title: Understand Microsoft Entra ID
nav_order: 3
parent: Uke 1 – Refleksjoner
has_children:
tags:
  - MD-102/EntraID
  - MD-102/EntraID/P1
  - MD-102/EntraID/P2
  - MD-102/EntraID/DomainServices
  - MD-102/ADDS
---
# MD-102 – Understand Microsoft Entra ID

Modulen forklarer [Microsoft Entra ID](certs/Glossary/Microsoft-Entra-ID.md), og sammenligner Entra ID med Active Directory Domain Services. Den gir også en oversikt over abonnementene Entra ID P1 og P2, samt Entra Domain Services for administrasjon av domain-joined enheter og apper i skyen.

### Learning objectives
- Beskrive Microsoft Entra ID
- Sammenligne Entra ID med AD DS
- Forklare hvordan Entra ID fungerer som katalogtjeneste for skyapplikasjoner
- Beskrive Entra ID P1 og P2
- Beskrive Entra Domain Services

[Microsoft Learn – Understand Microsoft Entra ID](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/)
## [Introduction](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/1-introduction)
Microsoft Entra ID er en skybasert løsning som samler identitets- og tilgangsadministrasjon, og sørger for å sikre tilganger og beskytte applikasjoner og data både i skyen og i lokale miljøer.
## [Examine Microsoft Entra ID](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/2-examine-azure-active-directory)
Active Directory Domain Services, AD DS, er den tradisjonelle katalogtjenesten i Windows-miljøer. Den lagrer og publiserer informasjon om brukerkontoer, passord og enhetsdata, og kjører på Windows Server som en domenekontroller.

Entra ID er en skybasert katalogtjeneste levert som PaaS. Den driftes av Microsoft, noe som gjør at kunden ikke behøver å administrere infrastruktur, oppsett og vedlikehold selv. Tjenesten tilbyr funksjoner som ikke finnes i AD DS, som flerfaktorautentisering, identitetbeskyttelse og selvbetjent passordtilbakestilling.

Entra ID brukes til å sikre tilgang til skyressurser gjennom:
- apptilgang og SSO
- bruker- og gruppeadministrasjon
- klargjøring av brukere
- identitetstyring og federering
- overvåkning av uvanlig påloggingsaktivitet
- MFA, [Conditional Access](certs/Glossary/Conditional-Access.md) og [Application Proxy](Microsoft-Entra-Application-Proxy.md)
- Integrasjon med lokal AD DS via Entra Connect

![](Pasted-image-20260120195313.png)

Entra ID er en egen Azure-tjeneste. Alle Azure-abonnement får en gratis [Entra-Tenant](certs/Glossary/Tenant.md) automatisk. Mer avanserte funksjoner kreve betalte nivåer.
Microsoft 365-abonement inkluderer også Entra-funksjonalitet.

I motsetning til AD DS er Entra ID multi-tenant, og hver tenant er isolert. En tenant representerer en organisasjon eller en individuell Entra-instans. 
Et Entra-abo må alltid være knyttet til en tenant, men et tenant kan brukes av flere abonnementer. Hver tenant får et standarddomene (_prefix.onmicrosoft.com), og man kan legge til egne domener.

[Entra-skjemaet](certs/Glossary/Entra-Schema.md) har færre objekttyper enn AD DS. Det mangler blant annet _computer_-klassen, men har _device_-klassen. Enheter kobles til Entra ID på en annen måte enn tradisjonell domain join. 
Entra ID støtter ikke GPO eller OU-struktur da moderne administrasjon skjer via gruppebasert organisering og verktøy som [Intune](certs/Glossary/Microsoft-Intune.md). 

For at en app skal kunne brukes på tvers av flere tenants blir de representert av to objekter:
- _Application_ (definisjon)
- _servicePrincipal_ (instansen i en tenant)

### Oppsummert
- _AD DS_: lokal katalogtjeneste på Windows Server, med domain join, GPO og OU-struktur
- _Entra ID_: 
	- skybasert katalogtjeneste (PaaS), driftet av Microsoft, uten servere og domenekontrollere
	- tilbyr moderne identitetsfunksjoner som MFA, Conditional Access, identitetsbeskyttelse, SSO, selvbetjent passord
	- er multi-tenant, og hvert tenant er en isolert kataloginstans
	- følger gratis med alle Azure- og MS 365-aboer, men avanserte funksjoner krever betalte abonnementer
	- skjemaet har færre objekter enn AD DS og mangler _computer_-klassen. Administrasjon skjer via Intune
	- apper defineres som _application_ og instansieres som _servicePrincipal_ i hver tenant
## [Compare Microsoft Entra ID and Active Directory Domain Services](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/3-compare-azure-active-directory-domain-services)
Entra ID kan sees på som den skybaserte motparten til AD DS. Selv om de deler enkelte likheter, finnes det flere viktige forskjeller.

### Characteristics of AD DS 
AD DS er den tradisjonelle implementasjonen av Active Directory på en fysisk eller virtuell Windows server. Selv om den ofte omtales som en katalogtjeneste, er det bare en del av Active Directory plattformen, den inkluderer AD Certificate Services (CS), AD Lightweight Services (LDS), AD Federation Services (FS) og AD Rights Managment Services (RMS). 

Viktige kjennetegn ved AD DS:
- AD DS er en ekte katalogtjeneste med en hierarkisk _X.500 struktur_
- Bruker DNS for å finne ressurser som domenekontrollere
- Kan administreres via LDAP spørringer
- Bruker _Kerberos_ som primær autentiseringsprotokoll
- Bruker OUs og GPOer for administrasjon
- Inneholder _computer objects_ for domain joined maskiner
- Bruker trusts mellom domener for delegert administrasjon
- Kan kjøres på Azure VMer for skalering, men dette gir ingen integrasjon med Entra ID. Ved bruk av Azure VM må egne datadisker brukes, og _Host Cache Preference_ må settes til _None_!

### Characteristics of Microsoft Entra ID
Selv om Entra ID har noen likheter med AD DS, er det en helt annen tjeneste. Det er ikke det samme som å kjøre en domenekontroller i Azure.

Viktige kjennetegn ved Entra ID:
- Entra ID er primært en identitetsløsning for internettbaserte applikasjoner og bruker HTTP/HTTPS
- Er en _multi tenant_ katalogtjeneste
- Brukere og grupper ligger i en flat struktur (har ikke OUs eller GPOer)
- Kan ikke spørres via LDAP, bruker [_REST API_](certs/Glossary/REST-API.md) over HTTP/HTTPS
- Bruker ikke _Kerberos_, autentisering skjer via [SAML](certs/Glossary/SAML.md), [WS-Federation](certs/Glossary/WS-Federation.md) og [OpenID Connect](certs/Glossary/OpenID-Connect.md) og autorisasjon via [OAuth](certs/Glossary/OAuth.md)
- Har innebygde federeringstjenester, og mange tredjepartsleverandører, som f.eks. Facebook som stoler på Entra ID.

### Oppsummert
- _AD DS_
	- Lokal, hierakisk katalogtjeneste med OUs, GPOer, Kerberos og LDAP
	- Administrerer tradisjonelle domain joined maskiner
- _Entra ID_
	- Skybasert identitetplattform med flat struktur uten OUs, GPOer
	- Bruker moderne webprotokoller
	- Multi-tenant
	- Administrerer identiteter for skyapper
	- Kan ikke erstatte AD DS der det kreves Kerberos, LDAP eller GPO
	- Designet for moderne, internettbaserte apper og integrerer lett med tredjepartsleverandører

## [Examine Microsoft Entra ID as a directory service for cloud apps](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/4-examine-azure-directory-service-cloud-apps)
Når du bruker skytjenester som Microsoft 365 eller Intune, trenger du en katalogtjeneste i skyen for autentisering og autorisasjon. Derfor opprettes det en Microsoft Entra-tenant for hver tjeneste som krever pålogging. Det er langt enklere for en organisasjon å bruke en felles tenant for alle Microsoft skytjenestene.

Entra IDfungerer som en identitetsplattform for tjenester som Microsoft 365, Azure, Dynamics 365 og Intune. Den gir sentralisert autentisering og autorisasjon, og støtter SSO mot både Microsoft tjenester og tredjepartsapper som Google og Facebook.

Å integrere egendefinerte apper med Entra ID kan være komplekst, men Azure portalen og nyere versjoner av Visual Studio forenkler prosessen. I Azure App Service kan Entra autentisering aktiveres direkte, og du kan begrense tilgang til brukere i en bestemt tenant. Ulike deployment slots kan ha egne autentiseringsinnstillinger.

### Oppsummering
- Skytjenester som Microsoft 365 og Intune trenger en skybasert katalogtjeneste for autentisering, dette blir en Entra-tenant
- Kan samle alle Microsoft skytjenester i en felles Entra-tenant for enklere administrasjon
- Entra ID gir sentralisert autentisering, autorisasjon og SSO for både Microsoft-tjenester og tredjepartsapper
- Egendefinerte apper kan integreres i Entra ID via Azure portalen og Visual Studio
- Azure App Service kan bruke Entra autentisering for å begrense tilgang til brukere i en bestemt tenant
## [Compare Microsoft Entra ID P1 and P2 plans](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/5-compare-azure-premium-p1-p2-plans)
Microsoft Entra ID P1 og P2 gir mer funksjonalitet enn Free- og Office 365 utgavene, men krever ekstra lisenskostnader per bruker.
Lisensene kan kjøpes separat eller som en del av _Enterprise Mobility + Security_, som også inkluderer Azure Information Protection og Intune. 
Microsoft tilbyr en gratis prøveperiode for å teste full P2 funksjonalitet.

### Funksjoner i Entra ID P1
- _Selvbetjent gruppeadministrasjon_: Brukere kan opprette og administrere grupper, samt be om medlemskap som gruppeeier kan godkjenne
- _Avanserte sikkerhetsrapporter og varsler_: Maskinlæringsbaserte rapporter som avdekker unormal aktivitet og forbedrer sikkerheten
- _Full MFA støtte_: Fungerer med lokale apper (VPN, RADIUS), Azure, Microsoft 365, Dynamics 365 og tredepartsapper i Entra galleriet
- _[Microsoft Identity Manager (MIM)](certs/Glossary/Microsoft-Identity-Manager-(MIM).md)_: Gir hybrid identitet ved å koble lokale kataloger (AD DS, LDAP, Oracle) med Entra ID
- _99,9% SLA_: Garantert tilgjengelighet for P1/P2 (samme som Entra Free)
- _Passordtilbakestilling med writeback_: Selvbetjente passordreset følger lokal AD policy
- _Cloud App Discovery_: Identifiserer ofte brukte skyapper
- _Conditional Access_: Basert på enhet, gruppe eller lokasjon
- _Entra Connect Health_: Gir innsikt i drift, ytelse og konfigurasjon

### Ekstra funksjoner i Entra ID P2
- _Entra ID Protection_: Overvåker og beskytter kontoer med risikopolicyer og analyser av brukeradferd
- _Privileged Identity Managment (PIM)_: Styrer priviligerte roller med midlertidige rettigheter og godkjenningsflyt for administrative handlinger

## [Examine Microsoft Entra Domain Services](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/6-examine-azure-domain-services)
I mange organsiasjoner kjører forretningskritiske (LOB) apper på domain joined eneheter som bruker AD DS legitimasjon og GPO. Når disse appene flyttes til Azure, oppstår utfordringer med hvordan autentisering skal håndteres. 
Tradisjonelle løsninger er enten:
- _Site-to-site VPN_ mellom lokal infrastruktur og Azure (autentisering går over VPN)
- _Replikerte domenekontrollere i Azure_ (replikering går over VPN, autentisering skjer i skyen)

Begge alternativer gir ekstra kostnader og administrasjon.

Entra Domain Services (en del av Entra ID P1/P2) tilbyr et enklere alternativ. Tjenesten gir domenefunksjoner som GPO, domain join og Kerberos autentisering direkte i Entra-tenantet, uten behov for domenekontrollere i skyen. Den er fullt kompatibel med lokal AD DS.

![](Pasted-image-20260120224601.png)

Når Entra ID integreres med lokal AD DS via Entra Connect, kan brukere benytte samme legitimasjon både lokalt og i Entra Domain Services. Tjenesten kan også brukes som en ren skybasert løsning uten lokal AD DS. 
En organisasjon kan f.eks. opprette en Entra-tenant, aktivere Entra Domain Services og koble den til et virtuelt nettverk som lokale ressurser kan bruke.

### Fordeler med Entra Domain Services
- Ingen drift eller vedlikehold av domenekontrollere
- Ingen behov for å administrere AD replikering
- Ingen Domain Admins/Enterprise Admins nødvendig

### Begrensninger
- Kun grunnleggende _computer objects_ støttes
- Skjemaet kan ikke utvides
- OU-strukturen er flat, kan ikke nøstes
- Innebygd GPO for brukere og maskiner, men målrettes mot OUs
- Ingen WMI-filtere eller sikkerhetsgruppe-filtrering

Med Entra Domain Services kan apper som bruker LDAP, NTLM eller Kerberos flyttes til skyen uten domenekontroller eller VPN. Applikasjoner som SQL Server og SharePoint kan kjøres på Azure VMer uten tradisjonell AD-infrastruktur.

Tjenesten aktiveres via Azure portalen og faktureres per time basert på katalogstørrelse.

## [Module assessment](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/7-knowledge-check)

1. _Which of the following is a limitation of Microsoft Entra ID compared to AD DS?_
	Lack of support for Group Policy Objects (GPOs).
2. _Your organization wants to ensure that only users from its Microsoft Entra tenant can access a specific Azure web application. Which configuration should be applied in the Azure portal to achieve this?_ 
	Designate the Microsoft Entra tenant in the Authentication/Authorization blade
3. _What feature does Microsoft Entra ID P2 offer that is crucial for organizations needing to manage temporary and permanent administrative roles?_ 
	Microsoft Entra Privileged Identity Management
4. _An organization using AD DS is planning to extend its on-premises infrastructure to Microsoft Entra ID. What feature of Microsoft Entra ID can help manage user authentication across both environments?_ 
	Enabling federation between organizations
5. _An enterprise is facing issues with inconsistent access patterns and potential security threats to its cloud applications. Which feature available in Microsoft Entra ID P1 can help address these concerns?_ 
	Advanced security reports and alerts
6. _Your organization requires advanced security reports and alerts for cloud applications. Which Microsoft Entra ID plan should you choose to meet this requirement?_ 
	Microsoft Entra ID P1
7. _Your company needs a feature that allows you to define user risk policies and sign-in policies. Which Microsoft Entra ID plan should you consider?_ 
	Microsoft Entra ID P2
8. _How does Microsoft Entra ID achieve application isolation differently from AD DS?_ 
	Using service principal objects to represent application instances.
9. _Which feature distinguishes Microsoft Entra ID from AD DS in terms of application management?_ 
	Service principal objects for cross-tenant application usage.

## [Summary](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/8-summary)
Active Directory håndterer identitetsadministrasjon lokalt, mens Entra ID gjør det samme i skyen. Entra ID brukes ofte først om fremst for autentisering av skyapper, men kan også dekke hele infrastrukturen. Begge løsningene utfyller hverandre og brukes ofte sammen for å gi en komplett identitetsplattform. Entra ID finnes i en gratis versjon, med betalte nivåer for mer avanserte funksjoner.