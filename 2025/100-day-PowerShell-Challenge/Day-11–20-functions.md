# Opprette og anvende funksjoner
## Introduksjon til funksjoner
En [funksjon](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-7.5) er som et navngitt verktøy som du selv har laget – en liten kodeblokk som gjør en oppgave for deg, hver gang du kaller den opp. I stedet for å skrive samme kommandoer igjen og igjen, kan du samle dem i en funksjon med et eget navn, og kjøre den når det passer.

Funksjoner gjør skript mer oversiktlige, gjenbrukbare og enkle å vedlikeholde. Du gir funksjonen et navn, og så kan den ta imot verdier, gjøre noe med dem og sende tilbake et resultat.

PowerShell støtter to typer funksjoner: 
- _Funksjoner_: Defineres av nøkkelordet `function`, og består av kode som kjøres ved navn. De kan ta inndata, behandle og gi ut et resultat.
- _Filtre_: Spesialtilpasset for å jobbe med data som kommer via pipelinen. Defineres med nøkkelordet `filter`.

Eksempel på en enkel funksjon: 
```powershell
function Skriv-Hilsen {
 "Hei, og velkommen!"
}
```

Du kan også lage [avanserte funksjoner](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced?view=powershell-7.5), som oppfører seg som innebygde cmdlets – de tar parametere, støtter pipeline, og kan utvides med validering og egne blokker.
```powershell
function Get-Status {
    [CmdletBinding()]
    param (
	    [string]$ServiceName
    )
    
    process {
		Get-Service -Name $ServiceName
	}
}
```

### Navngivning av funksjoner
Du kan velge det navnet du måtte ønske til en funksjon, men skal du dele funksjonen med andre bør du følge PowerShells navnestandard: 
- Navn bør bestå av et _Verb-Substantiv_-par der verbet beskriver handlingen funksjonen utfører, og substantivet beskriver objektet eller elementet som funksjonen opererer på
- Navn bør også bruke [godkjente verb](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands) for alle kommandoer for å skape en konsistens og forutsigbarhet for brukerne
### Syntaks for funksjoner
Når du definerer en funksjon i PowerShell, følger du en bestemt struktur. Den består av et navn, en valgfri parameterblokk, og en eller flere skriptblokker som styrer hva funksjonen gjør og når. 

Her er et eksempel på syntaksen: 
```powershell
function [<scope:>]<name> {
  param([type]$Parameter1 [,[type]$Parameter2])
  dynamicparam {<instruksjoner>}
  begin {<instruksjoner>}
  process {<instruksjoner>}
  end {<instruksjoner>}
}
```
- `function` – Nøkkelordet som forteller PowerShell at du oppretter en funksjon
- `<scope:>` – Valgfritt. Brukes hvis du vil at funksjonen skal være tilgjengelig globalt (`global:`), kun i skriptet (`script:`), eller i en bestemt kontekst
- `<Navn>` – Navnet du gir i funksjoen. Dette er det du skriver for å kalle den opp
- `param(...)` – Her definerer du hvilke verdier funksjonen kan ta i mot. Du kan angi _type_, _standardverdier_ og _validering_
- `dynamicparam` – En avansert blokk som lar deg generere parametere dynamisk basert på kontekst. Brukes sjelden i enkle funksjoner
- `begin`, `process`, `end` – Disse skriptblokken styrer funksjonens livssyklus, spesielt når den mottar data via pipeline. Du kan bruke en eller flere av dem, avhengig av behov

> **Tips!**
> PowerShell bruker `end` som standardblokk dersom du ikke spesifiserer noen av de andre. 
### Enkel funksjon uten parametere
```powershell
function Skriv-Hilsen {
 "Hei, og velkommen!"
}

# Bruk
Skriv-Hilsen
Hei, og velkommen!
```
Her har funksjonen ingen `param`-blokk eller skriptblokker (`begin`, `process` eller `end`) og vil bare returnere en tekst når funksjonen kalles. For å kalle opp funksjonen skriver du `Hei-Verden` i terminalen.
### Avansert funksjon med parametere og skriptblokker
```powershell
function Skriv-Hilsen {
    param (
        [string]$Navn,
        [switch]$Formell
    )
    
    begin {
        "Klargjøring av hilsen..."
    }
    
    process {
        if ($Formell) {
            "God dag, $Navn"
        } else {
            "Hei, $Navn"
        }
    }
    
    end {
        "Hilsen sendt."
    }
}

# Bruk
Skriv-Hilsen -Navn "Kjetil"
Klargjøring av hilsen...
Hei, Kjetil  
Hilsen sendt.

Skriv-Hilsen -Formell -Navn "Kjetil"    
Klargjøring av hilsen...
God dag, Kjetil
Hilsen sendt.
```
Funksjonen har en parameterblokk som som gir mulighet for input. Bruken av `begin`, `process` og `end` gir struktur, og er spesielt nyttig ved håndtering av piped input eller prosesser i flere steg. 
Et [`switch`-parameteret](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-7.5#switch-parameters) slår på en valgmulighet – Det er tilstedeværelsen som avgjør: hvis parameteret er med, er verdien `$true`; hvis den utelates, er verdien `$false`.
### `filter`
Et `filter` i PowerShell er spesielt nyttig når du ønsker å filtrere eller transformere data som kommer inn via pipelinen, særlig når du jobber med store datamengder. Filteret tilbyr en mer effektiv måte å behandle disse dataene på, med raskere ytelse og redusert minnebruk sammenlignet med tradisjonelle funksjoner. 
Fordi filteret håndterer pipet input automatisk via `$_`, og itererer over elementene uten behov for en `process`-blokk, kan du skrive mer kompakt og ressursbesparende kode – perfekt for datatunge oppgaver der effektivitet er nøkkelen.

| Type       | Input-håndtering    | Hastighet   | Minnebruk    |
| ---------- | ------------------- | ----------- | ------------ |
| `function` | Bruker `$Input`     | Langsommere | Mer minne    |
| `filter`   | Bruker `$_` direkte | Raskere     | Mindre minne |
Filteret begynner å behandle data **mens** pipeline fylles – funksjoner venter til alt er mottatt.

Et eksempel på bruken av filter
```powershell
filter Get-HeavyProcess {
    if ($_.WorkingSet -gt 200MB) {
        $_
    }
}
Get-Process | Get-HeavyProcess
```
### Filter syntaks
Et filter i PowerShell ligner på en funksjon, men er optimalisert for å behandle pipeline-data én og én – raskere og mer effektivt enn vanlige funksjoner.

Syntaksen:
```powershell
filter <Navn> {
    <kode som bruker $_>
}
```
Enkelt eksempel på bruken av `filter`
```powershell
filter MyFilter {
    if ($_ -gt 10) { $_ }
}
1..20 | MyFilter
```
## Parametere i funksjoner
### Hva er parametere
Når du skriver funksjoner i PowerShell, handler mye av jobben om hvordan du tilrettelegger for gjenbruk. Parametere er nøkkelen til dette – de lar deg sende inn verdier som styrer hvordan funksjonen oppfører seg, uten å endre selve koden. 

I stedet for å hardkode verdier, kan du bruke parametere som gjør funksjonen tilpasningsdyktig. Det blir litt som å fylle ut et skjema: varierer ut fra hva du fyller inn.

Navnene på parameterne bør være beskrivende og følge en konsistent stil, slik at både du og andre forstår raskt hva funksjonen forventer og gjør.

Du bør benytte parametere fordi det
- _Øker gjenbrukbarheten_ – samme kode kan brukes i forskjellige scenarioer ved endre verdiene
- _Øker lesbarheten_ – funksjonene blir enklere å lese når verdiene blir definert eksplisitt, i stedet for å være hardkodet
- _Forbedrer automatisering_ – parametere gjør det enklere å integrere funksjoner med med planlagte oppgaver, pipelines og andre automatiseringsverktøy.

### Hvordan kalle funksjoner med parametere
Parameterene defineres i `param()`-blokk inne i funksjonen. Når du kaller funksjonen, skriver du inn parameternavnet med en bindestrek (`-`) foran, etterfulgt av verdien:
```powershell
Skriv-Hilsen -Navn "Kjetil"
```
Her kalles funksjonen  `Skriv-Hilsen`, `-Name` er parameteret og `Kjetil` er verdien som sendes inn.
### Datatyper for parametere
Du kan angi hvilken datatype parameteren skal ha, for eksempel:
- `[string]` – tekst
- `[int]` – heltall
- `[datetime]` – dato og tid
- `[switch]` – et boolsk flagg som enten er tilstede (`$true`) eller ikke (`$false`)

Dette hjelper PowerShell med å validere input og gi deg mer kontroll over hva funksjonen kan motta. 
### Parameteregenskaper og validering
Når du definerer parametere i PowerShell-funksjoner, kan du bruke ulike attributter for å kontrollere og validere input. Disse egenskapene hjelper med å sikre at funksjonen får riktig type og verdi – og gir brukeren tydlige feilmeldinger hvis noe går galt.
Du vil se disse i praksis i eksemplet under, men her er en kort oversikt:
- `[Parameter(Mandatory=$true)]` – Krever at parameteren må angis når funksjonen kjøres
- `[Parameter(Position=0)]` – Angir rekkefølgen på parameteren når funksjonen kjøres
- `[ValidatePattern("\d{4}")]` – Krever at verdien matcher et mønster, for eksempel fire sifre
- `[ValidateSet("Ja","Nei")]` – Begrenser input til et forhåndsdefinert liste med gyldige verdier
- `[ValidateRange(1,100)]` – Setter minimum- og maksimum verdi
Disse attributtene gjør funksjonen mer robust og brukervennlig. 
### Avanserte parametere 
PowerShell støtter også mer avanserte parameterkonsepter:
- _Common Parameteres_ – Cmdlets og avanserte funksjoner har tilgang til felles parametere som `-ErrorAction`, `-Verbose` og `-Debug`. For å aktivere disse, bruker du `[CmdletBinding()]` før `param()`-blokken.
- _Parameter Sets_ – Lar en funksjon ha flere sett med parametere, slik at du kan tilby ulike måter å bruke funksjonen på.
### Eksempel på funksjon med parametere
Denne funksjonen mottar ett eller flere navn via pipeline og generer en tilpasset hilsen til hver person, basert på flere parametere du kan fylle inn.
```powershell
function Skriv-Hilsen {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory,ValueFromPipeline, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]$Navn,

        [Parameter(Position = 1)]
        [ValidateSet("Hei", "Hallo", "God dag", "Heisann")]
        [string]$Hilsen = "Hei",

        [switch]$Formell,

        [int]$Alder,

        [ValidateScript({ $_ -match '^[A-ZÆØÅa-zæøå ]+$' })]
        [string]$Sted
    )

    begin {
        Write-Verbose "Starter hilsen-generator..."
        $Resultater = @()
    }

    process {
        if ($PSCmdlet.ShouldProcess($Navn, "Generer hilsen")) {
            $Prefix = if ($Formell) { "Kjære" } else { $Hilsen }
            $Tekst = "$Prefix $Navn!"

            if ($Alder) { $Tekst += " Du er $Alder år gammel." }
            if ($Sted) { $Tekst += " Håper alt står bra til i $Sted." }

            $Resultater += $Tekst
        }
    }

    end {
        Write-Verbose "Avslutter hilsen-generator. Antall hilsener: $($Resultater.Count)"
        $Resultater | ForEach-Object { Write-Output $_ }
    }
}

# Bruk
"Kjetil","Tone","Lars" | Skriv-Hilsen -Formell -Alder 40 -Sted "Ålesund"
Kjære kjetil! Du er 40 år gammel. Håper alt står bra til i Ålesund.
Kjære tone! Du er 40 år gammel. Håper alt står bra til i Ålesund.
Kjære lars! Du er 40 år gammel. Håper alt står bra til i Ålesund.

"Kjetil","Tone","Lars" | Skriv-Hilsen  -Alder 40 -Sted "Ålesund"
Hei kjetil! Du er 40 år gammel. Håper alt står bra til i Ålesund.
Hei tone! Du er 40 år gammel. Håper alt står bra til i Ålesund.
Hei lars! Du er 40 år gammel. Håper alt står bra til i Ålesund.

"Kjetil","Tone","Lars" | Skriv-Hilsen  -Alder 40 -Sted "Ålesund" -Verbose
VERBOSE: Starter hilsen-generator...       
VERBOSE: Performing the operation "Generer hilsen" on target "Kjetil".
VERBOSE: Performing the operation "Generer hilsen" on target "Tone".
VERBOSE: Performing the operation "Generer hilsen" on target "Lars".
VERBOSE: Avslutter hilsen-generator. Antall hilsener: 3
Hei Kjetil! Du er 40 år gammel. Håper alt står bra til i Ålesund.
Hei Tone! Du er 40 år gammel. Håper alt står bra til i Ålesund.
Hei Lars! Du er 40 år gammel. Håper alt står bra til i Ålesund.

"Kjetil","Tone","Lars" | Skriv-Hilsen  -Alder 40 -Sted "Ålesund" -Verbose -WhatIf  
VERBOSE: Starter hilsen-generator...       
What if: Performing the operation "Generer hilsen" on target "Kjetil".
What if: Performing the operation "Generer hilsen" on target "Tone".
What if: Performing the operation "Generer hilsen" on target "Lars".
VERBOSE: Avslutter hilsen-generator. Antall hilsener: 0

"Kjetil","Tone","Lars" | Skriv-Hilsen  -Alder 40 -Hilsen "top of the morning to you" -Sted "Ålesund"
Skriv-Hilsen: Cannot validate argument on parameter 'Hilsen'. The argument "top of the morning to you" does not belong to the set "Hei,Hallo,God dag,Heisann" specified by the ValidateSet attribute. Supply an argument that is in the set and then try the command again.
```
Funksjonen definerer `[CmdletBinding()]` for å gjøre funksjonen cmdlet-lik og for å gi tilgang tilgang til vanlige parametere som `-Verbose` og støtte for `-WhatIf` via `ShouldProcess`

`param()`-blokken definerer parametere med
- Typetvungne verdier ( `[string], [int]`)
- Validering (`ValidateNotNullOrEmpty`, `ValidateSet`, `ValidateScript`)
- Posisjonsstyring (`Position`)
- Pipeline-støtte (`ValueFromPipeline`)
- Boolsk `switch` (`$Formell`)

`begin`-blokken initierer en tom liste (`$Resultater`) og skriver en verbose-melding ved start.

`process`-blokken behandler hver person individuelt og sjekker med `ShouldProcess` om hilsen skal genereres, setter opp teksten basert på parametere og til slutt legger den til i `$Resultater`

`end`-blokken skriver ut alle hilsener og gir en verbose-avslutning
### Navngitte parametere (Named parameters)
I PowerShell bruker vi navngitte parametere for å sende verdier til funksjoner eller cmdlets på en tydelig og fleksibel måte. I stedet for å stole på rekkefølgen som i posisjonelle parametere, navngir vi verdiene slik at koden blir mer lesbar og vedlikeholdbar. 

Med navngitte parametere spesifiserer du både navnet og verdien for hver parameter som du sender inn
```powershell
Send-Hilsen -Navn "Kjetil" -Sted "Ålesund" -Alder 43
```
Dette står i kontrast til posisjonsbaserte parametere der rekkefølgen av verdiene bestemmer hvilke parametere de blir lagt til. 
```powershell
Send-Hilsen "Kjetil" "Ålesund" 43
```
Fordelene med navngitte parametere inkluderer økt _lesbarhet_, selv med mange parametere, da koden blir selvforklarende. I tillegg minimeres faren for feil på grunn av rekkefølge da rekkefølgen på parametere ikke har betydning. 

Du finner parameterne i terminalen ved å skrive inn funksjonavnet og `-`. Trykk deretter på `CTRL+SPACE` for å se valgene.
```powershell
Skriv-Hilsen -
Navn 
Sted 
Alder
```
### Posisjonelle parametere
Når du bruker posisjonelle parametere i PowerShell, trenger du ikke å navngi dem – så lenge du oppgir verdiene i samme rekkefølge som funksjonen forventer.
Funksjonen bruker _parameterbinding_ og sjekker parameterens _position_-egenskap i funksjonsdefinisjonen. Posisjonene starter fra `0`, der første verdi går til parameteret med `Position = 0`, neste til `Position = 1`, osv.
Fordelene med å bruke posisjonelle parametere er at du får kortere og mer konsise kommandoer som er raske å skrive og lese for erfarne brukere.
For nye bruke kan det bli uklart å forstå hva som går hvor, og endringer i rekkefølgen kan føre til feil. I (komplekse) skript vil dette være mindre lesbart. 

For eksempel hvis vi endrer på parameter-blokken til Skriv-Hilsen for å kunne benytte posisjonelle parametere: 
```powershell
function Skriv-Hilsen {
    param (
        [Parameter(Position = 0)]
        [string]$Navn,

        [Parameter(Position = 1)]
        [string]$Sted,

        [Parameter(Position = 2)]
        [int]$Alder
    )

    "$Navn er $Alder år gammel og bor i $Sted."
}

# Bruk med posisjonelle verdier
Skriv-Hilsen "Kjetil" "Ålesund" 43
Kjetil er 43 år gammel og bor i Ålesund.

# Feil rekkefølge
Skriv-Hilsen 43 "Kjetil" "Ålesund"
# Output: 43 er Ålesund år gammel og bor i Kjetil.

# Bruk med navngitte parametere
Skriv-Hilsen -Navn "Kjetil" -Sted "Ålesund" -Alder 43
Kjetil er 43 år gammel og bor i Ålesund
```
### Switch parameters
Switch parametere i PowerShell-funksjoner (og cmdlets) som ikke krever en verdi. Det er tilstedeverærlsen eller fraværet av parameteret som avgjør om verdien tolkes som `true` eller `false` – altså en boolsk tilstand. 

Hvis _switch parameteret_ er tilstede når funksjonen kjøres, tolkes det som `$true`. Hvis den utelates, tolkes som `$false`. 

Du deklarerer _switch parametere_ i en funksjon ved å bruke typeakseleratoren `[switch]`: 
```powershell
function Skriv-Hilsen {
    param (
        [switch]$SwitchParameter
    )
    if ($SwitchParameter) {
        Write-Host "Velkommen (True)"
    } else {
        Write-Host "Hei (False)"
    }
}

# Bruk
Skriv-Hilsen -SwitchParameter
Velkommen (True)

Skriv-Hilsen
Hei (False)
```
Her er _switch parameteret_ benyttet med et `if`-uttrykk for å styre oppførselen.
#### Vanlige switch-parametere i avanserte funksjoner
Når du bruker `[CmdletBinding]` i  funksjonen, får du tilgang til flere innebygde _switch-parametere_: 
- `-Force` – unngår bekreftelsesspørsmål
- `-Confirm`  – ber om eksplisitt bekreftelse før handling
- `-Verbose` – viser detaljert output
- `-WhatIf`  – viser hva som ville skjedd uten å utføre handlingen

Eksempler på bruken av disse finner du i seksjonen _Eksempel på funksjon med parametere_.
### Splatting
[_Splatting_](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-7.5) er en metode for å sende en samling av parameterverdier til en funksjon eller cmdlet som en enhet. Dette gjør kommandoer kortere, mer lesbare og enklere å vedlikeholde – spesielt når du har mange parametere eller gjenbruker verdiene flere steder.

PowerShell vil automatisk matche hver verdi i samlingen med riktig parameter i kommandoen. Verdiene lagres i spesialnavngitte splatting-variabler, som ligner normale variabler,  men starter med `@` i stedet for `$`.

Fra tidligere eksempel i funksjonen `Skriv-Hilsen` vil man fylle ut parameterne slik:
```powershell
Skriv-Hilsen -Navn "Kjetil" -Sted "Ålesund" -Alder 43
```
Ved å bruke _splatting_ vil det kunne se slik ut:
```powershell
$Parametre = @{
	Navn = "Kjetil"
	Sted = "Ålesund"
	Alder = 43
}
Skriv-Hilsen @Parametre
```
Her brukes `@Parametre` for å sende inn alle verdiene til funksjonen som en enhet. Dette gjør koden mer kompakt og tydelig – selv i et lite eksempel som dette – og gir ekstra verdi når funksjonen har mange parametere eller brukes flere steder.

Det finnes tre metoder som kan benyttes når du bruker _splatting_ i PowerShell: 
- Hashtabeller – for navngitte parametere
- Arrays (lister) – for posisjonelle verdier
- PSCustomObject – for strukturert data med egenskaper som matcher parameternavn
#### Splatting syntaks
_Splatting_ lar deg sende inn parameterverdier til en funksjon på en mer strukturert måte. Du kan bruke både _hashtabeller_ og _arrays_, avhengig av om du jobber med navngitte eller posisjonelle parametere.

Generell syntaks for _splatting_:
```powershell
<CommandName> <optional parameters> @<HashTable> <optional parameters>
<CommandName> <optional parameters> @<Array> <optional parameters>
```
- `@<HashTable>` brukes når du vil sende inn `navn-verdi`-par for parametere
- `@<Array>` brukes når du sender inn posisjonelle verdier, altså når rekkefølgen er viktig og parameternavn ikke kreves
#### Splatting med hash tables
Som nevnt så bruker du [hashtabeller](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_hash_tables?view=powershell-7.5#syntax) når du vil sende inn `navn-verdi`-par til funksjonens  parametere, og kan brukes for alle parameter typer, inkludert posisjonelle og switch. 
```powershell
$Parametre = @{
	Navn = "Kjetil"
	Sted = "Ålesund"
	Alder = 43
}
Skriv-Hilsen @Parametre
```
Hvis navnene ikke stemmer, vil funksjonen ikke motta verdien.
#### Splatting med arrays
Når du sender inn posisjonelle verdier gjennom `arrays` kreves det ikke parameternavn, men verdiene i listen må komme i riktig rekkefølge.
```powershell
$Parametre = @("Kjetil", "Ålesund", 43)
Skriv-Hilsen @Parametre
```
Array-splatting fungerer kun hvis funksjonen har parametere definert med posisjonsindekser, eller hvis du stoler på standard rekkefølge. Det er mer sårbart for feil enn hashtabeller.
#### Bruk av `[PSCustomObject]` med splatting
[`[PSCustomObject]`](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-pscustomobject?view=powershell-7.5) brukes oftest når du jobber med data som skal behandles videre, lagres, eller sendes mellom funksjoner – det er ikke nødvendig for enkel parameterinnsending.
Dette er nyttig hvis du skal jobbe med 
- Strukturerte data som skal behandles videre
- Lagre, eksportere eller transformere data til for eksempel CSV eller JSON
- Legge til metoder eller egenskaper på objekter med `Add-Member`
- Trenger typeinformasjon eller vil bruke objektet til typedefinisjoner
- Bevare rekkefølgen på egenskaper, i motsetning til hashtabeller

> [!TIPS]
> >Benytter du syntaksen `$Parameter = [ordered]@{}` vil [output komme i riktig rekkefølge](https://youtu.be/8oesn0HgGxE?t=525).

Du deklarerer objektet ved å tilføye `[PSCustomObject]` foran `@{}`.

Under er et eksempel på hvordan du kan opprette et objekt, legge til en metode og kalle opp objektet. Det demonstrer hvordan du kan jobbe med strukturert data og utvide objekter med egenskaper og funksjonalitet. 
```PowerShell
function Skriv-Hilsen {
    param (
        [string]$Navn,
        [string]$Sted,
        [int]$Alder
    )
    "Hei $Navn fra $Sted, du er $Alder år gammel."
}

$Objekt = [PSCustomObject]@{
    Navn = "Kjetil"
    Sted = "Ålesund"
    Alder = 43
}

$Objekt | Add-Member -MemberType ScriptMethod -Name "Hilsen" -Value {
  return "Hei $($this.Navn) fra $($this.Sted)!"
}

$Objekt.Hilsen()
Hei Kjetil fra Ålesund!
```
Eksemplet viser ikke direkte bruk av splatting, ettersom `[PSCustomObject]` ikke støtter splatting inn i funksjoner uten å først bli konvertert til en hashtabell. 
```powershell
# Konverter objektet til hashtabell for splatting
$Parametre = @{}
foreach ($property in $Objekt.psobject.Properties.Name) {
    $Parametre[$property] = $Objekt.$property
}

# Bruk
Skriv-Hilsen @Parametre
Hei Kjetil fra Ålesund, du er 43 år gammel.
```
#### Sammenligning 
| Type               | Bruksområde                              | Fordeler                                                          | Begrensninger                                                  |
| ------------------ | ---------------------------------------- | ----------------------------------------------------------------- | -------------------------------------------------------------- |
| **Hashtabell**     | Navngitte parametere (`navn = verdi`)    | Lesbart, fleksibelt, støtter alle parametertyper                  | Må matche parameternavn nøyaktig                               |
| **Array**          | Posisjonelle verdier (rekkefølge viktig) | Kort og enkel syntaks                                             | Rekkefølge må være korrekt, ingen støtte for switch-parametere |
| **PSCustomObject** | Strukturert data med egenskaper          | Kan brukes som input og output, støtter metoder og typedefinisjon | Litt mer kompleks syntaks, krever forståelse av objekter       |
### Pipeline og input

#### Piping objects
Objekter sendes via pipeline til funksjoner
Brukes ofte med ValueFromPipelineByPropertyName
Eksempel: Get-Process | Where-Object { $_.CPU -gt 100 }
about_Functions – Microsoft Learn
#### Piping values
Primitive verdier som int, string, bool
Brukes med ValueFromPipeline
Eksempel: 1,2,3 | ForEach-Object { $_ * 2 }
about_Pipelines – Microsoft Learn
#### Hvordan funksjoner mottar pipet input
Bruk av [Parameter(ValueFromPipeline)]
Bruk av [Parameter(ValueFromPipelineByPropertyName)]
Binding skjer automatisk hvis parameternavn matcher egenskapsnavn
Krever riktig funksjonsstruktur for å fungere
about_Functions_Advanced_Parameters – Microsoft Learn
### Struktur  for pipet input

#### `begin`, `process` og `end`
Begin: kjøres én gang før pipeline starter
Process: kjøres én gang per objekt i pipeline
End: kjøres én gang etter pipeline er ferdig
Brukes i avanserte funksjoner med CmdletBinding()
about_Functions_Advanced – Microsoft Learn
#### Eksempler med `ValueFromPipeline`
Funksjoner som tar imot pipet input og behandler det i Process
Eksempel: filtrering, logging, transformering
Bruk av $_ og foreach i Process
about_Functions_CmdletBindingAttribute – Microsoft Learn
#### Når trenger du denne strukturen – Når trenger du den ikke
Trenger Begin/Process/End når du skal behandle pipet input
Ikke nødvendig ved enkle funksjonskall med parametere
Overkill for små funksjoner uten pipeline
Kilder:
PowerShell by Example – Custom Objects

VURDER Å FYLLE UT MER UNDER `PROCESS`

Blokkene definerer _tre faser_ i en funksjon

| Blokk     | Når den kjører               | Typisk bruk                          |
| --------- | ---------------------------- | ------------------------------------ |
| `begin`   | Før første input mottas      | Initialisering, åpne ressurser       |
| `process` | For hver pipet verdi         | Utføre operasjon per input           |
| `end`     | Etter all input er behandlet | Avslutning, oppsummering, opprydding |
PowerShells blokkstruktur med `begin`, `process` og `end` gir funksjoner en modulær og oversiktlig oppbygning. 
I `begin` kan du forberede alt som trengs før behandlingen starter – for eksempel åpne filer eller initialisere variabler som trengs før behandlingen starter. 
Deretter håndterer `process` hver verdi som kommer gjennom en pipe, slik at funksjonen effektivt kan operere på flere elementer. 
Til slutt lar `end` deg rydde opp, oppsummere eller lukke ressurser når alt er ferdigbehandlet. Denne tredelingen gir både fleksibilitet og klarhet, spesielt når du jobber med piped input eller skript med flere steg.

Ja, `process` bør fylles ut mer – gjerne med et eksempel som viser hvordan en funksjon håndterer pipet input én og én gang.
### Omfang og synlighet
#### Scope
Du kan vise `$global:`, `$script:`, `$local:` og `$private:` med eksempler.
#### Best practice

## Finne og administrere funksjoner i `Function:`
- Bra overgang fra struktur til praktisk bruk.
    
- Her kan du vise `Get-Command`, `Get-Content Function:Navn`, og `Remove-Item Function:Navn`.
## Gjenbruk av funksjoner i nye sesjoner
- Forklar forskjellen på midlertidige funksjoner og lasting via profil eller modul.
## Opprette `Help` for funksjoner
- Vis `Comment-Based Help` med `.SYNOPSIS`, `.DESCRIPTION`, `.EXAMPLE`, osv.
## Avanserte funksjoner
### `CmdletBinding()`
- Du kan vise hvordan disse gir funksjonen cmdlet-lignende oppførsel.
### Advanced Methods
### Advanced Parameters
### OutputTypeAttribute
