---
layout: default
title: Encrypting File System (EFS)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/EFS
---
Encrypting File System er en innebygd Windows‑funksjon som beskytter data ved å kryptere filer og mapper på NTFS‑volumer. Krypteringen skjer transparent for brukeren og er knyttet til brukerens identitet, noe som gjør at kun autoriserte kontoer kan åpne innholdet. Dette gir et ekstra lag med beskyttelse dersom en angriper får fysisk tilgang til en maskin, kopierer disken eller forsøker å lese filer uten riktig legitimasjon.

EFS bruker en kombinasjon av symmetrisk og asymmetrisk kryptering: filene krypteres med en File Encryption Key (FEK), mens FEK igjen beskyttes av brukerens sertifikatbaserte nøkkelpar. Dette gjør løsningen både sikker og effektiv i praktisk bruk. Administrasjon kan gjøres lokalt eller via gruppepolicy, og sertifikater kan utstedes automatisk gjennom Active Directory Certificate Services.

I en MD‑102‑kontekst er hovedpoenget å forstå hvordan EFS inngår i helheten av databeskyttelse på Windows‑klienter. Løsningen beskytter data i hvile, men ikke nødvendigvis mot autoriserte brukere eller apper som allerede har tilgang. Derfor brukes EFS ofte sammen med andre teknologier som BitLocker og Windows Information Protection for å dekke ulike trusselmodeller. EFS er spesielt relevant i miljøer der individuelle filer må sikres uavhengig av hele diskvolumet.

```mermaid
flowchart TB

    subgraph EFS["EFS – Fil- og mappekryptering"]
        E1[Beskyttelse på filnivå]
        E2[Knyttet til brukerens sertifikat]
        E3[Hindrer tilgang ved filkopiering]
        E4[Data i hvile]
    end

    subgraph BL["BitLocker – Diskkryptering"]
        B1[Krypterer hele volumet]
        B2[Beskyttelse ved fysisk tilgang]
        B3[TPM-basert nøkkelhåndtering]
        B4[Data i hvile]
    end

    subgraph WIP["WIP – Dataseparasjon og lekkasjebeskyttelse"]
        W1[Skiller jobb- og privatdata]
        W2[Kontrollerer app-tilgang]
        W3[Hindrer kopiering/deling til feil steder]
        W4[Data i bruk og i bevegelse]
    end

    %% Sammenligningslinjer
    E4 -->|Beskytter data i hvile| BL
    BL -->|Beskytter hele disken| EFS

    W1 -->|Fokuserer på datalekkasjer| EFS
    W1 -->|Fokuserer på datalekkasjer| BL

```
