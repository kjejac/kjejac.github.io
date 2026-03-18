---
layout: default
title: Mobile Threat Defense (MTD)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/Intune
  - MD-102/MDE
---
I Intune brukes begrepet _Mobile Threat Defense (MTD)_ som en _kategori_ for sikkerhetsplattformer som kan sende trusseldata om enheter tilbake til Intune.

- _MTD = sikkerhetsmotor som rapporterer trusler til Intune._
- _[Defender for Endpoint](Microsoft-Defender-for-Endpoint.md) = Microsofts MTD‑løsning._
- _Compliance‑policy kan kreve at MTD‑risiko = Low → ellers blir enheten non‑compliant._

Dette inkluderer:

- _Microsoft Defender for Endpoint (MDE)_
- Lookout MTD
- Zimperium
- Corrata
- Pradeo
- Symantec MTD
- m.fl.
    

_Defender for Endpoint er én av flere MTD‑leverandører_, men den er den mest brukte og den som er tettest integrert i Microsoft‑økosystemet.

```mermaid
flowchart LR
    A[MDE<br>Trusselvurdering]:::mde
    B[Intune<br>Device Compliance]:::intune
    C[Entra ID<br>Compliance-status]:::aad
    D[Conditional Access<br>Tilgangsvurdering]:::ca
    E[Tilgang<br>tillatt / blokkert]:::result

    A -->|Sender risiko-score<br>Low/Medium/High| B
    B -->|Markerer enhet som<br>Compliant / Non-compliant| C
    C -->|Rapporterer status til| D
    D -->|Evaluerer policyer<br>f.eks. 'Require compliant device'| E

    classDef mde fill:#1e88e5,stroke:#90caf9,color:#fff;
    classDef intune fill:#43a047,stroke:#a5d6a7,color:#fff;
    classDef aad fill:#8e24aa,stroke:#ce93d8,color:#fff;
    classDef ca fill:#fb8c00,stroke:#ffcc80,color:#fff;
    classDef result fill:#546e7a,stroke:#b0bec5,color:#fff;

```