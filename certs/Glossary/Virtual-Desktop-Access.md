---
layout: default
title: Virtual Desktop Access (VDA)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/License
  - MD-102/Virtualization
  - MD-102/VDA
---
Virtual Desktop Access brukes for å gi tilgang til en Windows virtuell desktop i miljøer der enheten ikke har innebygde rettigheter til å kjøre eller aksessere en Windows klient i et VDI miljø.

_Windows VDA er en abonnementsbasert lisens per enhet_, og brukes typisk for tynne klienter, kiosker, delte enheter eller privateide maskiner. Den gir rett til å koble seg til en Windows Enterprise virtuell maskin.

Enheter som allerede har _Windows Enterprise med Software Assurance_ eller brukere med _Microsoft 365 E3/E5_ trenger vanligvis ikke VDA, siden disse lisensene inkluderer rettigheter til å aksessere virtuelle Windows klienter.

VDA brukes også i scenarioer der virtuelle maskiner aktiveres via _Windows Subscription Activation_, som automatisk oppgraderer VM til Enterprise når en lisensiert bruker logger inn. Dette gjør at man slipper KMS eller MAK i skybaserte miljøer.

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

    A[Enhet uten SA eller kvalifiserende OS] --> B[Krever VDA lisens]
    B --> C[Enhet får tilgang til virtuell Windows klient]
    C --> D[Bruker logger inn]
    D --> E[VM aktiveres via Subscription Activation]
    E --> F[Windows Enterprise tilgjengelig i VDI]

```