---
title: Shell Cmdlets Syntax
nav_order: 3
parent: PowerShell Challenge
has_children:
---

# Forstå kommandoskallet, cmdlets og syntaks

## Kommandoskallet

Et kommandoskall, eller _shell_ på engelsk, er et interaktivt kommandolinjegrensesnitt for å administrere en datamaskin.

Kommandoskallet tar imot inntasting fra tastaturet, evaluerer inntastingen og utfører inntastingen som en skallkommando, eller videresender inntastingen til operativsystemet for å bli utført. De fleste kommandoskall kan også lese kommandoer fra en skriptfil, og kan inkludere programmeringsfunksjoner som variabler, flytkontroll og funksjoner.

Begrepene _command shell_, _command-line tool_ og _terminal_ brukes ofte om hverandre når man snakker om kommandoskallet, selv om de har teknisk sett ulike betydninger:
- **Command shell** - Et kommandoskall er et program som tolker og kjører kommandoer, slik som PowerShell, Bash eller cmd.exe. Det gir brukeren mulighet til å kjøre alle kommandoer som operativsystemet støtter. I tillegg finnes spesialiserte kommandoskall som fungerer med spesifikke applikasjoner og tjenester. Eksempler på spesialiserte kommandoskall inkluderer AI-skall som _Azure OpenAI_ og nettverksadministrasjonskall som _netsh_.
- **Command-line tool** - Et frittstående verktøy eller program som kan kjøres fra kommandolinjen, men som ikke nødvendigvis er et fullverdig kommandoskall da det ofte er utformet for å utføre bestemte oppgaver. Eksempler på slike verktøy er Azure CLI og Azure PowerShell.
- **Terminal** - Et programgrensesnitt som er vert for kommandoskall. En terminal utfører ikke kommandoer direkte, men fungerer som et grensesnitt for kommandoskallet. Eksempler på slike emulatorer er Windows Terminal og iTerm.
Selv om disse begrepene ofte brukes om hverandre, har de ulike tekniske betydninger, noe som kan gjøre dem forvirrende å skille dem fra hverandre i praksis. Det å forstå disse begrepene er nyttig når man diskuterer om temaer innen systemadministrasjon, automatisering eller utvikling.

Mer om [kommandoskall](https://learn.microsoft.com/en-us/powershell/scripting/what-is-a-command-shell?view=powershell-7.5).
## PowerShell cmdlets

Når man utfører oppgaver i kommandoskallet til PowerShell benytter man kommandoer som heter _cmdlets_. Cmdlets er innebygde PowerShell kommandoer som er organisert i moduler, og disse kan lastes inn etter behov.

PowerShells cmdlets følger en fast navngivingskonvensjon basert på et _verb-substantive_ format, der verbet beskriver handlingen og substantivet angir objektet som påvirkes.
Basert på _verbet_ i cmdleten kan man dele de opp i ulike typer funksjonalitet:
- **Get**-cmdlets henter informasjon.
- **Set**-cmdlets endrer verdier.
- **New**-cmdlets oppretter nye objekter
- **Remove**-cmdlets sletter objekter

 For å finne alle cmdleter, på ditt system, som starter med `Get`: `Get-Command -Verb Get`. Bytt ut `Get` med `Set`, `New` eller `Remove` for å finne disse. Her er et eksempel på de ti siste cmdletene på min maskin

```powershell
Get-Command -Verb Get | select -Last 10

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Get-WsusUpdate                                     2.0.0.0    UpdateServices
Cmdlet          Get-WUApiVersion                                   2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUHistory                                      2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUInstallerStatus                              2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUJob                                          2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WULastResults                                  2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUOfflineMSU                                   2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WURebootStatus                                 2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUServiceManager                               2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUSettings                                     2.2.1.5    PSWindowsUpdate
```

Ønsker du å vite mer om en cmdlet brukes `Get-Help` cmdlet som henter hjelpe-siden til den enkelte cmdlet.

```powershell
Get-Help Get-Command

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

...
```

Ovenfor er cmdleten `Get-Help` brukt for å hente frem hjelp-siden til cmdleten `Get-Command`.

Cmdleter utfører en handling og returnerer vanligvis et .NET-objekt. PowerShell cmdlets skiller seg fra tradisjonelle kommandolinjeverktøy ved at
- **De er basert på .NET-klasser** - De er ikke frittstående kjørbare filer, men objekter innen .NET-rammeverket og cmdleten arver funksjonalitet fra .NET
- **De krever minimalt med kode** - Du kan lage cmdlets med svært lite utviklingsarbeid sammenlignet med tradisjonelle kommandolinjeverktøy
- **Parsing og feilhåndtering utføres av PowerShell** - Cmdleter utfører vanligvis ikke sin egen feil- og formatkontroll. Dette håndters av PowerShell-kjøretiden
- **De behandler objekter, ikke tekst** - I motsetning til eldre skall som Bash, opererer PowerShell cmdletene strukturerte .NET-objekter fremfor ren tekst.

Cmdleter har parametere, og i noen tilfeller kreves ett eller flere parametere for at de skal kunne kjøre. Den standardiserte strukturen for parametere sikrer en konsekvent bruk av cmdleter. Ved å bruke `Get-Help` den aktuelle cmdleten vil man kunne se nødvendige parametere og syntaksen som cmdleten krever.

Cmdleter er innebygde PowerShell-kommandoer som kjører i en modul. Funksjoner er brukerdefinerte PowerShell PowerShell-kommandoer som ikke krever en modul. Aliaser er snarveier til cmdleter eller funksjoner, ment for enklere bruk, for eksempel aliasene `ls` og `gci` peker til cmdleten `Get-ChildItem`.

Cmdleter skiller seg fra tradisjonelle kommandolinjeverktøy ved at de fungerer i en pipeline-basert arbeidsflyt. Dette betyr at en cmdlet kan motta objekter fra en tidligere cmdlet i piplinen.
For å illustrere dette kan vi bruke cmdleten `Get-Process` for å hente alle aktive prosesser, der hver prosess er et objekt. Resultatene blir sendt videre i pipelinen, som er symbolisert med `|`, til cmdleten `Where-Object` som filtrer ut alle prosessene på navnet `notepad` og sender dette videre i piplinen til cmdleten `Stop-Process` som stopper den aktive prosessen.

```powershell
Get-Process | Where-Object {$_.Name -eq "notepad"} | Stop-Process
```

Hvis mans skal gjøre det samme i et tradisjonelt tekstbasert kommandolinjeverktøy, som for eksempel Bash, vil kommandoen se slik ut
```bash
ps aux | grep notepad | awk '{print $2}' | xargs kill
```

I et tradisjonelt kommandolinjeverktøy som Bash, behandles resultatet av en kommando som ren tekst, og hver kommando må manuelt tolke og trekke ut relevant informasjon. PowerShells objektbaserte tilnærming eliminerer behovet for en slik behandling siden data behandles som strukturerte objekter.

Mer om [What is a PowerShell command?](https://learn.microsoft.com/en-us/powershell/scripting/powershell-commands?view=powershell-7.5)
Mer om [Cmdlet Overview](https://learn-microsoft-com.translate.goog/en-us/powershell/scripting/developer/cmdlet/cmdlet-overview?view=powershell-7.5)
## Kommando syntaks i PowerShell

Syntaks er regler for hvordan en kodelinje eller en kommando i et programmerings- eller skriptspråk skal settes sammen. Dataspråk er konstruert slik at en kommando alltid må være entydig for å kunne tolkes korrekt. Hvis syntaksregelene brytes, kan ikke kommandoen tolkes riktig.

Dette gjelder også for cmdleter i PowerShell. PowerShell har en strukturert syntaks, hvor hver kommando følger en fast regel for parametere, argumenter og objektbehandling i en pipeline. `Get-Help` og `Get-Command` viser syntaksdiagrammer for å hjelpe deg med å skrive kommandoer korrekt.


`Get-Command` kan bli brukt til å hente informasjon om en hvilken som helst cmdlet på systemet. Ved å benytte parameteret `Syntax` får du syntaksen for cmdleten:

```powershell
Get-Command Get-Command -Syntax

Get-Command [[-ArgumentList] <Object[]>] [-Verb <string[]>] [-Noun <string[]>] [-Module <string[]>] [-FullyQualifiedModule <ModuleSpecification[]>] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All] [-ListImported] [-ParameterName <string[]>] [-ParameterType <PSTypeName[]>] [<CommonParameters>]

Get-Command [[-Name] <string[]>] [[-ArgumentList] <Object[]>] [-Module <string[]>] [-FullyQualifiedModule <ModuleSpecification[]>] [-CommandType <CommandTypes>] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All] [-ListImported] [-ParameterName <string[]>] [-ParameterType <PSTypeName[]>] [-UseFuzzyMatching] [-FuzzyMinimumDistance <uint>] [-UseAbbreviationExpansion] [<CommonParameters>]
```

På samme måte kan `Get-Help` benyttes, men den har ikke et parameter for å filtrere ut syntaksen, så du vil få en annen type output.

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
...
```

Det du får opp er parametere som kan benyttes med den cmdleten du henter informasjon om.

```powershell
Get-Command [[-ArgumentList] <Object[]>] [-Verb <string[]>] [-Noun <string[]>] [-Module <string[]>] [-FullyQualifiedModule <ModuleSpecification[]>] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All] [-ListImported] [-ParameterName <string[]>] [-ParameterType <PSTypeName[]>] [<CommonParameters>]

Get-Command [[-ArgumentList] <System.Object[]>] [-All] [-FullyQualifiedModule <Microsoft.PowerShell.Commands.ModuleSpecification[]>] [-
    ListImported] [-Module <System.String[]>] [-Noun <System.String[]>] [-ParameterName <System.String[]>] [-ParameterType <System.Manageme
    nt.Automation.PSTypeName[]>] [-ShowCommandInfo] [-Syntax] [-TotalCount <System.Int32>] [-Verb <System.String[]>] [<CommonParameters>]
```

Ved første øyekast ser det ut som du får tilbake to like blokker med syntaks, men det er forskjeller på dem. En cmdlet kan ha en eller flere slike blokker, kalt _parametersett_.

En måte å vise hvor mange parameter sett en cmdlet har er å benytte kodesnutten under

```powershell
$Cmd.ParameterSets | Select-Object name, IsDefault, @{n='Parameters';e={$_.ToString()}} | Format-Table -Wrap

Name          IsDefault Parameters
----          --------- ----------
CmdletSet          True [[-ArgumentList] <Object[]>] [-Verb <string[]>] [-Noun <string[]>] [-Module <string[]>] [-FullyQualifiedModule <Mod
                        uleSpecification[]>] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All] [-ListImported] [-ParameterName <strin
                        g[]>] [-ParameterType <PSTypeName[]>] [<CommonParameters>]
AllCommandSet     False [[-Name] <string[]>] [[-ArgumentList] <Object[]>] [-Module <string[]>] [-FullyQualifiedModule <ModuleSpecification[
                        ]>] [-CommandType <CommandTypes>] [-TotalCount <int>] [-Syntax] [-ShowCommandInfo] [-All] [-ListImported] [-Paramet
                        erName <string[]>] [-ParameterType <PSTypeName[]>] [-UseFuzzyMatching] [-FuzzyMinimumDistance <uint>] [-UseAbbrevia
                        tionExpansion] [<CommonParameters>]
```

Her ser du hvilket parametersett som er standard og hvilket du kan benytte som alternativ.

_Parametersett i en cmdlet kan, som du ser av eksemplene over, ha flere parametersett, der hvert inneholder et unikt sett med parametere som kan brukes sammen. Du kan kun bruke parametere fra ett parametersett om gangen. Med andre ord er det_ _ikke_ mulig å kombinere parametere fra ulike parametersett i samme kommando.
Parametersett finnes fordi noen parametere ikke kan brukes sammen i en kommando. PowerShell grupperer kompatible parametere i egne sett, slik at du kan velge riktig kombinasjon. Hvis du forsøker å kombinere parametere fra forskjellige parametersett i en kommando, vil den ikke kunne utføres, og du vil få en feilmelding.
PowerShell velger automatisk riktig parametersett basert på parameterne som benyttes i kommandoen.

Et parametersett inneholder ulike symboler, som parenteser og bindestreker,  i kombinasjon med tekst. Plasseringen av disse, sammen med hvordan parentesene benyttes kan ha stor betydning hvis du utelater parameternavnet.
Noen parametere er obligatoriske og må stå på riktig plass, mens andre er valgfrie.  Den riktige plasseringen er kun viktig når du utelater parameternavnet!

Syntaksdigrammene bruker følgende symboler:


| Symbol  | Forklaring                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| :-----: | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    -    | En bindestrek, `-`, indikerer et parameternavn. For å få opp alle parameterne tast `ctrl + space`. For å benytte `Name`‑parameteret i cmdleten `Get-Command` skriver du `Get-Command -Name`.                                                                                                                                                                                                                                                                                                                                                                                                                            |
|   < >   | Vinkelparenteser, `< >`, indikerer en plassholder for tekst. Du skriver ikke inn vinkelparentesene, kun teksten det beskriver.<br><br>Plassholderen identifiserer .NET‑typen av verdien som parameteret godtar. I cmdleten `Get-Command` og parameteret `Name` skal du bytte ut `<string[]>` med en eller flere tekststrenger. Strengene separeres med komma `,`. For eksempel: `Get-Command -Name get-help, get-alias`.                                                                                                                                                                                                |
|   [ ]   | Hakeparenteser `[ ]` som er lagt til en .NET‑type indikerer at parameteret kan akseptere én eller flere verdier av den typen. Verdiene oppgis som en kommaseparert liste.<br><br>Eksempel: `Get-Command -Name "Get-Help", "Get-Alias"`.<br><br>Hakeparenteser rundt et parameter indikerer også at det er valgfritt.<br><br>Hakeparenteser som kun omslutter parameternavnet indikerer at navnet er valgfritt, men ikke verdien. Dette er posisjonsbestemte parametere.<br><br>Hvis hakeparentesen omslutter både parameter og verdi, er begge valgfrie. For eksempel: `[-CommandType <CommandTypes>]` i `Get-Command`. |
|   { }   | Krøllparenteser `{ }` indikerer enumerasjoner. En enumerasjon i PowerShell er en datatype som definerer et sett med faste verdier et parameter kan ha.<br><br>Verdiene i krøllparentesene er separert med pipe `\|` og indikerer et eksklusivt ELLER‑valg. Du skal velge én verdi. For eksempel har `New-Alias -Option` følgende verdier: `{None \| ReadOnly \| Constant \| Private \| AllScope}`.                                                                                                                                                                                                                      |
| *(tom)* | Enkelte parametere aksepterer ikke inndata og har derfor ingen parameterverdi. Disse kalles *switch‑parametere* og fungerer som boolske verdier (`$true`/`$false`). Standard er `$false`, og bruker du parameteret settes det til `$true`.<br><br>Eksempel: `[-ListImported]` i `Get-Command` viser alle importerte cmdlets ved oppstart av PowerShell‑sesjonen.                                                                                                                                                                                                                                                        |


Mer om [PowerShells syntaks]([about_Command_Syntax - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_command_syntax?view=powershell-7.5)), [about_Parameters](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameters?view=powershell-7.5)

