---
layout: default
title: Power BI
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
---
Power BI brukes i MD‑102 til å hente og visualisere data fra Intune Data Warehouse. Det gir historiske, detaljerte og tilpassede rapporter som ikke finnes i Intune‑portalen, og brukes til å analysere enhetsstatus, compliance, OS‑versjoner og trender.

Her kommer en _klar, presis og MD‑102‑relevant oppsummering av Power BI_, basert på innholdet i fanen du har åpen om Intune Data Warehouse [learn.microsoft.com](https://learn.microsoft.com/en-us/intune/intune-service/developer/reports-nav-create-intune-reports) og Microsofts offisielle dokumentasjon.

### Relevanse for MD‑102

- hente data fra _Intune Data Warehouse_
- lage _tilpassede rapporter_
- visualisere _historiske trender_
- analysere _compliance_, _enhetsstatus_, _OS‑versjoner_, _app‑bruk_ og _utrulling_

Bruke Power BI til å hente innsikt fra Data Warehouse og bygge rapporter basert på OData‑feed‑en [learn.microsoft.com](https://learn.microsoft.com/en-us/intune/intune-service/developer/reports-nav-create-intune-reports).

### Hva Power BI brukes til i Intune‑sammenheng

#### 1. Koble til Intune Data Warehouse

Hente en OData‑URL og koble den direkte til Power BI for å hente data [learn.microsoft.com](https://learn.microsoft.com/en-us/intune/intune-service/developer/reports-nav-create-intune-reports).

#### 2. Lage rapporter som ikke finnes i Intune Admin Center

- trender i enhetsregistrering
- app‑ og OS‑versjonsfordeling
- compliance‑trender
- historiske data (som Intune‑portalen ikke viser)

Dette er en av hovedgrunnene til at Data Warehouse eksisterer.

#### 3. Daglig oppdaterte datasett

Data Warehouse oppdateres daglig, og Power BI kan hente disse oppdateringene automatisk.

#### 4. Avansert analyse

- filtrere
- gruppere
- sammenligne
- lage dashboards
- eksportere visualiseringer

Dette er nyttig for IT‑drift, sikkerhet og rapportering til ledelsen.

### MD‑102

Trenger ikke å kunne bygge Power BI‑rapporter i detalj, men må forstå:

- at _Intune Data Warehouse_ gir en OData‑feed
- at _Power BI brukes til å hente og visualisere disse dataene_
- at dette gir _mer innsikt enn Intune Admin Center_
- at Data Warehouse inneholder _historiske data_, noe portalen ikke gjør
- at Power BI er verktøyet Microsoft anbefaler for avansert Intune‑rapportering

[learn.microsoft.com](https://learn.microsoft.com/en-us/intune/intune-service/developer/reports-nav-create-intune-reports).

