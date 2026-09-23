---
layout: default
title: Konfigurere Autopilot
nav_order: 1
parent: Konfigurere Enrollment Status siden
has_children: false
nav_exclude: false
has_toc: false
tags:
  - MD-102
  - MD-102/Lab
  - "#Lab"
  - MD-102/Autopilot
  - MD-102/Intune
---
# Konfigurere Autopilot

## Forutsetninger

- En Autopilot Deployment Profile
- En enhet registrert i Autopilot (VM eller fysisk)
- En gruppe som inneholder Autopilot‑enheter
- ESP‑profil

## Refleksjon

Autopilot‑oppsettet er grunnlaget for hele utrullingsløpet i MD‑102, og alt som skjer senere i ESP, IME og sikkerhetspolicyer avhenger av at dette steget er riktig konfigurert. Oppgaven viser hvordan Deployment Profile, Device Preparation og gruppetildeling må henge sammen for at enheten skal få en forutsigbar og stabil onboarding.

Jeg fikk en forståelse av forskjellen mellom User‑driven og Self‑deploying mode. I denne laben brukes User‑driven, siden Self‑deploying krever TPM 2.0 og spesifikke maskintyper, og ikke fungerer i mitt VM‑miljø. Dette forteller meg hvor tett Autopilot er knyttet til maskinvarekrav og OOBE‑flyten.

Prosessen med å registrere en test‑enhet, enten via “Convert to Autopilot” eller ved å importere hardware hash manuelt, viser hvorfor du oppretter ZTDId‑grupper. Den dynamiske regelen sørger for at enheten automatisk får Deployment Profile, ESP og Device Preparation Assignments. Dette automatiserer hele utrullingen og eliminerer manuelle feil.

Fallgruvene som beskrives i oppgaven, spesielt behovet for å slette cache under `c:\\windows\\provisioning\\autopilot` når OOBE‑innstillinger endres, viser hvordan Autopilot lagrer tidligere konfigurasjoner lokalt. Dette forenklet feilsøkingen under oppsettet.

Samlet sett viser oppgaven hvordan Autopilot fungerer som en orkestreringsmotor som binder sammen enhetsregistrering, OOBE‑opplevelsen, Device Preparation og ESP. Når dette steget er riktig satt opp, blir resten av utrullingsløpet stabilt og forutsigbart.

## Verifiseringer

- Bekreft at enheten dukker opp under Windows Autopilot devices i Intune. Status skal vise Assigned under Deployment Profile.
- Kontroller at enheten havner i ZTDId‑gruppen (dynamisk regel). Dette bekrefter at hardware hash er korrekt importert og at Autopilot‑løpet starter automatisk.
- Under Device Preparation policies skal enheten vises som inkludert i riktig Device group. Deployment Profile, ESP og Device Preparation skal alle være User‑driven for denne laben.
- Start OOBE på testmaskinen og bekreft at Autopilot‑profilen lastes (navn, språk, skip‑options). Entra‑innlogging skal være første steg i User‑driven mode.
- Når OOBE fullføres, skal enheten være Entra‑joined og automatisk MDM‑registrert i Intune.

## Vanlige feil og feilsøking

_Feil:_ Enheten dukker ikke opp i Autopilot‑listen<br>
_Årsak:_ Hardware hash ikke importert, feil filformat, eller import ikke ferdig<br>
_Løsning:_ Vent 5–15 min, sjekk Devices > Windows > Device onboarding > Enrollment > Devices

_Feil:_ Enheten havner ikke i ZTDId‑gruppen<br>
_Årsak:_ Hardware hash mangler ZTDId‑tag<br>
_Løsning:_ Sjekk CSV‑filen, importer på nytt

_Feil:_ OOBE viser ikke Autopilot‑profilen<br>
_Årsak:_ Profilen er ikke tildelt en statisk gruppe med minst én enhet<br>
_Løsning:_ Tildel profilen til en gruppe som inneholder enheten

_Feil:_ User‑driven fungerer ikke i VM<br>
_Årsak:_ TPM 2.0 mangler eller er deaktivert<br>
_Løsning:_ Bruk User‑driven (ikke Self‑deploying), aktiver TPM i Hyper‑V

_Feil:_ OOBE viser gamle innstillinger<br>
_Årsak:_ Autopilot‑cache lagres lokalt<br>
_Løsning:_ Slett c:\\windows\\provisioning\\autopilot (som beskrevet i fallgruver)

_Feil:_ Enheten stopper i OOBE<br>
_Årsak:_ Nettverksproblemer eller manglende tilgang til Autopilot‑endepunkter<br>
_Løsning:_ Test nettverk, proxy, SSL‑inspection


## Autopilot Deployment Profile

`Intune admin center > Devices > Windows devices > Device onboarding > Enrollment > Deployment profiles`

Ny profil:
- Join type: Entra join
- User account type: Standard
- Skip-option: Privacy, EULA etc.
- User account type 
- Language
- Device name template (`phoney-%RAND:3%`)

> NOTE!
> For å knytte profilen til en gruppe må det opprettes en statisk gruppe for enheter med minst en enhet
> HUSK!
> Owner må settes til `Intune Provisioning Client`

`Intune admin center > Devices > Windows devices > Device onboarding > Enrollment > Device Preparation policies`

- Create `User Driven`: 
	- Basic: navn og beskrivelse
	- Device group: tidligere opprettet, bestemmer hvilke enheter som skal onboardes av Device prep policy
	- Configuration settings
		- OOBE
		- Apps
	- Scope tags (benyttes delegert administrasjon, rbac, msp, multi-tenant, begrense adminroller)
	- Assignments: dynamisk gruppe, bestemmer hvilke enheter som skal få policy dist. fra Intune regelen: `(device.devicePhysicalIds -any (_ -contains "ZTDId"))`


_User‑driven Autopilot Deployment Profile_. Device Preparation må _matche_ denne profilen
- Deployment profile = User‑driven    
- Device Preparation = User‑driven
- ESP = User‑driven scope

_Automatic:_
- Self‑deploying mode
- Ingen brukerinnlogging i OOBE
- Begrenset funksjonalitet
- Krever TPM 2.0 og spesifikke maskintyper
- Ikke kompatibelt med test‑VM
- Ikke kompatibelt med MD‑102‑oppgavene du skal gjennom

## Registrere en test-enhet

To alternativer:
- _Convert to Autopilot_ på en eksisterende Intune-enhet
- _Import hardware hash_ manuelt

### Import hardware hash 
Brukes når maskinen er helt ren VM/fysisk maskin som står i OOBE.

Maskinen vil få en gyldig Autopilot-registrering og havner i ZTDId-gruppen (dynamisk) som dermed starter hele Autopilot-løpet.

#### Kommandoline i OOBE

Stegene under gjelder for Hyper V. 

For Virtualbox kan Drag&Drop benyttes.
Se [VirtualBox-setup](VirtualBox-setup.md)

`Shift + F10`

#### Lag folder for hardware hash
```PowerShell
md C:\HWID
```

#### Generer hardware hash
```PowerShell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
Install-PackageProvider -Name NuGet -Confirm:$false -Force
Install-Script -Name Get-WindowsAutoPilotInfo -Force
New-item -ItemType Directory -Name HWID -Path C:\
Get-WindowsAutoPilotInfo -OutputFile C:\HWID\AutopilotHWID.csv
```

#### Kopier filen fra VM

Stegene under gjelder for Hyper V. For Virtualbox kan Drag&Drop benyttes.

På host 

```PowerShell
New-VHD -Path "c" -SizeBytes 100MB -Dynamic
Mount-VHD "C:\AutopilotExport.vhdx"
Initialize-Disk -Number 2 -PartitionStyle MBR
New-Partition -DiskNumber 2 -UseMaximumSize -AssignDriveLetter
Format-Volume -DriveLetter E -FileSystem NTFS -NewFileSystemLabel Export
Add-VMHardDiskDrive -VMName "Lab02" -Path "D:\VHDs\NewDisk.vhdx"
```

På VM

```PowerShell
copy C:\HWID\AutopilotHWID.csv E:\
Dismount-VHD "C:\AutopilotExport.vhdx"
```

Remove from VM

På host
```PowerShell
Mount-VHD "C:\AutopilotExport.vhdx"
# Copy to  local disk
Dismount-VHD -Path "C:\AutopilotExport.vhdx"
```

### Importerer filen til Intune

![](assets/AutopilotHWID.csv)

- `Devices > Windows > Device onboarding > Enrollment > Devices`
- Import
- Kan ta opptil 15 før enheten dukker opp

Enheten skal nå dukke opp i Autopilot-listen. Den havner automatisk i ZTDId-gruppen og får Deployment Profile, ESP og Device Preparation Assignments

Husk Sysprep og Checkpoint

## Kjør OOBE på testmaskin

Når enheten får viser _Assigned_ under Profile status i `Windows Autopilot devices` kan enheten starte opp.

Fallgruver: Hvis OOBE endres i Deployment Profiles må cache under `c:\windows\provisioning\autopilot` slettes.
