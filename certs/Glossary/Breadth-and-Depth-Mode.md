---
layout: default
title: Breadth and Depth mode
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/VDI
  - MD-102/VirtualDesktop
---
## Breadth first

Breadth first betyr at AVD fordeler brukere jevnt utover alle tilgjengelige virtuelle maskiner i en pooled host pool. Målet er å spre belastningen slik at alle maskiner får omtrent like mange aktive sesjoner.

Dette gir:

- jevn ressursbruk
- lavere belastning per maskin
- bedre ytelse for hver enkelt bruker

Breadth first brukes ofte når du vil sikre god brukeropplevelse og unngå at en enkelt VM blir tungt belastet.

## Depth first

Depth first betyr at AVD fyller opp én virtuell maskin om gangen før neste tas i bruk. Brukere sendes til samme VM til den når MaxSessionLimit, og først da tas neste maskin i bruk.

Dette gir:

- færre aktive maskiner
- lavere kostnader når autoscale brukes
- høyere belastning per maskin

Depth first brukes ofte når kostnadsoptimalisering er viktigere enn jevn ytelse.

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

    A[Breadth first] --> B1[Brukere fordeles jevnt]
    A --> B2[Alle VM tas i bruk tidlig]
    A --> B3[Bedre ytelse per bruker]

    C[Depth first] --> D1[Fyller én VM om gangen]
    C --> D2[Færre VM i drift]
    C --> D3[Kostnadsbesparelse med autoscale]

```