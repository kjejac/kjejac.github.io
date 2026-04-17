---
layout: default
title: Information Rights Management (IRM)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/IRM
  - MD-102/AzureRMS
  - MD-102/AIP
  - MD-102/WIP
---
Information Rights Management IRM beskytter filer og e post ved å bruke kryptering og bruksrettigheter som følger dokumentet uansett hvor det lagres eller deles. Det bygger på Azure Rights Management og krever at mottakeren autentiseres før innholdet kan åpnes.

### IRM

IRM er en teknologi som beskytter sensitiv informasjon ved å kombinere kryptering, identitet og autorisasjonspolicyer. Beskyttelsen ligger i selve filen, ikke i lagringsstedet. Dette gjør at dokumentet forblir kontrollert selv etter at det er lastet ned eller videresendt.

IRM bruker [Azure Rights Management](Azure-Rights-Management.md) til å tildele bruksrettigheter, som for eksempel om en bruker kan åpne, kopiere, skrive ut eller videresende innhold.

Hvordan IRM fungerer

- Filer krypteres når de lastes ned fra IRM aktiverte biblioteker eller tjenester.
- Brukeren må autentiseres mot Rights Management tjenesten for å få tilgang.
- Rettigheter valideres hver gang dokumentet åpnes, både online og offline.

IRM kan brukes i flere Microsoft 365 tjenester, inkludert SharePoint, OneDrive, Exchange og Office apper som Word og Excel.

### IRM beskytter mot

IRM hindrer:

- Uautorisert videresending av dokumenter
- Utskrift eller kopiering av innhold
- At filer kan åpnes av brukere uten riktige rettigheter

I Exchange beskytter IRM e post mot informasjonssvinn ved å sikre meldinger og vedlegg både online og offline.

### Begrensninger

IRM beskytter ikke:

- Innhold som brukes i apper som ikke støtter IRM
- Scenarioer der mottakeren bruker enheter uten nødvendig klientstøtte
- Data som vises via skjermbilder eller kamera

### For MD 102 er det viktig å forstå at IRM:

- Er et sterkt, men ikke komplett verktøy for databeskyttelse
- Beskytter dokumenter etter at de forlater et kontrollert miljø
- Krever Azure Rights Management og kompatible klienter
- Supplerer, men erstatter ikke, teknologier som DLP og WIP

IRM er ett lag i en bredere Zero Trust strategi der data skal være beskyttet uansett hvor de befinner seg.


https://www.sharepointeurope.com/media/385755/webinar_-_information_rights_management_in_sharepoint.pdf?utm_source=copilot.com
https://learn.microsoft.com/en-us/purview/set-up-irm-in-sp-admin-center?utm_source=copilot.com
https://learn.microsoft.com/en-us/microsoft-365/enterprise/activate-rms-in-microsoft-365?view=o365-worldwide&utm_source=copilot.com
https://learn.microsoft.com/en-us/exchange/policy-and-compliance/information-rights-management?utm_source=copilot.com