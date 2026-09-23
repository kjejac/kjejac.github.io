---
layout: default
title: Entra-registrert klient
nav_order: 3
parent: Execute device enrollment
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
  - MD-102/EntraID
  - MD-102/EntraJoin
  - MD-102/EntraRegistred
  - MD-102/AzureADRegistered
---
# Entra-registrert klient

## Mål
Forstå forskjellen mellom registrering og full Entra join.

## Refleksjon

I motsetning til Join er _Registered_ en _brukerbasert tilknytning_. Dette gjør at enheten ikke får full identitet og lar seg heller ikke administrere gjennom MDM.
Forskjellen fremkommer tydelig både i Entra admin center og `desregcmd`.

En Entra‑registrert klient er en enklere tilknytning til Entra ID der brukeren kobler en eksisterende Windows‑installasjon til arbeid eller skole, uten at enheten blir fullt Entra‑joinet. Dette gir brukeren tilgang til ressurser som e‑post, Teams og enkelte apper, men enheten får ikke samme grad av administrasjon som ved Entra join. Oppgaven viser hvordan denne registreringen fungerer i praksis, og tydeliggjør forskjellen mellom en klient som bare er registrert og en klient som er fullt administrert av Intune.

## Verifiseringer

- `Entra admin center > Devices`
	- Join type: Microsoft Entra registered
	- MDM status: None

- På klienten (`dsregcmd /status`):
	- WorkplaceJoined = YES
	- AzureAdJoined = NO
	- Ingen Device ID
	- Ingen MDMUrl
	- Ingen CloudAP
	- Ingen full PRT

> Note
> Hvis enheten allerede er Microsoft Entra Joined vil _Device ID_ alltid vises, uansett hvilken bruker som er innlogget.

Forskjellen på Registered og Join

| Egenskap    | (Azure AD/)Entra Registered | Entra Joined                     |
| ----------- | --------------------------- | -------------------------------- |
| Join-type   | Lett tilknytning            | Full tilknytning                 |
| Device ID   | ❌ Nei                       | ✔ Ja                             |
| PRT         | ❌ Begrenset / ingen         | ✔ Full PRT                       |
| CloudAP     | ❌ Nei                       | ✔ Ja                             |
| Intune MDM  | ❌ Nei                       | ✔ Ja (hvis automatic enrollment) |
| Typisk bruk | BYOD                        | Bedriftsenheter                  |

## Vanlige feil og hvordan de løses

_Feil_: Enheten blir _registered_ i stedet for _joined_<br>
_Årsak_: Brukeren valgte "Connect" i stedet for OOBE-join

_Feil_: Enheten dukker ikke opp i Intune<br>
_Årsak_: Registered gir ikke MDM-administrasjon

_Feil_: Device ID vises selv om du tester _registered_<br>
_Årsak_: Maskinen er allerede _Entra Joined_


## Steg for steg

1. Start Windows og logg inn med en lokal konto eller Microsoft‑konto.
2. Åpne **Settings → Accounts → Access work or school**.
3. Klikk **Connect**.
4. Skriv inn en Entra‑konto (arbeid/skole).
5. Fullfør påloggingen (passord, MFA, eventuelle policyer).
6. Når tilkoblingen er opprettet, åpne **Info** under kontoen for å se detaljer.
7. Åpne PowerShell og kjør:
 
    ```
    dsregcmd /status
    ```
    
    Bekreft:
    - `WorkplaceJoined = YES`
    - `AzureAdJoined = NO`
    - Ingen Device ID
    - Ingen MDMUrl
        
8. Gå til **Entra admin center → Devices** og bekreft at enheten vises som:
    - Join type: **Microsoft Entra registered**
    - MDM status: **None**
9. Sjekk Intune admin center:
    - Enheten vil **ikke** vises med MDM‑tilknytning
    - Den kan være helt fraværende hvis automatic enrollment ikke er aktivert




