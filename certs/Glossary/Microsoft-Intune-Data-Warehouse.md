---
layout: default
title: Microsoft Intune Data Warehouse
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
---
Intune Data Warehouse gir deg historiske, detaljerte og analyserbare data om Intune‑miljøet ditt. Det oppdateres daglig, bruker OData‑standard, og brukes ofte sammen med Power BI for å lage avanserte rapporter som ikke finnes i Intune‑portalen.

### Hva Intune Data Warehouse brukes til

Du kan bygge rapporter som viser:

- _Trender i enhetsregistrering_ (f.eks. hvor mange som melder seg inn over tid)
- _App‑ og OS‑versjonsfordeling_
- _Compliance‑trender_ (hvordan enheter beveger seg mellom compliant/non‑compliant)
- _Historiske data_ som ikke er tilgjengelig i Intune‑portalen

### Fordeler med Data Warehouse

- _Mer data enn i Intune Admin Center_
- _Historiske data_ (ikke bare nå‑status)
- _Daglig oppdatering_
- _Standardisert OData‑modell_ som kan brukes i Power BI eller egne scripts

Dette gjør Data Warehouse ideelt for:

- rapportering
- trendanalyse
- revisjon
- kapasitetsplanlegging
- sikkerhetsoppfølging

### API‑versjoner

| Versjon  | Bruk              | Kommentar                                                   |
| -------- | ----------------- | ----------------------------------------------------------- |
| _v1.0_ | Stabil, anbefalt  | Endringer er additive og bryter ikke eksisterende løsninger |
| _beta_ | Ny funksjonalitet | Kan endre seg og potensielt bryte kode                      |

### Bruke Data Warehouse

Dokumentasjonen viser at du kan:

- hente en _OData‑URL_ fra Intune
- koble den til _Power BI_
- bygge egne rapporter basert på datasettet

- lage compliance‑rapporter
- analysere enhetshelse
- følge utrulling av policyer
- dokumentere miljøet ditt

[Use the Intune Data Warehouse](https://learn.microsoft.com/en-us/intune/intune-service/developer/reports-nav-create-intune-reports)