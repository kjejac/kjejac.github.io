---
layout: default
title: Trusted Platform Module (TPM)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/CredentialGuard
  - MD-102/BitLocker
  - MD-102/Authentication
  - MD-102/Windows11
---
TPM er en _maskinvarebasert sikkerhetsmodul_ som beskytter kryptografiske nøkler, måler systemintegritet og bidrar til sikker oppstart. Den er designet for å være fysisk manipulasjonssikker og utfører kryptografiske operasjoner i et isolert miljø.

TPM brukes til å:

- generere, lagre og beskytte kryptografiske nøkler
- autentisere enheter ved hjelp av en unik RSA nøkkel som ligger brent inn i brikken
- måle og lagre integritetsdata fra oppstartsprosessen for å sikre at systemet starter i en kjent og tillitbar tilstand
- lagre passord, sertifikater og andre autentiseringsdata på en måte som er svært vanskelig å hente ut uten autorisasjon

TPM brukes i Windows for funksjoner som BitLocker, autentisering, attestasjonsmekanismer og beskyttelse mot phishing ved at nøkler aldri forlater TPM‑brikken. Den er også et krav for Windows 11.

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

flowchart TB

    A[System startup] --> B[TPM measures boot components]
    B --> C[Integrity values stored in TPM]

    A --> D[TPM provides cryptographic keys]
    D --> E[OS unlocks encrypted data]

    F[Attacker] --> G[Attempts to extract keys]
    G -.-|Blocked by hardware isolation| D

    C --> H[Remote attestation]
    H --> I[System verified as trustworthy]

```

[Trusted Platform Module Technology Overview | Microsoft Learn](https://learn.microsoft.com/en-us/windows/security/hardware-security/tpm/trusted-platform-module-overview)
[Trusted Platform Module (TPM) Summary | Trusted Computing Group](https://trustedcomputinggroup.org/resource/trusted-platform-module-tpm-summary)
[Trusted Platform Module - Wikipedia](https://en.wikipedia.org/wiki/Trusted_Platform_Module)