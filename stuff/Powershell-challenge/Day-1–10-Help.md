---
title: Help
nav_order: 4
parent: PowerShell Challenge
has_children:
---

# Hjelp-systemet

Hjelpesystemet til PowerShell kan deles opp i tre forskjellige cmdlets: `Get-Help`, `Get-Command` og `Get-Member`
- [`Get-Help`](stuff/Powershell-challenge/Day-1–10-Help.md#Get-Help) – Gir en detaljert beskrivelse av cmdlets, parametere, eksempler og konseptuelle PowerShell-emner
- [`Get-Command`](stuff/Powershell-challenge/Day-1–10-Help.md#Get-Command) – Lar deg med å finne og utforske tilgjengelige kommandoer, inkludert cmdlets, aliaser og skript
- [`Get-Member`](stuff/Powershell-challenge/Day-1–10-Help.md#Get-Member)  – Viser detaljer om objektene som returneres av en kommando, inkludert deres egenskaper og metoder.

Når du sitter i PowerShell så benyttes kommandoene slik:
- Bruk [`Get-Command`](stuff/Powershell-challenge/Day-1–10-Help.md#Get-Command) for å finne riktig kommando.
- Bruk [`Get-Help`](stuff/Powershell-challenge/Day-1–10-Help.md#Get-Help) for å forstå hvordan en kommando fungerer.
- Bruk [`Get-Member`](stuff/Powershell-challenge/Day-1–10-Help.md#Get-Member) for å undersøke egenskapene til objektene som kommando returnerer.

### Stoppe og starte en tjeneste med PowerShell
-Hvis tjenesten `Spooler` har hengt seg, kan du bruke PowerShell til å stoppe og starte den på nytt. I denne prosessen vil `Get-Command`**,** `Get-Help` **og** `Get-Member` hjelpe deg med å finne riktig cmdlet, forstå kommandoens bruk og utforske tjenesteobjektet.

For å gjøre dette må du finne ut:
1️⃣Hvilken cmdlet brukes for å finne tjenester?
2️⃣Hvordan kan du bruke cmdleten riktig?
3️⃣Hvilke metoder brukes for å stoppe og starte tjenesten?

#### Finn tjenesten
Task Manager har en 'Services'-fane som kan gi hint om riktig cmdlet. PowerShell cmdlets følger et `verb-substantiv`-navnesystem, der kommandoene er i entall. 
Ved å benytte `Get-Command` kan vi søke etter kommandoer, enten ved hele eller deler av navnet. Vi forsøker med substantivet `Service*`, etterfulgt av jokertegnet 

```powershell
Get-Command -Noun Service*

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Debug-ServiceFabricNodeStatus                      1.0.0.0    NetworkControllerDiagnostics
Cmdlet          Get-Service                                        7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          New-Service                                        7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Remove-Service                                     7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Restart-Service                                    7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Resume-Service                                     7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Set-Service                                        7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Start-Service                                      7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Stop-Service                                       7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Suspend-Service                                    7.0.0.0    Microsoft.PowerShell.Management
```
Listen som returneres inneholder flere cmdlets, men vi vet at vi ønsker å hente informasjon om en tjeneste og velger `Get-Service`.

#### Lær hvordan kommandoen brukes
Nå som vi hvilken kommando vi ønsker å bruke må vi forstå hvordan den fungerer. Dette gjør vi ved å benytte `Get-Help`
```powershell
Get-Help Get-Service -Detailed

NAME
    Get-Service

SYNOPSIS
    Gets the services on the computer.


SYNTAX
    Get-Service [-DependentServices] -DisplayName <System.String[]> [-Exclude <System.String[]>] [-Include <System.String[]>] [-RequiredSer
    vices] [<CommonParameters>]

    Get-Service [-DependentServices] [-Exclude <System.String[]>] [-Include <System.String[]>] [-InputObject <System.ServiceProcess.Service
    Controller[]>] [-RequiredServices] [<CommonParameters>]

    Get-Service [[-Name] <System.String[]>] [-DependentServices] [-Exclude <System.String[]>] [-Include <System.String[]>] [-RequiredServic
    es] [<CommonParameters>]


DESCRIPTION
    > This cmdlet is only available on the Windows platform. The `Get-Service` cmdlet gets objects that represent the services on a compute
    r, including running and stopped services. By default, when `Get-Service` is run without parameters, all the local computer's services
    are returned.

    You can direct this cmdlet to get only particular services by specifying the service name or the display name of the services, or you c
    an pipe service objects to this cmdlet.
...
```
Ved lese gjennom hjelpfilen lærer du hvordan en kommando brukes. Vi ser at for å hente tjenesten kan kommandoen `Get-Service -Name Spooler` benyttes. 

#### Utforske tjenesteobjektet
Selv om dette ikke er strngt tatt nødvendig for å fulleføre oppgaven, gir det innsikt i alternative metoder. 
`Get-Service` returnerer et ServiceController-objekt, og `Get-Member` lar deg se hvilke egenskaper og metoder som er tilgjengelige for dette objektet. Dette kan hjelpe deg med å forstå: 
- **Tilgjengelige metoder** – Du får bekreftet at metoder som `Start()` og `Stop()` eksisterer. 
- **Egenskaper** – Du ser hvilke data du kan hente ut, som `Status`, `ServiceType` og `DependentServices`


```PowerShell
Get-Service -Name Spooler | Get-Member

   TypeName: System.Service.ServiceController#StartupType

Name                      MemberType    Definition
----                      ----------    ----------
Name                      AliasProperty Name = ServiceName
RequiredServices          AliasProperty RequiredServices = ServicesDependedOn
Disposed                  Event         System.EventHandler Disposed(System.Object, System.EventArgs)
Close                     Method        void Close()
Continue                  Method        void Continue()
Dispose                   Method        void Dispose(), void IDisposable.Dispose()
Equals                    Method        bool Equals(System.Object obj)
ExecuteCommand            Method        void ExecuteCommand(int command)
GetHashCode               Method        int GetHashCode()
GetLifetimeService        Method        System.Object GetLifetimeService()
GetType                   Method        type GetType()
InitializeLifetimeService Method        System.Object InitializeLifetimeService()
Pause                     Method        void Pause()
Refresh                   Method        void Refresh()
Start                     Method        void Start(), void Start(string[] args)
Stop                      Method        void Stop(), void Stop(bool stopDependentServices)
WaitForStatus             Method        void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus), void WaitForStatu…
BinaryPathName            Property      System.String {get;set;}
CanPauseAndContinue       Property      bool CanPauseAndContinue {get;}
CanShutdown               Property      bool CanShutdown {get;}
CanStop                   Property      bool CanStop {get;}
Container                 Property      System.ComponentModel.IContainer Container {get;}
DelayedAutoStart          Property      System.Boolean {get;set;}
DependentServices         Property      System.ServiceProcess.ServiceController[] DependentServices {get;}
Description               Property      System.String {get;set;}
DisplayName               Property      string DisplayName {get;set;}
MachineName               Property      string MachineName {get;set;}
ServiceHandle             Property      System.Runtime.InteropServices.SafeHandle ServiceHandle {get;}
ServiceName               Property      string ServiceName {get;set;}
ServicesDependedOn        Property      System.ServiceProcess.ServiceController[] ServicesDependedOn {get;}
ServiceType               Property      System.ServiceProcess.ServiceType ServiceType {get;}
Site                      Property      System.ComponentModel.ISite Site {get;set;}
StartType                 Property      System.ServiceProcess.ServiceStartMode StartType {get;}
StartupType               Property      Microsoft.PowerShell.Commands.ServiceStartupType {get;set;}
Status                    Property      System.ServiceProcess.ServiceControllerStatus Status {get;}
UserName                  Property      System.String {get;set;}
ToString                  ScriptMethod  System.Object ToString();
```


Med `Get-Member` kan du se metodene og egenskapene i tjenesteobjektet, inkludert `Stop()` og `Start()`. Hvis du ønsker mer kontroll, kan du bruke tjenesteobjektet direkte:
```powershell
$service = Get-Service -Name Spooler
$service.Stop()   # Stopper tjenesten
$service.Start()  # Starter tjenesten igjen
```
Dette gir samme resultat som `Stop-Service` og `Start-Service`, men lar deg jobbe direkte med objektet.

#### Starte og stoppe Spooler-tjenesten
Når du har lært hvordan du bruker kommandoene `Get-Service`, `Stop-Service` og `Start-Service` kan du stoppe og starte tjenesten
```powershell
Stop-Service -Name Spooler
Start-Service -Name Spooler
```
Kommandoene returnerer ikke status. Benytte `Get-Service` for så se endringer.

## Get-Command

Det finnes tusenvis kommandoer, men antallet varierer avhengig av installerte moduler på din maskin. Du kan sjekke antallet på din maskin med `(Get-Command -CommandType Cmdlet).Count`. Jeg har mange tusen installert på min maskin, og det sier seg selv at det er umulig å huske navnet på den enkelte kommando. 

`Get-Command` søker i alle kommandoer, inkludert cmdlets, aliaser, funksjoner, filter, skript og eksterne applikasjoner. Den henter kommandoene fra PowerShell-moduler og kommander som er installert på systemet, samt de som ble importert fra tidligere sesjoner. For å begrense resultatene til kun de kommandoene som er aktivt importert i gjeldende PowerShell-sesjon, benyttes parameteren `-ListImported`.

Resultatet fra** `Get-Command` kan være omfattende, og det kan være utfordrende å finne akkurat den informasjonen man trenger. For å få mest mulig relevant svar fra søket, er det viktig å forstå hvordan de ulike [parameterne](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command?view=powershell-7.5#parameters) fungerer for å skille ut det som ikke er relevant for søket.

Eksemplene som følger er tatt direkte [hjelpefilen](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command?view=powershell-7.5#examples) til `Get-Command`, jeg har valgt ut de jeg finner mest nytte av.

```powershell
Get-Command
```
Lister ut alle kommandoer, inkludert cmdlets, aliaser og funksjoner som er installert på maskinen.

```powershell
Get-Command -ListImported

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Clear-WUJob                                        2.2.1.5    PSWindowsUpdate
Alias           Download-WindowsUpdate                             2.2.1.5    PSWindowsUpdate
Alias           Get-WUInstall                                      2.2.1.5    PSWindowsUpdate
...
Function        Add-PoshGitToProfile                               1.1.0      posh-git
Function        Clear-Host
Function        ConvertFrom-RomanNumeral                           3.2        PowerShellHumanizer
...
Cmdlet          Add-Content                                        7.0.0.0    Microsoft.PowerShell.Management
Cmdlet          Add-History                                        7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          Add-Member                                         7.0.0.0    Microsoft.PowerShell.Utility
```
Returnerer bare alle kommandoer som er aktive i gjeldende sesjon. Eksemplet viser at det er returnert aliaser, funksjoner og cmdlets.

```powershell
Get-Command -Type Cmdlet | Sort-Object -Property Noun | Format-Table -GroupBy Noun

   Noun: WUSettings

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Set-WUSettings                                     2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUSettings                                     2.2.1.5    PSWindowsUpdate

   Noun: Xml

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Select-Xml                                         7.0.0.0    Microsoft.PowerShell.Utility
Cmdlet          ConvertTo-Xml                                      7.0.0.0    Microsoft.PowerShell.Utility
```
Her benyttes parameteret `-Type` for kun å returnere _cmdlets_. I tillegg er de sortert og gruppert etter substantivet, noe som kan gjøre det enklere å finne relevante cmdlets for en oppgave.

```powershell
Get-Command -Module Microsoft.PowerShell.Security

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          ConvertFrom-SecureString                           7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          ConvertTo-SecureString                             7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-Acl                                            7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-AuthenticodeSignature                          7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-CmsMessage                                     7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-Credential                                     7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-ExecutionPolicy                                7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Get-PfxCertificate                                 7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          New-FileCatalog                                    7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Protect-CmsMessage                                 7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Set-Acl                                            7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Set-AuthenticodeSignature                          7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Set-ExecutionPolicy                                7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Test-FileCatalog                                   7.0.0.0    Microsoft.PowerShell.Security
Cmdlet          Unprotect-CmsMessage                               7.0.0.0    Microsoft.PowerShell.Security
```
For å finne alle kommandoene en modul har benyttes parameteret `-Module` etterfulgt av et eller flere modulnavn.
For å vise alle kommandoene som tilhører en bestemt modul, brukes parameteren `-Module` etterfulgt av navnet på modulen. Dette gir en oversikt over alle kommandoer som modulen inneholder. Det er også mulig å angi flere modulnavn, skilt med `,`.

```powershell
Get-Command Get-AppLockerPolicy

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-AppLockerPolicy                                1.0        AppLocker
```
For å få mer informasjon om en bestemt kommando, for eksempel `Get-AppLockerPolicy`, kan du skrive kommandoens navn direkte etter `Get-Command`. I tillegg til å vise informasjonen om cmdleten som vist i eksemplet. Hvis kommandoen som importeres tilhører en modul ikke er alleree er importert, vil PowerShell automatisk importere modulen i sesjonen. Dette tilsvarer bruken av kommandoen `Import-Module`. 

```powershell
Get-Command  -Name Get-ChildItem -Syntax

Get-ChildItem [[-Path] <string[]>] [[-Filter] <string>] [-Include <string[]>] [-Exclude <string[]>] [-Recurse] [-Depth <uint>] [-Force] [-Name] [-Attributes <FlagsExpression[FileAttributes]>] [-FollowSymlink] [-Directory] [-File] [-Hidden] [-ReadOnly] [-System] [<CommonParameters>]

Get-ChildItem [[-Filter] <string>] -LiteralPath <string[]> [-Include <string[]>] [-Exclude <string[]>] [-Recurse] [-Depth <uint>] [-Force] [-Name] [-Attributes <FlagsExpression[FileAttributes]>] [-FollowSymlink] [-Directory] [-File] [-Hidden] [-ReadOnly] [-System] [<CommonParameters>]


Get-Command  -Name Get-ChildItem -Args Cert: -Syntax

Get-ChildItem [[-Path] <string[]>] [[-Filter] <string>] [-Include <string[]>] [-Exclude <string[]>] [-Recurse] [-Depth <uint>] [-Force] [-Name] [-CodeSigningCert] [-DocumentEncryptionCert] [-SSLServerAuthentication] [-DnsName <string>] [-Eku <string[]>] [-ExpiringInDays <int>] [<CommonParameters>]

Get-ChildItem [[-Filter] <string>] -LiteralPath <string[]> [-Include <string[]>] [-Exclude <string[]>] [-Recurse] [-Depth <uint>] [-Force] [-Name] [-CodeSigningCert] [-DocumentEncryptionCert] [-SSLServerAuthentication] [-DnsName <string>] [-Eku <string[]>] [-ExpiringInDays <int>] [<CommonParameters>]
```
For å vise den generelle syntaksen for en kommando benyttes parameteret `-Syntax`. Det er mulig å legge til `-Args Cert:` for å inkludere eventuelle dynamiske parametere som kun er tilgjengelig når `Get-ChildItem` brukes i `Cert:`-provideren.

```powershell
Get-Command -ParameterName *Auth* -ParameterType AuthenticationMechanism

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Connect-PSSession                                  7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          Enter-PSSession                                    7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          Get-PSSession                                      7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          Invoke-Command                                     7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          New-PSSession                                      7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          New-PSSessionOption                                7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          Receive-PSSession                                  7.5.0.500  Microsoft.PowerShell.Core
Cmdlet          Start-Job                                          7.5.0.500  Microsoft.PowerShell.Core
```
Hvis du leter etter en kommando som inneholder et spesifikt parameter, kan du bruke `-ParameterName`. Navnet kan inkludere jokertegn både foran og bak for mer fleksible søk. For å filtrere resultatene ytterligere, kan du også spesifisere** `-ParameterType`, slik at du kun får parametere av en bestemt type, selv om de har lignende navn.

```powershell
Get-Command -Name dir

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           dir -> Get-ChildItem


Get-Command -Name dir -Syntax
dir (alias) -> Get-ChildItem

dir [[-Path] <string[]>] [[-Filter] <string>] [-Include <string[]>] [-Exclude <string[]>] [-Recurse] [-Depth <uint>] [-Force] [-Name] [-Attributes <FlagsExpression[FileAttributes]>] [-FollowSymlink] [-Directory] [-File] [-Hidden] [-ReadOnly] [-System] [<CommonParameters>]

dir [[-Filter] <string>] -LiteralPath <string[]> [-Include <string[]>] [-Exclude <string[]>] [-Recurse] [-Depth <uint>] [-Force] [-Name] [-Attributes <FlagsExpression[FileAttributes]>] [-FollowSymlink] [-Directory] [-File] [-Hidden] [-ReadOnly] [-System] [<CommonParameters>]

```
Hvis du kommer borti et _alias_ og du ikke kjenner det egentlige kommandonavnet, kan `Get-Command` hjelpe deg å finne den tilknyttede kommandoen. Legger du til `-Syntax`  vil du i tillegg vil du få en oversikt over tilgjengelige parametere og hvordan kommandoen kan brukes.

```powershell
(Get-Command get-date).ModuleName
Microsoft.PowerShell.Utility


Get-Command Get-Date | Get-Member
   TypeName: System.Management.Automation.CmdletInfo
Name                MemberType     Definition
----                ----------     ----------
...
HelpFile            Property       string HelpFile {get;}
ImplementingType    Property       type ImplementingType {get;}
Module              Property       psmoduleinfo Module {get;}
ModuleName          Property       string ModuleName {get;}
...
```
Hvis ønsker å søke opp hvilken modul en kommando tilhører, kan du bruke `ModuleName` egenskapen til kommandoen. Du kan se alle egenskapene til en kommando ved å pipe den til `Get-Member` , som gir en oversikt over alle tilgjengelige egenskaper og metoder.

Dette er noen eksempler på hvordan du kan bruke parameterene til `Get-Command`. En fullstendig oversikt over parameterene finner du i [hjelpefilen](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command?view=powershell-7.5#examples) til kommandoen.

## Get-Help

PowerShell har et godt utbygd hjelpesystem, `Get-Help` som vil gi en forklaring på PowerShell konsepter og kommandoer. `Get-Help` gir informasjon om cmdlets, funksjoner, Common Information Model (CIM) kommandoer, arbeidsflyter, providers, aliaser og skript.

En nyinstallert PowerShell versjon inkluderer ikke lokale hjelpefiler, og du må laste ned med kommandoen `Update-Help` 
```powershell
Update-Help -UICulture en-US -Force
```
Det er normalt å få feilmeldinger etter `Update-Help`, da ikke alle moduler har oppdaterte hjelpefiler.

Ønsker du hjelpfiler på et annet språk, for eksempel norsk bytter du ut `-UICulture en-US` med `-UICulture nb-NO -Force`. Mange hjelpefiler er ikke oversatt og `en-US` kan være nødvendig da `nb-NO`kan gi begrenset informasjon.

Vil du se en beskrivelse av hva `Get-Help` kan gjøre, parametere som kan benyttes, eksempler og annen nyttig informasjon 
```powershell
Get-Help Get-Help -Full
```

For benytte `Get-Help` effektivt finnes det er noen parametere som er verdt merke seg:
- **Ingen parameter** – Viser en oversikt over parametersettene og en kort beskrivelsen av kommandoen. 
- Parameteret `-Name` – Ved skrive inn deler av navnet vil systemet søke etter cmdlets med delvis samsvar, for eksempel `Get-Help -Name Get-Com*`
- Parameteret `-Full` –  Viser en **fullstendig versjon** av hjelpfilen, inkludert alle detaljer om parametere, eksempler, inngangs- og utgangsobjekter. 
- Parameteret `-Detailed` – Gir en **utvidet forklaring**, inkludert en beskrivelse av parametere samt eksempler på bruk.
- Parameteret `-Paging` – Viser hjelpeteksten i pagineringsmodus for en enklere navigasjon, litt som `man`-systemet
- Parameteret `-Examples` – Viser kun eksemplene, uten de øvrige beskrivelsene.
- Parameteret `-Syntax` – Viser kun syntaksen til en cmdlet, uten beskrivelse
- Parameteret `-Online` – Viser hjelpefilene på nett fra [Microsoft Learn]([Microsoft.PowerShell.Core Module - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/?view=powershell-7.5)), der den lokale kommandoen er en definert `HelpUri`. For å sjekke om den har en lenke til Microsoft Learn benyttes kommandoen `(Get-Command Get-Help).HelpUri`. Returneres `null` finnes enten ikke linken eller innholdet. 
- Parameteret `-ShowWindow` – Viser hjelpesiden i det grafiske grensesnittet

Trenger du hjelp med en spesifikk cmdlet skriver du inn `Get-Help Get-Command`
```powershell
get-help get-command

NAME
    Get-Command

SYNOPSIS
    Gets all commands.


SYNTAX
    Get-Command [[-Name] <System.String[]>] [[-ArgumentList] <System.Object[]>] [-All] [-CommandType {Alias | Function | Filter | Cmdlet |
    ExternalScript | Application | Script | Workflow | Configuration | All}] [-FullyQualifiedModule <Microsoft.PowerShell.Commands.ModuleSp
    ecification[]>] [-FuzzyMinimumDistance <UInt32>] [-ListImported] [-Module <System.String[]>] [-ParameterName <System.String[]>] [-Param
    eterType <System.Management.Automation.PSTypeName[]>] [-ShowCommandInfo] [-Syntax] [-TotalCount <System.Int32>] [-UseAbbreviationExpans
    ion] [-UseFuzzyMatching] [<CommonParameters>]

    Get-Command [[-ArgumentList] <System.Object[]>] [-All] [-FullyQualifiedModule <Microsoft.PowerShell.Commands.ModuleSpecification[]>] [-
    ListImported] [-Module <System.String[]>] [-Noun <System.String[]>] [-ParameterName <System.String[]>] [-ParameterType <System.Manageme
    nt.Automation.PSTypeName[]>] [-ShowCommandInfo] [-Syntax] [-TotalCount <System.Int32>] [-Verb <System.String[]>] [<CommonParameters>]


DESCRIPTION
    The `Get-Command` cmdlet gets all commands that are installed on the computer, including cmdlets, aliases, functions, filters, scripts,
     and applications. `Get-Command` gets the commands from PowerShell modules and commands that were imported from other sessions. To get
    only commands that have been imported into the current session, use the ListImported parameter.

    Without parameters, `Get-Command` gets all the cmdlets, functions, and aliases installed on the computer. `Get-Command *` gets all type
    s of commands, including all the non-PowerShell files in the PATH environment variable (`$Env:PATH`), which it lists in the Application
     command type.

    `Get-Command` that uses the exact name of the command, without wildcard characters, automatically imports the module that contains the
    command so that you can use the command immediately. To enable, disable, and configure automatic importing of modules, use the `$PSModu
    leAutoLoadingPreference` preference variable. For more information, see about_Preference_Variables (About/about_Preference_Variables.md
    ).

    `Get-Command` gets its data directly from the command code, unlike `Get-Help`, which gets its information from help topics.

    Starting in Windows PowerShell 5.0, results of the `Get-Command` cmdlet display a Version column by default. A new Version property has
     been added to the CommandInfo class.


RELATED LINKS
    Online Version: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/get-command?view=powershell-7.5&WT.mc_id=ps-get
    help
    Export-PSSession
    Get-Help
    Get-Member
    Get-PSDrive
    Import-PSSession
    about_Command_Precedence

REMARKS
    To see the examples, type: "Get-Help Get-Command -Examples"
    For more information, type: "Get-Help Get-Command -Detailed"
    For technical information, type: "Get-Help Get-Command -Full"
    For online help, type: "Get-Help Get-Command -Online"
```
Som du ser så får du opp mye informasjon om bruken av `Get-Command` uten parametere, men trenger du mer detaljert informasjon benytter du ett av parameterene nevnt over.

Har du allerede lest en hjelpeside og trenger å få mer informasjon om f.eks. et parameter kan du benytte parameteret `-Parameter` etterfulgt av parameternavnet.
```powershell
get-help get-command -Parameter Commandtype

-CommandType <System.Management.Automation.CommandTypes>
    Specifies the types of commands that this cmdlet gets. Enter one or more command types. Use CommandType or its alias, Type . By default
    , `Get-Command` gets all cmdlets, functions, and aliases.

    The acceptable values for this parameter are:

    - `Alias`: Gets the aliases of all PowerShell commands. For more information, see about_Aliases (About/about_Aliases.md).

    - `All`: Gets all command types. This parameter value is the equivalent of `Get-Command *`.

    - `Application`: Searches folders in the `$Env:PATH` environment variable for non-PowerShell   executable files. On Windows, executable
     files have a file extension that is listed in the   `$Env:PATHEXT` environment variable. For more information, see about_Environment_V
    ariables (About/about_Environment_Variables.md).

    - `Cmdlet`: Gets all cmdlets.

    - `ExternalScript`: Gets all `.ps1` files in the paths listed in the PATH environment variable   (`$Env:PATH`).

    - `Filter` and `Function`: Gets all PowerShell advanced and simple functions and filters.

    - `Script`: Gets all script blocks. To get PowerShell scripts (`.ps1` files), use the   `ExternalScript` value.

    These values are defined as a flag-based enumeration. You can combine multiple values together to set multiple flags using this paramet
    er. The values can be passed to the CommandType parameter as an array of values or as a comma-separated string of those values. The cmd
    let will combine the values using a binary-OR operation. Passing values as an array is the simplest option and also allows you to use t
    ab-completion on the values.

    Required?                    false
    Position?                    named
    Default value                None
    Accept pipeline input?       True (ByPropertyName)
    Aliases                      Type
    Accept wildcard characters?  false
```

Andre nyttige parametere som kan hjelpe deg
- Parameteret `-Category <type>` – Filtrer hjelpen basert på type, med andre ord cmdlet, provider, function...
- Parameteret `-Component / -Functionality / -Role` – Brukes sjeldnere, men lar deg filtrere hjelpen basert på systemkomponenter, funksjonalitet og brukerroller.

PowerShell har også konseptuelle hjelpeartikler. Disse starter alle med `about_`. Ved å skrive inn kommandoen `Get-Help about_*` får du den komplette listen. For å hente opp informasjon et spesifikk emne blir da kommandoen `Get-Help about_Aliases`.
## Get-Member

`Get-Member` er et kraftig verktøy for å utforske objekter i PowerShell. Du kan bruke det til å undersøke kommandoer, variabler, medlemstyper og tilpassede objekter. Det lar deg se hvilke egenskaper og metoder et objekt har, slik at du kan forstå hvordan du kan jobbe med det.

De mest brukte `MemberType`-er er:
- `AliasProperty`
- `Method`
- `NoteProperty`
- `Property`
- `ScriptProperty`
Disse er grunnleggende for objektmanipulasjon i PowerShell.

Det finnes flere `MemberType`-er, men de er mindre brukt. En [full liste finnes her](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-member?view=powershell-7.5#-membertype).  

For å benytte `Get-Member` pipes objektet som skal undersøkes inn til kommandoen. For eksempel hvis du ønsker å undersøke hvilke egenskaper og metoder kommandoen `Get-Service` returnerer: 
```powershell 
Get-Service | Get-Member

   TypeName: System.Service.ServiceController#StartupType

Name                      MemberType    Definition
----                      ----------    ----------
Name                      AliasProperty Name = ServiceName
RequiredServices          AliasProperty RequiredServices = ServicesDependedOn
Disposed                  Event         System.EventHandler Disposed(System.Object, System.EventArgs)
Close                     Method        void Close()
Continue                  Method        void Continue()
Dispose                   Method        void Dispose(), void IDisposable.Dispose()
Equals                    Method        bool Equals(System.Object obj)
ExecuteCommand            Method        void ExecuteCommand(int command)
GetHashCode               Method        int GetHashCode()
GetLifetimeService        Method        System.Object GetLifetimeService()
GetType                   Method        type GetType()
InitializeLifetimeService Method        System.Object InitializeLifetimeService()
Pause                     Method        void Pause()
Refresh                   Method        void Refresh()
Start                     Method        void Start(), void Start(string[] args)
Stop                      Method        void Stop(), void Stop(bool stopDependentServices)
WaitForStatus             Method        void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus), void WaitForStatu…
BinaryPathName            Property      System.String {get;set;}
CanPauseAndContinue       Property      bool CanPauseAndContinue {get;}
CanShutdown               Property      bool CanShutdown {get;}
CanStop                   Property      bool CanStop {get;}
Container                 Property      System.ComponentModel.IContainer Container {get;}
DelayedAutoStart          Property      System.Boolean {get;set;}
DependentServices         Property      System.ServiceProcess.ServiceController[] DependentServices {get;}
Description               Property      System.String {get;set;}
DisplayName               Property      string DisplayName {get;set;}
MachineName               Property      string MachineName {get;set;}
ServiceHandle             Property      System.Runtime.InteropServices.SafeHandle ServiceHandle {get;}
ServiceName               Property      string ServiceName {get;set;}
ServicesDependedOn        Property      System.ServiceProcess.ServiceController[] ServicesDependedOn {get;}
ServiceType               Property      System.ServiceProcess.ServiceType ServiceType {get;}
Site                      Property      System.ComponentModel.ISite Site {get;set;}
StartType                 Property      System.ServiceProcess.ServiceStartMode StartType {get;}
StartupType               Property      Microsoft.PowerShell.Commands.ServiceStartupType {get;set;}
Status                    Property      System.ServiceProcess.ServiceControllerStatus Status {get;}
UserName                  Property      System.String {get;set;}
ToString                  ScriptMethod  System.Object ToString();
```

Her ser vi følgende
1. `TypeName: System.Service.ServiceController` - Datatypen til objektet sammen `#StartupType` med underklassen eller en spesifikk egenskap av `ServiceController`-objektet.
2. Objektet har 5 typer egenskaper og metoder: `AliasProperty`, `Event`, `Method`, `Property` og `ScriptMethod`

### `AliasProperty`
```powershell
### Utforsker `AliasProperty` i `Get-Service`
# Get-Service returnerer objekter med en alias-egenskap for tjenestenavn

$Service = Get-Service | Select-Object -First 1

# Demonstrasjon av aliasbruk
Write-Host "Tjenestens navn (alias): $($Service.Name)"
# Normal bruk
Write-Host "Tjenestens servicenavn: $($Service.ServiceName)"

# Resultat 
Tjenestens navn (alias): Spooler  
Tjenestens servicenavn: Spooler

# Bekreft aliaset med Get-Member
$Service | Get-Member -Name Name

Name       MemberType   Definition  
----       ----------   ----------  
Name       AliasProperty  Name = ServiceName
```
Her vises det tydelig at `Name` er en alias-egenskap (`AliasProperty`) for `ServiceName`. I eksemplet over viser det at du får samme resultat ved å bruke `$Service.Name` og `$Service.ServiceName`.
I tillegg kan du bruke `Get-Member` til å bekrefte aliaser og forstå objektstrukturen.

### `Method`
`Method` er funksjoner, eller metoder, som kan kalles på et objekt for å utføre en handling. Dette kan for eksempel være funksjoner som `Start()` og `Stop()` for å starte eller stoppe en tjeneste, beregne verdier eller manipulere data.

Du henter opp alle metodene til et objekt ved å:
```powershell
# Vise kun metoder
Get-Service | Get-Member -MemberType Method

# Eksempel på output
Name                      MemberType Definition
----                      ---------- ----------
Close                     Method     void Close()
Continue                  Method     void Continue()
Dispose                   Method     void Dispose(), void IDisposable.Dispose()
Equals                    Method     bool Equals(System.Object obj)
ExecuteCommand            Method     void ExecuteCommand(int command)
GetHashCode               Method     int GetHashCode()
GetLifetimeService        Method     System.Object GetLifetimeService()
GetType                   Method     type GetType()
InitializeLifetimeService Method     System.Object InitializeLifetimeService()
Pause                     Method     void Pause()
Refresh                   Method     void Refresh()
Start                     Method     void Start(), void Start(string[] args)
Stop                      Method     void Stop(), void Stop(bool stopDependentServices)
WaitForStatus             Method     void 
```
Her ser du at `Start()` og `Stop()` er metoder som kan brukes til å kontrollere tjenester.

Du kan kalle en metode direkte på et objekt:
```powershell
$Service = Get-Service -Name "Spooler"
$Service.Stop()  # Stopper tjenesten
$Service.Start() # Starter tjenesten igjen
```
Det finnes to typer metoder:
- **Instans**metoder - Kalles på et spesifikt objekt, som `$Service.Start()`
- **Statiske**metoder - Kalles direkte på en klasse, som `[System.Math]::Sqrt(25)`.
### `NoteProperty`
`NoteProperty` brukes ofte for å legge til egendefinerte statiske data til et objekt. Det skiller seg fra `Property` ved at den ikke er knyttet til en metode eller beregning - den inneholder bare en verdi og kan være nyttig for skript og rapportering. Den er også enkel å manipulere da den kan legges til, endres og fjernes uten å påvirke objektes funksjonalitet.

Du henter opp alle `NoteProperty`-egenskapene til et objekt ved å:

```powershell
# Vise kun NoteProperty
Get-Process | Get-Member -MemberType NoteProperty

# Eksempel på output
Name       MemberType   Definition
----       ----------   ----------
__NounName NoteProperty string __NounName=Process
```

For å å legge til en `NoteProperty` benyttes `Add-Member` for å legge til en ny egenskap i et objekt:

```PowerShell
# Opprett nytt objekt
$obj = New-Object -TypeName PSObject

# Legg til `NoteProperty`
$obj | Add-Member -MemberType NoteProperty -Name "Status" -Value "Aktiv"

# Bekreft at `Status` er lagt til
$obj.Status

# Output
Aktiv
```

### `Property`
`Property` er standard egenskapene til et objekt, som `Name`, `Status`, `Id`. Disse egenskapene lagrer informasjon om objektet, og enten være kun lesbare `get` eller skrivbare `set`.
Kjennetegn for `Property`-membertypen:
- Lagrer data om objektet – For eksempel Status, ServiceName, StartType for en tjeneste
- Kan være lesbar `get` eller skrivbar `set` – Noen egenskaper kan endres, andre kun for visning
- Tilgjengelig via `Get-Member` – Du kan bruke `Get-Member` til å se hvilke egenskaper et objekt har.

```powershell
Get-Service Spooler | Get-Member -MemberType Property


# Eksempel på output 

Name                MemberType Definition
----                ---------- ----------
DisplayName         Property   string DisplayName {get;set;}
StartType           Property   System.ServiceProcess.ServiceStartMode StartType {get;}
Status              Property   System.ServiceProcess.ServiceControllerStatus Status {get;}

``` 
Her ser du blant annet at `Status` er kun lesbar, mens `DisplayName` og `StartType` kan endres.

Hvis en egenskap har `{get;set;}`, kan den endres – men ikke direkte i alle cmdlets som `Get-Service`
```
$Service = Get-Service -Name Spooler
$Service.DisplayName = "Ny Spooler-tjeneste"
```

### `ScriptProperty`
`ScriptProperty` er en egenskapstype i PowerShell som kjører et PowerShell-skript hver gang den hentes (`get`) eller settes (`set`). Dette betyr at verdien beregnes dynamisk i stedet for å være statisk.
Kjennetegn på `ScriptProperty`:
- Kjører et PowerShell-skript når egenskapen hentes `get` eller endres `set`
- Gir dynamiske verdier basert på skriptlogikk
- Kan legges til objekter med `Add-member`

For å lage en `ScriptProperty`, eller legge det til et objekt brukes `Add-Member`.

```powershell
# Opprett et objekt
$Obj = New-Object -TypeName PSObject

# Legg til ScriptProperty
$Obj | Add-Member -MemberType ScriptProperty -Name "Tidspunkt" -Value {Get-Date}

# Bruk ScriptProperty
Write-Host "Nåværende tid: $($Obj.Tidspunkt)"

# Output
Nåværende tid: 05/15/2025 22:35:38
```
Her ser du at hver gang `Tidspunkt` hentes, kjører `Get-Date` og returnerer gjeldende tid.