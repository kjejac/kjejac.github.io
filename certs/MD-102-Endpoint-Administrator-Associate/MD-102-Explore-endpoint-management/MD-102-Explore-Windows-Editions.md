---
title: Explore Windows Editions
nav_order: 2
parent: Uke 1 – Refleksjoner
has_children:
tags:
  - MD-102
  - MD-102/EntraID
  - MD-102/ADDS
  - MD-102/EntraID-Identities
  - MD-102/Intune
  - MD-102/Windows10
  - MD-102/Windows11
---
# MD-102 – Explore Windows Editions

Modulen gir en helhetlig forståelse av enterprise-klienter, Windows-klienter og [Microsoft Entra ID](certs/Glossary/Microsoft-Entra-ID.md).
Den gjennomgår ulike Windows-versjoner, hvilke funksjoner de tilbyr og hvordan de installeres. I tillegg belyser modulen Microsoft Entra ID, med fokus på likheter og forskjeller fra AD DS samt hvordan identiteter administreres i Entra ID.

[Microsoft Learn – Explore Windows Editions](https://learn.microsoft.com/en-us/training/modules/explore-windows-editions/)
## [Introduction](https://learn.microsoft.com/en-us/training/modules/explore-windows-editions/1-introduction)
Windows 10 og 11 benyttes på en rekke forskjellige typer enheter. Modulen gir en klar oversikt over de ulike Windows-utgavene, hvilke funksjoner de tilbyr og hvordan de installeres. Den gir også innsikt i når det er riktig å velge en bestemt versjon, basert på krav, behov og bruksområde.
## [Examine Windows client editions and capabilities](https://learn.microsoft.com/en-us/training/modules/explore-windows-editions/2-examine-client-editions-capabilities)

[Windows finnes i flere utgaver](certs/Glossary/Windows-Edition-Details.md), utviklet for ulike målgrupper og behov. For å velge riktig Windows-utgaven er det viktig å ha oversikt over hvilke funksjoner hver versjon tilbyr, og vurdere hvilken som dekker kravene, behovene og bruksområdet i den aktuelle installasjonen.

- Windows finnes i flere utgaver, hver rettet mot ulike behov, fra privatbrukt til store organisasjoner og spesialiserte enheter
- Home dekker grunnleggende behov, Pro gir avansert administrasjon, og Enterprise tilbyr full kontroll og sikkerhet for større organisasjoner
- LTSC brukes i stabile, uendrede miljøer
- EDU-utgavene er tilpasset skolesektoren
- IoT-utgavene er laget for faste, dedikerte enheter

|**Windows 10 / Windows 11 Edition**|**Audience**|**Availability**|
|---|---|---|
|Home|Individual home use|Everyone|
|Pro|Small and mid-sized businesses, advanced users|Everyone|
|Pro for Workstations|Users with advanced performance and storage requirements|Everyone|
|Enterprise|Large enterprise organizations|Available to Volume LicenseMicrosoft Volume Licensing, Microsoft Enterprise Agreement, Microsoft Store for Education or Microsoft Cloud Solution Provider program|
|Enterprise LTSC|Large enterprise organizations with restrictive change requirements|Microsoft Volume Licensing, Microsoft Enterprise Agreement, or Microsoft Cloud Solution Provider program|
|Pro Education|Comparable to Pro for school staff, administrators, teachers, and students|Available to academic Volume License customers|
|Education|Comparable to Enterprise for school staff, administrators, teachers, and students|Available to academic Volume License customers|
|IoT Core/Enterprise|Fixed purpose and appliance devices|Available through Windows IoT Distributors|
## [Select client edition](https://learn.microsoft.com/en-us/training/modules/explore-windows-editions/3-select-client-edition)
Windows 11 og tidligere versjoner kan kjøres på en rekke ulike enheter, men ikke alle Windows-utgaver støtter alle formfaktorer.

- Windows støtter mange formfaktorer, men valg av utgave avhenger av behov, sikkerhet og bruksområde
- 64-bit Windows er standard og bør brukes på alle moderne enheter
- LTSC brukes i stabile, sensitive miljøer
- Pro passer for avanserte brukere og småbedrifter
- Enterprise gir maksimal sikkerhet og administrasjon for større organsisjoner
### Form factors
#### Desktop PC
Brukes der høy ytelse er avgjørende, som CAD eller tekniske arbeidsstasjoner
#### Laptop
Har blitt mer populær enn stasjonære PCer pga mobilitet, hjemmekontor og god ytelse. Perifere enheter kan forbedre ergonomien.
#### Tablet
God til eposter, presentasjoner og lett arbeid. Begrenset utvidelsesmuligheter
#### Hybrid (2-i-1)
Kombinerer laptop og nettbrett. Mer populær enn rene nettbrett for brukere som skriver mye. Surface Pro er et typisk eksempel.
#### Xbox
Primært for spill og underholdning.
#### HoloLens
Holografisk datamaskin brukt i utdanning, design og industri.
#### Surface Hub
Stor berøringsskjerm for møter og samarbeid.
### 32-bit and 64-bit editions
- Windows 11 finnes kun i 64-bit
- Windows 10 finnes i begge versjoner, men nyere enheter leveres kun med 64-bit
- 32-bit Windows blir stadig mer uvanlig

#### Hvorfor bruke 64-bit
- De fleste moderne enheter har 64-bit arkitektur
- 32-bit Windows kan ikke bruke mer enn 4 GB RAM
- 64-bit krever 64-bit drivere, produsenter lager ikke 32-bit drivere
- 64-bit Windows kjører både 32-bit og 64-bit apper
- 32-bit bør kun brukes på eldre maskinvare eller når organisasjonen fortsatt har 16-bit apper

For eldre applikasjoner anbefales virtualisering fremfor å holde fast ved 32-bit Windows.

#### Scenarios
##### Scenario 1
_Produksjonslinjer med sensitiv programvare som ikke tåler store OS‑endringer._ 

**Anbefaling: Enterprise LTSC** Gir stabilitet uten funksjonsoppgraderinger.
##### Scenario 2
_Selvstendig konsulent som reiser mye og har sensitiv kundedata på PC‑en._

**Anbefaling: Windows Pro** BitLocker og andre sikkerhetsfunksjoner beskytter data ved tap eller tyveri.
##### Scenario 3
_Bedrift med økende fjernarbeid og behov for sikre, administrerte tilkoblinger._ 

**Anbefaling: Windows Enterprise** Tilbyr avansert sikkerhet (Credential Guard, Application Guard) og gode verktøy for fjernadministrasjon.
## [Examine hardware requirements](https://learn.microsoft.com/en-us/training/modules/explore-windows-editions/4-examine-hardware-requirements)
Windows 10 og 11 har i stor grad like maskinvarekrav, og de fleste moderne bedriftmaskiner oppfyller disse uten problemer. Selv om Windows kan installeres på maskiner som ikke møter alle kravene, vil både ytelse og brukeropplevelse bli merkbart dårligere.
- Windows 11 krever moderne maskinvare som UEFI, Secure Boot, TPM 2.0
- Funksjoner som BitLocker, Hyper-V, Windows Hello og DirectStorage krever spesifikk maskinvare
- Drivere håndteres stort sett automatisk, men spesialmaskinvare kan kreve manuell installasjon
- Hyper-V støtte kan enkelt sjekkes med `systeminfo.exe`

### Windows 10
Prosessor: 1 GHz eller raskere, eller SoC
RAM: 1 GB (32‑bit) / 2 GB (64‑bit)
Lagring: 16 GB (32‑bit) / 20 GB (64‑bit)
Grafikk: DirectX 9+, WDDM 1.0
Skjerm: 800×600
Nye PC‑er leveres ikke lenger med 32‑bit Windows (fra versjon 2004)
### Windows 11
Prosessor: 1 GHz+, minst 2 kjerner, 64‑bit
RAM: 4 GB eller mer
Lagring: 64 GB eller mer
Grafikk: DirectX 12+, WDDM 2.0
Firmware: UEFI med Secure Boot
TPM: Versjon 2.0
Skjerm: 720p+, minst 9", 8‑bit farge
Internett: Påkrevd for oppdateringer
Windows 11 Home: Krever Microsoft‑konto ved førstegangsoppsett
### Feature-specific requirements
#### Windows Hello
Krever IR-kamera eller fingeravtrykkleser
#### Tofaktorautentisering
PIN, Fingeravtrykk, IR-kamera eller mobil med Wi-Fi/Bluetooth
#### Snap-layouts
Tre-kolonne-layout i Window 11 krever skjermbredde ≥ 1920px
#### Secure Boot
Krever UEFI og Microsoft-signert boot-database
#### DirectX
Noen apper krever nyere DirectX-versjoner
#### BitLocker to Go
Krever USB-minnepinne, tilgjengelig i Pro eller høyere
#### Client Hyper-V
Krever SLAT-støtte og minst 4 GB RAM, kun Pro eller høyere
#### Miracast / Windows Projection
Krever WDDM-kompatibel skjermadapter og Wi-Fi Direct
#### Wi-Fi Direct Printing
Krever Wi-Fi Direct-støtte på både PC og skriver
#### IntantGo
Kun på enheter med Connected Standby-design
#### DirectStorage
Krever NVMe og DirectX 12 GPU med Shader Model 6.0
### Device drivers
- Windows finner og installerer de fleste drivere automatisk
- Produsenter publiserer ofte sertifiserte drivere via Windows Update
- Mangler en driver, må den lastes ned fra produsentens nettsted
- Ved enkelte utrullingsmetoder må drivere være tilgjengelige under installasjonen

### Check for Hyper-V compability
For å sjekke kompatibilitet, benytt PowerShell og kjør kommandoen `systeminfo.exe` . Hvis alle Hyper-V krav viser _Yes_, kan maskinen kjøre Hyper-V rollen.
![](Pasted-image-20260119143512.png)

## [Module assessment](https://learn.microsoft.com/en-us/training/modules/explore-windows-editions/5-knowledge-check)

1. _What is the minimum RAM requirement for installing Windows 11?_
	4 gigabytes (GB)

2. _Which feature is unique to the Windows 11 Pro for Workstations edition and not found in the Windows 11 Pro edition?_
	ReFS (Resilient File System) support

3. _For a device running Windows 10 to support Client Hyper-V, which hardware feature is essential?_
	Second-level address translation (SLAT) capabilities

4. _A technical team is assessing a device for Windows 10 installation. The device has 20 GB of storage, 2 GB of RAM, and a DirectX 9 graphics card. What is the bottleneck for this installation?_
	Graphics card

5. _Your company needs a Windows edition with advanced performance and storage requirements, including support for non-volatile memory modules. Which edition should you choose?_
	Windows Pro for Workstations

6. _Which feature requires a Trusted Platform Module (TPM) version 2.0 for Windows 11 installation?_
	Windows 11 itself

7.  _A user has a device with a 1 GHz processor, 2 GB RAM, and 16 GB of storage. Can they install Windows 10 64-bit?_
	No, because the storage is insufficient for Windows 10 64-bit.

8. _Which Windows edition is designed for fixed-purpose devices like ATMs and industrial systems?_
	Windows IoT Core/Enterprise

9. _Which Windows edition is designed specifically for academic environments and offers features comparable to the Enterprise edition?_
	Windows Education

---
## [Summary](https://learn.microsoft.com/en-us/training/modules/explore-windows-editions/6-summary)
Modulen gir et samlet forståelse av de ulike Windows-utgavene, hvem de er laget for og hvilke funksjoner de tilbyr.
Den gjennomgår også formfaktorene Windows kan kjøres på, og hvilke scenarier som passer best for hver utgave. 
I tillegg ser modulen på minimumskravene for Windows 10 og 11, og hvordan man kontrollerer om en enhet støtter Hyper-V.