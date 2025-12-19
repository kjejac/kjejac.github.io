---
title: Sound problems
parent: Stuff
nav_order: 2
---

# Lydproblemer

20240817

> **Vansker med å få lyden ut på høytaler gjennom HDMI.**

Jeg har siden jeg kjøpte laptop'en, en Lenovo P52, hatt vansker med å få lyden ut på høytaler gjennom HDMI. Dette har aldri plaget meg, eller jeg har egentlig ikke tenkt noe over det. Normalt benytter jeg headset sammen med laptop'en og en stasjonær maskin når jeg vil ha lyd i rommet til f.eks. YouTube.

For en ukes tid siden fikk jeg problemer med den stasjonære maskinen, noe som gjorde at laptop'en fikk mer å gjøre. Jeg la nå merke til at lyden ikke ville ut der jeg ønsket, når jeg ønsket det. Eneste måten jeg fikk løst det på var ved å omstarte maskinen - relativt tungvindt!

Etter litt søking på nettet virket dette som et kjent problem når maskinen har NVIDIA skjermkort, i dette tilfellet et NVIDIA Quadro P2000. Jeg fant ut at driveren var gammel så oppdaterte og det fungerte i noen dager før den sluttet å sende lyden til ekstern skjerm og høytaler. Mer søking, fant en [side som beskrev hvordan en kunne omstarte drivere](https://www.benoitpatra.com/2013/12/22/no-hdmi-sound-without-os-reboot-restart-the-drivers/), men hele prosessen virket veldig omstendelig og tungvindt. Litt mer tenking og en tur innom Device Manager for å sjekke om jeg kunne finne igjen noe av det som nevnt på den siden.

Jeg tippet på at **_High Definition Audio Controller_** under **_System Devices_** kunne ha innvirkning på hvorfor valget for lyd ut på HDMI forsvant. Det eneste valget var lyd ut på høytaleren på laptop'en.

![Device Manager](./assets/devicemanager.jpg)

Tok en omstart av de to og mulighet for å velge ekstern lydkilde kom tilbake.

Tenkte at det var litt klønete å måtte inn i Device Manager hver gang dette skjer og at det må være mulig å få til noe med PowerShell. Etter et kjapt søk så ser jeg at det finnes en modul som heter _PnpDevice_ som skal kunne gjøre jobben. Installerer og leser gjennom Help for `Get-PnpDevice` før jeg starter å se om jeg kan finne og omstarte de to enhetene.

Endte til slutt opp med koden under. Den har løst problemet et par ganger til nå uten feile frem til nå. Den gir riktignok en feilmelding under kjøring uten at dette påvirker resultatet.

```pwsh
# Må kjøres med admin rettigheter
# Finn alle enhetene
$Devices = Get-PnpDevice | Where-Object { $_.Name -like 'High Def*' }

# For hver enhet, deaktiver - vent 5 sekunder og aktiver
foreach ($Device in $Devices) {
  try {
    Disable-PnpDevice -InstanceId $Device.InstanceId -Confirm:$false -ErrorAction Stop
    Start-Sleep -Seconds 5
    Enable-PnpDevice -InstanceId $Device.InstanceId -Confirm:$false -ErrorAction Stop
  } catch {
    Write-Error "Failed to disable/enable device: $_"
  }
}
```