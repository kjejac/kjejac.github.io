---
layout: default
title: Forskjellen mellom MDM og GPO
nav_order: 7
parent: Explore Endpoint Management
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
  - MD-102/MDM
  - MD-102/GPO
---
# Forskjellen mellom MDM og GPO

## Mål
Forstå hvorfor moderne administrasjon erstatter tradisjonell GPO-styring.

## Steg for steg

Moderne administrasjon via Intune bygger på MDM-policyer som leveres over internett, mens tradisjonell administrasjon baserer seg på GPO-styring gjennom lokal Active Directory. 
Dette gir to helt ulike måter å administrere enheter på.

### Tradisjonell administrasjon med GPO

Den tradisjonelle administrasjon krever at enheten er medlem av et lokalt domene med infrastruktur hvor policyene leveres når enheten er på nettverket. Her fungerer GPO-er godt siden enhetene er tilknyttet nettverket regelmessig.

### Moderne administrasjon med MDM

Moderne administrasjon krever kun internettforbindelse da MDM leverer policyer via skyen. Policyene er enklere og mer fleksible, og fungerer på tvers av plattformene. Intune bruker [Entra ID](../../../Glossary/Microsoft-Entra-ID.md) i stedet for lokal AD, og enheten kan administreres så lenge den har internettforbindelse.

### Hvorfor MDM erstatter GPO

Moderne drift krever at enheten fungerer utenfor bedriftens nettverk. Nye arbeidsmåter og krav til sikkerhet ([Zero Trust](../../../Glossary/Zero-Trust.md)) gjør at lokal GPO-styring ikke dekker dagens behov. MDM gir en mer forutsigbar og skalerbar administrasjon, og policyer leveres raskere og mer konsistent enn tradisjonelle GPO-oppdateringer.

### Brukeropplevelse

MDM gir en mer selvbetjent opplevelse for brukeren. Policyer leveres automatisk, compliance vises i Company Portal, og brukeren kan starte oppdatering ved behov. Dette er en helt annen modell enn GPO, der brukeren må vente på at enheten kobles til domenet før policyer oppdateres.

## Refleksjon

MDM og Intune representerer en moderne administrasjonsmodell som fungerer uavhengig av lokal infrastruktur. Policyer leveres over internett, enheter administreres gjennom Entra ID, og brukeren får en mer forutsigbarhet og fleksibel opplevelse. Dette gjør MDM til en naturlig erstatning for tradisjonell GPO-styring i dagens miljøer.
