---
layout: default
title: Endre språk‑, region‑ og keyboard‑innstillinger
nav_order: 2
parent: Konfigurere Enrollment Status siden
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
  - MD-102/ESP
  - MD-102/Intune
  - MD-102/PowerShell
  - MD-102/IntunePolicy
  - MD-102/Time
---
# Endre språk‑, region‑ og keyboard‑innstillinger

## Mål
Endre språk‑, region‑ og tastaturinnstillinger på en Windows‑enhet ved hjelp av et PowerShell‑script levert av Intune Management Extension (IME).

## Refleksjon

I denne oppgaven fikk jeg endelig klarhet i hvordan språk‑, region‑ og tastaturinnstillinger håndteres i en Autopilot‑utrulling. Intune og ESP konfigurerer ikke disse innstillingene, ESP viser bare det som allerede ligger i ISO‑ og OOBE‑oppsettet. Derfor må slike endringer gjøres etter enrollment, og IME blir den eneste leveringsmotoren som kan konfigurere dem.

Oppgaven viste hvorfor skriptet må kjøres med “Run using logged‑on credentials = Yes”. Endringene skjer i HKCU og påvirker brukerens språk‑ og tastaturprofil, ikke systemets. Dette forklarer hvorfor skriptet ikke fungerer hvis det kjøres som systemkonto.

Jeg fikk også innsikt i hvordan språkpakker leveres i Windows. Scriptet installerer norsk språkpakke via DISM, setter norsk som primært språk i LanguageList, endrer tastatur, fjerner US‑layout, og oppdaterer både system locale og regional format. Dette gir en komplett norsk konfigurasjon, samtidig som en-US beholdes som display language.

Feilsøkingen i VirtualBox var spesielt lærerik. IME klarte ikke å hente ned scriptet fordi WinHTTP‑autodetection feilet med 12180. Dette skyldtes at VM‑en brukte NAT/Host‑only som primær NIC, som mangler gateway, DNS‑forwarding og WPAD. Når jeg endret til Bridged Adapter, fikk IME korrekt nettverksbinding og skriptet ble levert som forventet. Dette viste hvor sensitiv IME er for nettverksbindinger og hvor viktig riktig NIC‑valg er i VM‑miljøer.

Samlet sett ga oppgaven en praktisk forståelse av hvordan IME fungerer som leveringsmotor for klientinnstillinger som Intune ikke støtter, og hvordan språk‑ og regionkonfigurasjon må håndteres i etterkant av enrollment. 

## Verifiseringer

Bekreft at skriptet er lastet ned av IME under `C:\\ProgramData\\Microsoft\\IntuneManagementExtension\\Logs.`  
Se etter at skriptet kjører som “logged‑on credentials” i Intune‑loggene.

Kontroller at norsk språkpakke er installert ved å kjøre `Get‑WindowsCapability -Online | findstr Language`.

Bekreft at LanguageList er oppdatert med nb‑NO som primært språk ved å kjøre `Get‑WinUserLanguageList`.

Sjekk at tastaturlayout er endret til Norwegian og at US‑layout er fjernet.

Verifiser at system locale og regional format er satt til norsk (nb‑NO).

Kontroller at 24‑timers klokke er aktivert i `Settings > Time & language > Language & region`.

## Vanlige feil og hvordan de løses

_Feil:_ Skriptet kjører ikke<br>
_Årsak:_ “Run using logged‑on credentials” er satt til No<br>
_Løsning:_ Endre til Yes og kjør enheten gjennom en ny sync

_Feil:_ Norsk språkpakke installeres ikke<br>
_Årsak:_ Maskinen mangler nettverkstilkobling til Windows Update<br>
_Løsning:_ Test med DISM /Online /Get-Capabilities og bekreft nettverk

_Feil:_ Tastaturlayout endres ikke<br>
_Årsak:_ Skriptet kjøres som SYSTEM og endrer ikke HKCU<br>
_Løsning:_ Sørg for at skriptet kjører som logged‑on user

_Feil:_ US‑layout kommer tilbake etter restart<br>
_Årsak:_ LanguageList ikke oppdatert riktig<br>
_Løsning:_ Kjør Set-WinUserLanguageList med -Force

_Feil:_ IME klarer ikke å hente ned skriptet<br>
_Årsak:_ WinHTTP‑autodetection feiler (12180) i VM‑miljø<br>
_Løsning:_ Bruk Bridged Adapter i stedet for NAT/Host‑only

_Feil:_ Klokkeformat endres ikke<br>
_Årsak:_ Registry‑endringen krever logoff/logon<br>
_Løsning:_ Logg ut og inn igjen etter skriptkjøring<br>
Problemet skyldtes _nettverksbinding i VirtualBox_, ikke Intune eller scriptet. Når bridged mode ble aktivert og host‑only/NAT ble fjernet, fikk IME korrekt WinHTTP‑binding og kunne hente ned script‑policyen.

## Steg for steg

```powershell
# ---------------------------------------------------------
# Norsk språkpakke + norsk region + norsk tastatur
# Beholder en-US som display language
# Intune IME-kompatibelt
# ---------------------------------------------------------

Write-Output "Starter norsk språk- og regionkonfigurasjon..."

# ---------------------------------------------------------
# 1. Sjekk om norsk språkpakke finnes
# ---------------------------------------------------------

$nbInstalled = (Get-WinUserLanguageList | Where-Object { $_.LanguageTag -eq "nb-NO" }).Count -gt 0
$nbBasicCap = (Get-WindowsCapability -Online | Where-Object { $_.Name -like "Language.Basic~~~nb-NO*" -and $_.State -eq "Installed" })

if ($nbBasicCap) {
    Write-Output "Norsk språkpakke er allerede installert."
} else {
    Write-Output "Norsk språkpakke mangler. Installerer..."
    dism /online /add-capability /capabilityname:Language.Basic~~~nb-NO~0.0.1.0

    # Installer OCR og Handwriting hvis ønskelig
    # dism /online /add-capability /capabilityname:Language.OCR~~~nb-NO~0.0.1.0
    # dism /online /add-capability /capabilityname:Language.Handwriting~~~nb-NO~0.0.1.0

    $global:NeedsReboot = $true
}

# ---------------------------------------------------------
# 2. Behold en-US som display language
# ---------------------------------------------------------

Write-Output "Beholder en-US som display language."

# ---------------------------------------------------------
# 3. Sett norsk som primært språk i LanguageList
# ---------------------------------------------------------

Write-Output "Setter norsk som primært språk i LanguageList..."

$LangList = New-WinUserLanguageList -Language "nb-NO"
$LangList.Add("en-US")
Set-WinUserLanguageList $LangList -Force

# ---------------------------------------------------------
# 4. Sett norsk tastatur som default
# ---------------------------------------------------------

Write-Output "Setter norsk tastatur som default..."
Set-WinDefaultInputMethodOverride -InputMethodID "0409:00000414"

# ---------------------------------------------------------
# 5. Fjern US keyboard
# ---------------------------------------------------------

Write-Output "Fjerner US keyboard hvis det finnes..."

$CurrentLangs = Get-WinUserLanguageList
foreach ($lang in $CurrentLangs) {
    if ($lang.InputMethodTips -contains "0409:00000409") {
        Write-Output "Fjerner US-QWERTY fra $($lang.LanguageTag)"
        $lang.InputMethodTips.Remove("0409:00000409")
    }
}
Set-WinUserLanguageList $CurrentLangs -Force

# ---------------------------------------------------------
# 6. Sett norsk locale (system locale)
# ---------------------------------------------------------

Write-Output "Setter system locale til nb-NO..."
Set-WinSystemLocale -SystemLocale "nb-NO"

# ---------------------------------------------------------
# 7. Sett norsk regional format
# ---------------------------------------------------------

Write-Output "Setter norsk regional format..."
Set-Culture -CultureInfo "nb-NO"

# ---------------------------------------------------------
# 8. Sett norsk dato- og tidsformat
# ---------------------------------------------------------

Write-Output "Setter norsk dato- og tidsformat..."

Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sShortDate" -Value "dd.MM.yyyy"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sLongDate" -Value "d. MMMM yyyy"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sShortTime" -Value "HH:mm"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sTimeFormat" -Value "HH:mm:ss"

# ---------------------------------------------------------
# 9. Reboot hvis språkpakke ble installert
# ---------------------------------------------------------

if ($global:NeedsReboot) {
    Write-Output "Språkpakke ble installert. En omstart er nødvendig."
    Write-Output "Starter omstart..."
    Restart-Computer -Force
} else {
    Write-Output "Ingen omstart nødvendig."
}

Write-Output "Norsk språk, region og tastatur er ferdig konfigurert."
```
Opprett en [`.ps1-fil`](assets/LocalRegionKeyboard24H.ps1).

Last opp skriptet til Intune `Devices > Windows > Scripts and remediations > Scripts`
Det er viktig at policyen settes til `Run using logged‑on credentials = Yes` da endringene som gjøres er for `Current User (HKCU)`!

Policyen vil nå tre i kraft ved:
- neste innlogging
- neste sync

### VirtualBox debug: Intune-script kjørte ikke

Målet var å kjøre et PowerShell‑script via Intune for å endre tidsformatet til 24‑timer. Scriptet var korrekt konfigurert, brukeren var i riktig gruppe, og IME (Intune Management Extension) var installert. Likevel ble scriptet aldri levert, og både _User status_ og _Device status_ var tomme.

Loggene avslørte hovedfeilen, I _AgentExecutor.log_ dukket det opp to kritiske linjer:

> _DNS detection: WinHttpGetProxyForUrl call failed because of error 12180_ _DHCP detection: WinHttpGetProxyForUrl call failed because of error 12180_

Feilkode _12180_ betyr at WinHTTP ikke klarer å gjøre autodetection av proxy via nettverksadapteren. Dette stopper IME fra å hente ned _alle_ PowerShell‑scripts og Win32‑apper.

Dette er en _nettverksbindingsfeil_, ikke en Intune‑feil.

VirtualBox‑nettverket er satt opp med
- _NAT‑adapter_
- _Host‑only adapter_

Begge disse kan bli valgt som “primary NIC” av Windows, og de mangler:

- gateway
- DNS‑forwarding
- DHCP‑proxy‑autodetection
- WPAD
- korrekt WinHTTP‑binding

Resultatet er at IME prøver autodetection via en NIC som _ikke har internett‑ruting_, og dermed feiler med 12180, noe som er en kjent begrensning i VirtualBox.

Løsningen ble å endre nettverksmodus ved å: 

1. _Slå av VM_
2. _Disable alle adaptere unntatt én_
3. _Sette Adapter 1 til Bridged Adapter_
4. Velge riktig fysisk NIC (Wi‑Fi/Ethernet)
5. Sikre at VM får ekte DHCP‑adresse fra LAN
6. Kjør IME‑agenten manuelt for å trigge sync


Etter dette begynte IME å:
- hente policyer
- kjøre WinGet‑deteksjon
- laste ned scriptet
- kjøre scriptet i HKCU
- endre tidsformatet som forventet