---
layout: default
title: Windows Low Extra Delay Background Transport (LEDBAT)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/LEDBAT
  - MD-102/BITS
---
LEDBAT er en mekanisme for bakgrunnsoverføringer i Windows som bruker tilgjengelig båndbredde uten å skape forsinkelser for annen trafikk. Når nettverket er ledig, bruker LEDBAT mest mulig kapasitet. Når det oppstår belastning, trekker LEDBAT seg raskt tilbake for å gi plass til trafikk som er viktigere. Dette gjør LEDBAT egnet for oppdateringer, distribusjoner og annen bakgrunnstrafikk som ikke må forstyrre brukerne. LEDBAT er innebygd i Windows TCP‑stakken og brukes blant annet av Windows Update, Configuration Manager og OneDrive.

## Forskjeller mellom LEDBAT og BITS

**LEDBAT**

- Bruker all tilgjengelig båndbredde når nettverket er ledig
- Trekker seg automatisk tilbake når det oppstår forsinkelser
- Krever ingen koordinering mellom klient, server eller nettverksutstyr
- Egnet for store bakgrunnsoverføringer som ikke må påvirke brukere

**BITS**

- Bruker ledig båndbredde, men med mer konservativ regulering
- Har innebygd gjenopptakelse, køhåndtering og tidsplanlegging
- Egnet for kontrollerte filoverføringer som må være stabile og forutsigbare
- Kan bruke BranchCache når aktivert

```mermaid
%%{init: {
  "theme": "dark",
  "themeVariables": {
    "primaryColor": "#1e1e1e",
    "primaryTextColor": "#ffffff",
    "lineColor": "#ffffff",
    "secondaryColor": "#333333"
  }
}}%%

flowchart LR

    A[Start bakgrunnsoverføring] --> B[LEDBAT aktivert]
    B --> C[Bruker tilgjengelig båndbredde]
    C --> D[Overvåker forsinkelse i nettverket]

    D --> E[Ingen belastning]
    E --> F[Fortsatt høy hastighet]

    D --> G[Belastning oppdages]
    G --> H[LEDBAT reduserer hastighet]

    H --> I[Forgrunnen får prioritet]
    I --> J[LEDBAT øker igjen når trafikken faller]

```


[Content management fundamentals - Configuration Manager | Microsoft Learn](https://learn.microsoft.com/en-us/intune/configmgr/core/plan-design/hierarchy/fundamental-concepts-for-content-management)
[LEDBAT Background Data Transfer for Windows | Microsoft Community Hub](https://techcommunity.microsoft.com/blog/networkingblog/ledbat-background-data-transfer-for-windows/3639278)