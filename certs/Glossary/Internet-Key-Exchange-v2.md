---
layout: default
title: Internet Key Exchange v2 (IKEv2)
nav_order:
parent:
has_children: false
nav_exclude: true
has_toc: false
tags:
  - MD-102
  - MD-102/IKEv2
  - MD-102/VPN
---

IKEv2/IPsec er en rask, stabil og sikker VPN‑protokoll som fungerer spesielt godt på mobile enheter. Den er et anbefalt valg i moderne Windows‑miljøer og et viktig alternativ til SSTP og L2TP/IPsec

| Tema                        | Forklaring                                                                       | Relevans for MD‑102                                              |
| --------------------------- | -------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| **Hva er IKEv2/IPsec?**     | En nøkkelhåndteringsprotokoll som setter opp sikre forbindelser i IPsec.         | MD‑102 krever forståelse av moderne, sikre VPN‑protokoller.      |
| **Sikkerhet**               | Bruker moderne kryptografi, sterke algoritmer og sertifikatbasert autentisering. | Viktig når du vurderer sikre tilkoblinger i Windows‑miljøer.     |
| **Stabilitet og mobilitet** | Ekstremt stabil ved nettverksbytte (Wi‑Fi ↔ mobil) takket være MOBIKE.           | Relevante scenarioer for mobile brukere og hybrid arbeid.        |
| **Hastighet**               | Rask, effektiv og lav overhead.                                                  | Påvirker brukeropplevelse og ytelse.                             |
| **Bruksområde**             | Klient‑VPN, spesielt på mobile enheter.                                          | MD‑102 dekker konfigurasjon av VPN‑tilkoblinger i Windows 10/11. |
| **Fordeler**                | Stabilitet, sikkerhet, hastighet, god NAT‑støtte.                                | Forstå hvorfor IKEv2 ofte anbefales fremfor eldre protokoller.   |
| **Ulemper**                 | Kan være mer kompleks å konfigurere enn SSTP.                                    | Relevante vurderinger for drift og feilsøking.                   |

https://www.paloaltonetworks.com/cyberpedia/what-is-ikev2?utm_source=copilot.com
https://www.privacyaffairs.com/ikev2-vpn-protocol/?utm_source=copilot.com
https://nordlayer.com/learn/vpn/ikev2/?utm_source=copilot.com