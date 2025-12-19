---
title: Variabler og data
nav_order: 5
parent: PowerShell Challenge
has_children:
---

## Utforskning av variabler og datatyper i PowerShell

### Variabler
[Variabler](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_variables?view=powershell-7.5) er minnenheter der verdier lagres. I PowerShell kan du kommandoresultater, navn, stier innstillinger og andre uttrykk i variabler.
Variabler i PowerShell starter med et dollartegn (`$`), for eksempel  `$A`, `$Process` eller `$My_var`. Variabelnavn er ikke bokstavfølsomme og kan inneholde [mellomrom og spesialtegn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_variables?view=powershell-7.5#variable-names-that-include-special-characters), men disse kan være vanskelige å bruke, så de bør unngås.
#### Variabeltyper
PowerShell har flere typer variabler:
- _Brukerdefinerte variabler_ – Opprettes og vedlikeholdes av brukeren. Disse eksisterer kun i det åpne PowerShell-vinduet og slettes ved lukking, med mindre de lagres i en PowerShell-profil. Variabler kan også ha global, skript eller lokal omfang.
- _Automatiske variabler_ – Opprettes og oppdateres av PowerShell for å lagre viktig systemtilstand. For eksempel lagrer `$PSHOME` installasjonsstien til PowerShell. Brukeren kan **ikke** endre disse variablene. [Se en fullstendig liste over disse variablene](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.5).
- _Preferansevariabler_ – Lagrer brukerpreferanser for PowerShell. De har standardverdier, men kan endres av brukeren. For eksempel bestemmer `$MaximumHistoryCount` maksimalt antall kommandoer som lagres i en sesjon. [Se en komplett liste](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.5).

### Arbeide med variabler
Når du oppretter en ny variabel kan du tildele den en verdi. Tildeler du ikke en verdi før bruk vil den få standardverdien [`$null`](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-null?view=powershell-7.5). `$null$` representerer en tom eller udefinert verdi. Hvis en kommandoen krever en verdi og mottar `$null`, kan det føre til en feilmelding.

For en komplett liste over alle variablene i en sesjon benyttes kommandoen [`Get-Variable`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-variable?view=powershell-7.5). Variabelnavnene vises uten `$`.

Ønsker du å opprette en variabel med egne verdier gjør du følgende

```powershell
$MyVariable = 1, 2, 3
$MyPath = "C:\Windows\System32"
```

For å lagre resultatet av en kommando gjør du følgende

```PowerShell
$Processes = Get-Process

$Today = (Get-Date).DateTime
```

For å hente verdiene i variablene skriver du inn variabelnavnet

```powershell
$MyVariable
```

Resultat

```powershell
1
2
3
```

Skulle du ønske å endre verdien i variabelen tildeler du ny verdi på samme måte som da du opprettet den

```PowerShell
$MyVariable = "Kaffe er dagens viktigste måltid"

$MyVariable
Kaffe er dagens viktigste måltid
```

Ønsker du å _slette verdien_ i en variabel benyttes kommandoen [`Clear-Variable`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/clear-variable?view=powershell-7.5), dette setter verdien i variabelen til `$null`. Du kan også gjøre som over og sette verdien til `$null`.

```powershell
Clear-Variable -Name MyVariable

$MyVariable = $null
```

For å slette variabelen kan dette gjøres med på to forskjellige kommandoer; [`Remove-Variable`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/remove-variable?view=powershell-7.5)  og [`Remove-Item`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.5)

```powershell
Remove-Variable -Name MyVariable

Remove-Item -Path Variable:\MyVariable
```

Det er mulig å sette verdier til flere variabler i samme uttrykk.
For eksempel hvis du vil sette verdien `0` til tre forskjellige variabler

```powershell
$a = $b = $c = 0
```

Vil du sette flere verdier til flere variabler samtidig

```PowerShell
$i,$j,$k = 10, "red", $true    # $i is 10, $j is "red", $k is True
$i,$j = 10, "red", $true       # $i is 10, $j is [Object[]], Length 2
```

En detaljert forklaring på dette temaet finner i [about_Assignment_Operators](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_assignment_operators?view=powershell-7.5#assigning-multiple-variables).
## Variabeltyper
Du kan lagre alle typer objekter i en variabel, inkludert heltall, strenger, tabeller og hashtabeller. Du kan også lagre objekter som representerer for eksempel prosesser og tjenester.

PowerShell-variabler er ikke begrenset til en bestemt objekttype. En enkelt variabel kan inneholde en samling – eller en array – av forskjellige objekttyper.

Datatypen til en variabel bestemmes av _.NET-typen_ til verdien den inneholder. For å vise objekttypen til en variabel, kan du bruke kommandoen [`Get-Member`](stuff/Powershell-challenge/Day-1–10-Help.md#Get-Member).

```powershell
$a = 12                         # System.Int32
$a = "Word"                     # System.String
$a = 12, "Word"                 # array of System.Int32, System.String
$a = Get-ChildItem C:\Windows   # FileInfo and DirectoryInfo types
```

Du kan bruke _typeattributter_ og _typetvungne_ variabler (cast notation) for å sikre at en variabel kun kan inneholde objekter av en bestemt type – eller objekter som kan konverteres til den typen.
Hvis du prøver å tilordne en verdi av en annen type, vil PowerShell forsøke å konvertere verdien. Hvis konverteringen mislykkes, feiler tilordningen.

For bruke _cast notation_, skriver typen i hakeparanteser før variabelnavnet.
Eksempler:
- `[int]$Number` – Variabelen vil kun akseptere heltall (eller verdier som kan konverteres til heltall)
- `[string]$Words` – Variabelen vil kun akseptere strenger
- `[DateTime]$Dates` – Variabelen vil kun akseptere DateTime-objekter

```powershell
[int]$number = 8
$number = "12345"  # The string is converted to an integer.
$number = "Hello"  # This will give an error

[string]$words = "Hello"
$words = 2       # The integer is converted to a string.
$words += 10     # The plus (+) sign concatenates the strings.
$words
210

[datetime] $dates = "09/12/91"  # The string is converted to a DateTime object.
$dates
Thursday, September 12, 1991 00:00:00

$dates = 10    # The integer is converted to a DateTime object.
$dates
Monday, January 1, 0001 00:00:00
```
## Bruk av variabler i kommandoer og uttrykk
For å bruke variabler i kommandoer eller i uttrykk skrives variabelnavnet med en `$` foran.

Hvis variabelnavnet med dollartegnet ikke er omsluttet av anførselstegn, enkle eller doble, vil verdien av variabelen bli brukt i kommandoen. For mer informasjon om bruk av anførselstegn

Eksempel på bruk av doble anførselstegn `"`

```powershell
$name = "Kjetil"
Write-Output "Hei, $name!"   # Output: Hei, Kjetil!
```

Eksempel på bruk av enkle anførselstegn `'`

```powershell
$name = "Kjetil"
Write-Output 'Hei, $name!'   # Output: Hei, $name!
```
## Variabelnavn som inkluderer spesialtegn
Variabelnavn begynner alltid med et dollartegn (`$`) og kan inneholde både alfanumeriske tegn og spesialtegn. Lengden på variabelnavnet er kun begrenset av tilgjengelig minne.

Det er sjelden man _ønsker_ å bruke `{}` og spesialtegn i variabelnavn i PowerShell – men det **kan være nyttig i visse tilfeller**, spesielt når man arbeider med automatisering, dynamisk variabelhåndtering, eller data som ikke følger konvensjonelle navnestandarder.
Det bør unngås med mindre det er helt nødvendig. Selv om PowerShell tillater det, gjør slike navn ofte koden **vanskelig å lese og feilsøke**. Beste praksis er fortsatt å holde seg til enkle, alfanumeriske navn med understrek.

_Den beste praksisen er å bruke bare alfanumeriske tegn (Aa–Zz, 0–9) og understrek (**`_`**) i variabelnavn._

Ønsker du å benytte andre tegn eller mellomrom, er dette mulig, men det kan skape utfordringer, som at variabelen må omsluttes av klammeparenteser (`{}`) og kan bli vanskelig å lese og vedlikeholde i kode.

```Powershell
${"Min variabel!"} = "Testverdi"
Write-Output ${"Min variabel!"}
```

PowerShell har reservert noen variabeler `$$`, `$?`, `$^` og `$_` som inneholder alfanumeriske og spesialtegn. Disse variablene brukes til spesifikke formål og har forhåndsdefinert atferd i PowerShell. Du kan lese mer om dette i [about_Automatic_Variables](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.5).

## Variabler og omfang (scope)
Som standard er variabler bare tilgjengelige i det omfanget de er opprettet i.

Lager du en funksjon med variabler er disse kun tilgjengelige inne i funksjonen. Det samme gjelder også for skript.
Hvis du derimot _dot-sourcer_ et skript, vil variabelen bli lagt til gjeldende omfang som du jobber i.

Du kan bruke en omfangsmodifikator for å endre standard-omfanget til variabelen.

```powershell
$Global:Computers = "Server01"
```

Uttrykket over oppretter en variabel med navnet `Computers` ved hjelp av omfangsmodifikatoren `Global:`. Variabelen får dermed globalt omfang, selv når den er opprettet i et skript eller funksjon.

Ved kjøring utenfor nåværende sesjon, som ved remoting eller bakgrunnsjobber, må `Using:` brukes for å hente variabler fra det gjeldende omfanget. Du kan lese mer om dette i [about_Remote_Variables](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_remote_variables?view=powershell-7.5).

Du kan lese mer om omfang i [about_Scopes](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_scopes?view=powershell-7.5).
## Lagring av variabler
Variabler du oppretter er som standard kun tilgjengelige i den aktive sesjonen. Når du avslutter PowerShell-økten, slettes de automatisk.

Ønsker du å opprette variabler som er tilgjengelig i alle fremtidige sesjoner må du legge dem inn i PowerShell-profilen din.

En PowerShell-profil er et skript som kjøres automatisk når du starter PowerShell. Du kan bruke den til å forhåndsdefinere variabler, aliaser, funksjoner og innstillinger som du vil ha tilgjengelig i hver økt.
For eksempel – dersom du vil endre standardverdien til `$VerbosePreference`, kan du legge til følgende linje i profilen din:

```powerShell
$VerbosePreference = "Continue"
```

Du åpner profilen med følgende kommando:

```powershell
notepad.exe $PROFILE
```

Du kan lese mer om profiler i dokumentasjonen:  [about_Profiles](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.5).
## `Variable:`-stasjonen
PowerShells variabelleverandør oppretter en `Variable:`-stasjon som ser ut og oppfører seg som en filsystemstasjon, men som i stedet inneholder variablene i økten din med tilhørende verdier.

Stasjonen er en del av PowerShells _PSProvider-system_, som gjør det mulig å navigere i ulike datastrukturer (som `Env:`, `Alias:`, `Function:` og `Variable:`) som om de var filsystemer.

For å gå til `Variable:`-stasjonen brukes følgende kommando:

```PowerShell
Set-Location Variable:
```

Du kan vise innholdet i stasjonen ved å bruke kommandoene `Get-Item` eller `Get-ChildItem`

```PowerShell
Get-ChildItem Variable:

Name                           Value
----                           -----
ConfirmPreference              High
DebugPreference                SilentlyContinue
```

For mer informasjon om `Variable:`-stasjonen variabelleverandør, bruk kommandoen `Get-Help`

```powershell
Get-Help Variable
```
## Datatyper
En [_datatype_](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-04?view=powershell-7.5) beskriver hvilken type informasjon en verdi representerer – for eksempel et heltall, en tekststreng, et desimaltall, en dato eller en tabell. I PowerShell er alt et objekt, og hver verdi har en _underliggende .NET-type_, som `System.String` for tekst og `System.Int32` for heltall. 

Selv om PowerShell automatisk gjenkjenner og håndterer datatyper for deg, har du mye å vinne på å forstå og bruke typene bevisst. Når du vet hvilken type data du arbeider med – som `string`, `int` eller `DateTime` – kan du skrive skript som er mer presise, robuste og forutsigbare. Det gjør det lettere å sammenligne og konvertere verdier riktig, bruke riktige metoder og unngå frustrerende feil i beregninger og funksjonskall. 

Det å bruke denne fleksibiliteten bevisst gir deg muligheten til å skrive skript som virker som tiltenkt og skalerer – ikke fordi PowerShell krever streng typetenkning, men fordi du vet når det lønner seg å være tydelig og bevisst på hva slags data du faktisk håndterer.

Som nevnt over gjenkjennes normalt datatyper automatisk basert på verdiene du oppgir, noe som gjør det raskt og fleksibelt å skrive enkle skript. Du trenger for eksempel ikke å si at `42` er et heltall – PowerShell tolker det for deg. 

I situasjoner der du trenger nøyaktighet – som ved beregninger, sammenligninger, validering, eller når du skal bruke metoder som kun finnes på bestemte typer – lønner det seg å angi typen eksplisitt. Dette gjør du ved å plassere _typeakseleratoren_ (`[int]`, `[string]`,  `[datetime]` osv) foran `$` i variabelnavnet. 

Eksempel: Eksplisitt versus automatisk typegjenkjenning: 
- `[int]$Tall` = 42  – eksplisitt definert
- $Tall = 42 – automatisk håndtert

En _typeakselerator_ i PowerShell er en forkortelse for en _.NET-type_, som lar deg skrive for eksempel `[int]` i stedet for `[System.Int32]`. Det gjør koden kortere og lettere å lese – uten å miste funksjonalitet.
Du finner en full oversikt over typeakseleratorer i [about_Type_Accelerators – PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_type_accelerators?view=powershell-7.5). 

### Vanlige datatyper
Her er en oversikt over vanlige datatyper i PowerShell, med tilhørende typeakselerator, kort forklaring og eksempel:

|**Typeakselerator**|**Beskrivelse**|**Eksempelverdi**|**.NET-type**|
|---|---|---|---|
|`[int]`|Heltall (32-bit)|`42`|`System.Int32`|
|`[long]`|Stort heltall (64-bit)|`1234567890123`|`System.Int64`|
|`[float]` / `[double]`|Flyttall med desimaler|`3.14`|`System.Double`|
|`[decimal]`|Presist desimaltall (f.eks. valuta)|`199.99`|`System.Decimal`|
|`[bool]`|Sann/usann-verdi|`$true`, `$false`|`System.Boolean`|
|`[char]`|Ett enkelt tegn|`'A'`|`System.Char`|
|`[string]`|Tekststreng|`"Hei verden"`|`System.String`|
|`[array]`|Samling av verdier|`@("rød", "grønn")`|`System.Array`|
|`[hashtable]`|Nøkkel/verdi-par|`@{Navn='Eva'; Alder=30}`|`System.Collections.Hashtable`|
|`[datetime]`|Dato og klokkeslett|`Get-Date`|`System.DateTime`|
|`[regex]`|Regulært uttrykk|`[regex]'^\d{3}$'`|`System.Text.RegularExpressions.Regex`|
|`[scriptblock]`|Gjenbrukbar kodeblokk|`{ $x * 2 }`|`System.Management.Automation.ScriptBlock`|
|`[pscustomobject]`|Strukturert egendefinert objekt|`[pscustomobject]@{ID=1}`|`System.Management.Automation.PSCustomObject`|

### Når bruker man hva
Her er noen typiske bruksområder for vanlige datatyper, slik de ofte brukes i PowerShell skript:

| **Datatype**    | **Typisk bruksscenario**                                                                   |
| --------------- | ------------------------------------------------------------------------------------------ |
| `[int]`         | Telling, løkker, beregninger (`for`-løkker, summering, sammenligninger)                    |
| `[string]`      | Brukes nesten overalt: tekstbehandling, utskrift, filbaner, brukernavn                     |
| `[bool]`        | I betingelser og kontrollflyt: `if ($isReady -eq $true)`                                   |
| `[datetime]`    | Tidsstempling, aldersberegning, filtrering etter dato (`Where-Object { $_.Date -gt ... }`) |
| `[array]`       | For å håndtere lister eller flere verdier (`$files = Get-ChildItem`)                       |
| `[hashtable]`   | Når du trenger fleksibel lagring med nøkler – f.eks. konfigurasjonsdata                    |
| `[decimal]`     | Finansiell logikk, eksakte desimaltall, valuta                                             |
| `[scriptblock]` | Når du trenger å sende inn kode som et argument – f.eks. . til `Invoke-Command`            |
| `[regex]`       | Mønstersøk i tekst, f.eks. . e-postvalidering eller nummerformat                           |
### Hvordan finne datatypen
For å finne datatypen til en variabel eller verdi kan man benytte metoden `.GetType()` sammen med egenskapen `Name`:

```PowerShell
$a = 42
$a.GetType().Name
Int32 # Datatypen er heltall, vist her med PowerShells kortform ([Int]) 
```

For å hente ut fullt typenavn kan du bytte ut egenskapen `Name` med `FullName`

```PowerShell
$a.GetType().FullName
System.Int32 # Den fullstendige .NET-typen for heltall
```
### Heltall – `Integer`
Heltall, eller `Integer`, er tall uten desimaler og kan enten være både positive, negative eller null. I PowerShell representeres dette med [int] ,[long] eller [byte]:
- Typen [int] bruker _32 bits_, og har et omfang fra -2147483648 til +2147483647
- Typen [long] bruker _64 bits_, og har et omfang fra -9223372036854775808 til +9223372036854775807
- Typen [byte] bruker _8 bits_, og har et omfang fra 0 til 255

Du kan bruke bruke de innebygde statiske egenskapene `MaxValue` og `MinValue` for å finne grensene direkte – uten å opprette en variabel først: 

```powershell
[int]::MaxValue
2147483647

[int]::MinValue
-2147483648
```

[byte], [int] og [long] er _typeakseleratorer_ for henholdsvis `System.Byte`, `System.Int32` og `System.Int64`.
#### Syntaks
Slik ser syntaksen ut for å deklarere et heltall i PowerShell:
```powershell
[int]$Tall = 42
```

#### Automatisk typekonvertering
Selv uten `[int]` vil PowerShell vanligvis tolke verdier som heltall når det er naturlig

```powershell
$X = 100
$X.GetType().Name
Int32 # resultat
```
#### Konvertering fra tekst til heltall
Ved input fra filer, API-er eller brukere kommer tall ofte som tekst, og må konverteres før du kan gjøre beregninger. 

```powershell
$Input = "123"
[int]$Verdi = $Input # Sikker eksplisitt konvertering
```
#### Eksempel: Summere heltall med motsatt fortegn
Hvordan deklarere positive og negative heltall og deretter bruke det i en enkel utregning
```powershell
[int]$PositiveInteger = 42
[int]$NegativeInteger = -42

$Sum = $PositiveInteger + $NegativeInteger

Write-Output $Sum

0 # resultat
```
#### Eksempel: Sjekke om et tall er partall
```powershell
[int]$Tall = 42

if ($Tall % 2 -eq 0) {
	"Tallet $Tall er et partall"
} else {
	"Tallet $Tall er et oddetall"
}
Tallet 42 er et partall # resultat
```
#### Eksempel: Bruk av heltall i en `if`-test
```powershell
[int]$Grense = 100
[int]$Verdi = 75

if ($Verdi -lt $Grense) {
	"Verdigen $Verdi er innenfor grensen."
} else {
	"Verdien $Verdi overskrider grensen."
}

Verdigen 75 er innenfor grensen. # resultat
```
#### Eksempel: Bruk av usignert heltall
Et _usignert heltall_ (unsigned integer) er en heltallsverdi som kun kan være null eller positiv – altså fra 0 og oppover.  Dette kan fvære nyttig i situasjoner der du vet at negative tall er utgyldige – for eksempel antall, ID-er eller byteverdier. 

PowerShell har ikke en typeakselerator for dette, så du må bruke  .Net-typen `[System.UInt32]`: 

```powershell
[System.UInt32]$Verdi = 100
```

### Flyttall – `Float, Double`
Flyttall, altså `Float` og `Double`, brukes til å representere tall med desimaler. De skiller seg fra hverandre i hvor presise de er og hvor mange desimaler de kan håndtere:
- `Float`, enkel presisjon (32 bit) – passer nå høy nøyaktighet ikke er kritisk
- `Double`, dobbel presisjon (64 bit) – brukes ved behov for mer nøyaktige kalkulasjoner.
Begge typene brukes i PowerShell via .NET-systemet, og tolkes som henholdsvis `System.Single` og `System.Double`.
#### Syntaks
Slik deklarerer du `Float` og `Double` i PowerShell:

```PowerShell
[float]$FloatVariable = 3.14
[double]$DoubleVarible = 3.141592653589793
```
#### Eksempel: `Float` – mulighet for avrundingsfeil
```powershell
[float]$A = 3.33
[float]$B = 3.33   
[float]$C = 3.33   
$D = $A + $B + $C
Write-Output $D

9,98999977111816 # avrundingsfeil
```
Flyttall med enkel presisjon (`float`) kan gi små avvik i beregninger på grunn av måten tallene lagres i binær form.
#### Eksempel: `Double` – bedre presisjon
```powershell
[double]$A = 3.33
[double]$B = 3.33
[double]$C = 3.33
$D = $A + $B + $C
Write-Output $D

9,99 # riktigere avrunding
```
`Double` bruker dobbel presisjon, og gir dermed mer nøyaktige resultater i matematiske operasjoner med desimaler.

Selv `Double` er ikke 100% nøyaktig i alle tilfeller. Hvis du jobber med valuta eller trenger helt eksakte desimaler, bør du bruke `[decimal]` i stedet.
### Desimaltall – `Decimal`
`Decimal` brukes når du behøver høy presisjon i beregninger, særlig der selv små avrundingsfeil er uakseptable – som ved valutaberegninger, skatteutregninger eller vitenskaplige målinger. 

I motsetning til `float`og `double`, lagres `decimal`med høyere nøyaktighet, men mindre rekkevidde.

`[decimal]` tilsvarer .NET-typen `System.Decimal` og gir opptil 28-29 sifre presisjon. 

Desimaltall uten typeangivelse tolkes som regel automatisk som `double`, så du bør bruke `[decimal]` eksplisitt når nøyaktighet er viktig.
#### Syntaks

```powershell
[decimal]$DecimalVariable = 42.42
```
#### Eksempel: Presis desimalberegning

```powershell
[decimal]$Pris = 99.95
[decimal]$Mva = 0.25
$Total = $Pris * (1 + $Mva)
Write-Output $Total

124.9375 
```

Hvis samme beregning gjøres med `float`, kan resultatet se slik ut: 124,937496185303 – en liten, men potensielt viktig avrundingsfeil.
### Tekst – `String`
`String` er en sekvens av tegn som representerer tekst. I PowerShell er tekst av typen `[string]`. Strenger støtter en rekke metoder, inkludert sammenslåting (`concatenation`), uttrekk av delstrenger (`substring extraction`) og mønstergjenkjenning (pattern matching).

#### Syntaks
Slik deklarerer du en `string` i PowerShell

```powershell
[string]$StringVariable = "Hello, World!"
```

#### Bruk av anførselstegn i `string`
PowerShell støtter to typer anførselstegn for å definere tekststrenger. 

| Tegn          | Betydning                                             |
| ------------- | ----------------------------------------------------- |
| `"` _(doble)_ | Streng med variabeltolkning (interpolasjon)           |
| `'` _(enkle)_ | Streng uten variabeltolkning – alt tolkes bokstabelig |

Bruk doble `"` når du vil sette sammen tekst dynamisk med variabler. 
Bruk enkle `'` når du vil bevare tekst nøyaktig som den er – for eksempel når du jobber med regex eller filbaner som inneholder `$`.

```powershell
$name = "Kjetil"

# Med doble anførselstegn – variabel evalueres
"Hei, $name!"
Hei, Kjetil! 

# Med enkle anførselstegn – variabelnavnet vises bokstavelig
'Hei, $name!'
Hei, $name! # resultat
```
#### Eksempel: Slå sammen tekst

```powershell
[string]$Greeting = "Hello"
[string]$Name = "World"
$FullGreeting = "$Greeting, $Name!"
Write-Output $FullGreeting

Hello, World! # resultat
```
#### Eksempel: Finne lengden på en streng

```powershell
[string]$Tekst = "Hello, World!"
$Lengde = $Tekst.Length
Write-Output $Lengde

13 # lengden på strengen
```

`Length`-egenskapen gir antall tegn i strengen, inkludert mellomrom og skilletegn.
#### Eksempel: Hente ut en del av strengen (substring)

```powershell
[string]$Tekst = "PowerShell"
$DelStreng = $Tekst.Substring(0,5)
Write-Output $DelStreng

Power # 5 første tegnene
```
Returnerer de fem første tegnene fra posisjon 0.
#### Eksempel: Finne tekstmønstre med `-like`
```powershell
[string]$Navn = "Kjetil"
if ($Navn -like "Kj*") {
    "Navnet starter med Kj"
}
Navnet starter med Kj # resultat
```
`-like` bruker `*` som jokertegn – nyttig for enkel mønstermatching.
#### Eksempel: Erstatte tekst med `.Replace()`

```Powershell
[string]$Streng = "Hei, verden!"
$Streng = $Streng.Replace("verden", "PowerShell")
Write-Output $Streng
Hei, PowerShell!
```
Perfekt for små justeringer i tekststrenger.
#### Eksempel: Sjekke om en streng inneholder et ord

```powershell
[string]$Streng = "Velkommen til PowerShell-kurset"
if ($Streng.Contains("PowerShell")) {
    "Finner teksten"
}
Finner teksten # resultat
```
Dette er raskt og lettfattelig når du skal test tilstedeværelse.
### Sann-/usann-verdi – `Boolean` 
Boolske verdier representerer sant eller usanne usant, og brukes i logiske operasjoner og kontrollflyt. I PowerShell er boolske verdier av typen `[bool]`. De er helt sentrale når du skal ta beslutninger i skript – for eksempel i `if`-setninger og løkker – der koden skal oppføre seg ulikt basert på bestemte vilkår.
#### Syntaks
Slik deklarerer du boolske verdier i PowerShell

```PowerShell
[bool]$BooleanVariable = $true
```

#### Eksempel: Bruk av `bool` i en betingelse

```PowerShell
[bool]$IsTrue = $true
[bool]$IsFalse = $false

# Sjekk av betingelse
if ($IsTrue) {
    Write-Output "Dette er sant."
} else {
    Write-Output "Dette er usant."
}
Dette er sant. # reslultat
```
#### Eksempel: Boolean fra sammenligning

```powershell
[int]$Alder = 20
[bool]$ErMyndig = $Alder -ge 18
Write-Output $ErMyndig
True # resultat
```
PowerShell evaluerer uttrykket `$Alder -ge 18` og lagrer resultatet som en boolsk verdi.
#### Eksempel: Snu en boolsk verdi med `-not`

```powershell
[bool]$HarTilgang = $false
if (-not $HarTilgang) {
    "Tilgang nektes"
}
Tilgang nektes # resultat
```
`-not` brukes for å snu en boolsk verdi.
#### Eksempel: Kombinere betingelser med `-and` og `-or`

```powershell
[int]$Alder = 25
[bool]$ErMedlem = $true
if ($Alder -ge 18 -and $ErMedlem) {
    "Du har tilgang til tjenesten"
}
Du har tilgang til tjenesten # resultat
```

Du kan kombinere flere vilkår i en betingelse med `-and`, `-or` og `-xor`.
#### Eksempel: Boolean som løkkekontroll

```powershell
[bool]$Fortsett = $true
[int]$Teller = 0
while ($Fortsett) {
    Write-Output "Itereasjon $Teller"       
    $Teller++
    if ($Teller -ge 3) {
        $Fortsett = $false
    }
}
Itereasjon 0 # resultat
Itereasjon 1 # resultat
Itereasjon 2 # resultat
```

Den boolske variabelen brukes for å styre når løkken skal avsluttes.
#### Eksempel: Funksjon som returnerer boolsk verdi

```powershell
function Er-Myndig {      
    param (
        [int]$Alder       
    )
    return ($Alder -ge 18)
}

# Bruk funksjonen
if (Er-Myndig -Alder 16) {
    "Du er myndig."       
} else {
    "Du er ikke myndig."  
}
Du er ikke myndig. # resultat
```

Funksjonen sjekker om en brukers alder er over grensen for myndighet og returnerer en boolsk verdi. Resultatet fra funksjonen brukes direkte i en `if`-setning for å bestemme hva som skal vises.
#### Eksempel: Funksjon som reagerer på en boolsk parameter

```powershell
function Vis-Hilsen {
    param (
        [bool]$Formell
    )
    if ($Formell) {
        "God dag, og velkommen."
    } else {
        "Hei, så hyggelig å se deg!"        
    }
}

# Kall funksjonen med ulike verdier
Vis-Hilsen -Formell $true
God dag, og velkommen. # resultat

Vis-Hilsen -Formell $false
Hei, så hyggelig å se deg! # resultat
```

Dette demonstrerer hvordan boolske verdier ikke bare brukes i logiske uttrykk, men også som en enkel måte å styre funksjoners oppførsel på – elegant og leservennlig.
Variabelen `$Formell` avgjør hvordan funksjonen svarer, og basert på om denne bestemmes det hvilken hilsen som skal benyttes. 
### Dato og klokkeslett – `DateTime`
Datoer representerer dato og tid verdier. I PowerShell er datoer av typen `[datetime]`, som gir tilgang til en rekke egenskaper (f.eks. `Day`, `Month`, `Year`) og metoder (f.eks. `AddDays(), `ToString()`), slik at du kan manipulerer og formatere dato og tid på en fleksibel måte.
#### Syntaks – hente dagens dato
Slik deklarerer du `[datetime]`

```PowerShell
[datetime]$DatoVariabel = Get-Date
```

Dette lagrer gjeldende dato og klokkeslett i variabelen `$DatoVariabel`.
#### Eksempel: Utskrift av dagens dato og tid
```powershell
$Now = Get-Date
Write-Output $Now

mandag 30. juni 2025 15:40:59 # resultat
```
#### Eksempel: Lage en spesifikk dato

```powershell
[datetime]$StartDato = [datetime]"2025.01.01"
Write-Output $StartDato

onsdag 1. januar 2025 00:00:00 # resultat
```
#### Eksempel: Trekke ut deler av datoen

```powershell
$Day = $StartDato.Day
1 # resultat

$Month = $StartDato.Month
1 # resultat

$Year = $StartDato.Year
2025 # resultat
```
#### Eksempel: Regne med datoer

```powershell
$NextWeek = $Now.AddDays(7)
Write-Output $NextWeek

mandag 7. juli 2025 15:40:59 # Resultat

# Endre hvordan datoen vises
$NextWeek = $Now.AddDays(7).ToString("dd.MM.yyyy")
Write-Output $NextWeek

07.07.2025 # Resultat
```
#### Eksempel: Beregne alder ut fra fødselsdato

```PowerShell
[datetime]$BirthDay = [datetime]"2000.06.30"
[datetime]$Now = Get-Date
[int]$Age = [math]::Floor(($Now - $BirthDay).TotalDays / 365.25)
Write-Output "Du er $Age år gammel."

Du er 25 år gammel. # Resultat
```
#### Eksempel: Dager igjen til jul

```powershell
[datetime]$Today = Get-Date
[datetime]$Christmas = [datetime]::ParseExact("24.12.$($Today.Year)", "dd.MM.yyyy", $null)
if ($Today -gt $Christmas) {
    $Christmas = $Christmas.AddYears(1)     
}
[int]$DaysLeft = ($Christmas - $Today).Days 
Write-Output "Det er $DaysLeft dager igjen til jul."

Det er 176 dager igjen til jul. # resultat
```
#### Eksempel: Oppetid på systemet

```powershell
[datetime]$LastBoot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
[timespan]$Uptime = (Get-Date) - $LastBoot  
Write-Output "Systemet har vært oppe i $($Uptime.Days) dager og $($Uptime.Hours) timer."

Systemet har vært oppe i 17 dager og 3 timer.  # resultat
```
#### Eksempel: Tilpasset datoformat med `.ToString()`

Når du bruker `.ToString()` vil standarden gi deg full dato og klokkeslett med tidssone. 

```powershell
[datetime]$Now = Get-Date

#ISO 8601-format
$Now.ToString("yyyy-MM-dd")
2025-06-30  # resultat

# Norsk stil - dag, måned og år
$Now.ToString("dd.MM.yyyy")
30.06.2025  # resultat

# Fullt klokkeslett
$Now.ToString("HH:MM:ss")
17:06:57  # resultat

# Dato og tid sammen
$Now.ToString("dd.MM.yyyy HH:mm")
30.06.2025 17:08

# Ukedag og måned med navn
$Now.ToString("dddd d. MMMM yyyy", [System.Globalization.CultureInfo]::GetCultureInfo("nb-NO"))
mandag 30. juni 2025  # resultat
```

Det nederste eksemplet viser hvordan du kan tilpasse formateringen med kulturinfo for å få språk og rekkefølge riktig.
#### Eksempel: Lage filnavn med tidsstempel

```powershell
# Hent tidspunktet nå
$Now = Get-Date

# Lag et filnavn med dato og tid (uten ulovlige tegn som ":" i filnavn)
$TimeStamp = $Now.ToString("yyyyMMdd_HHmmss")
$LogFileName = "log_$TimeStamp.txt"

Write-Output $LogFileName

log_20250630_173903.txt # resultat
```
#### Vanlige `datetime`-formateringskoder

| Formatkode           | Hva den betyr                   | Eksempelresultat   |
| -------------------- | ------------------------------- | ------------------ |
| `"yyyy"`             | Fire-sifret år                  | `2025`             |
| `"yy"`               | To-sifret år                    | `25`               |
| `"MM"`               | Måned med ledende null (01–12)  | `06`               |
| `"MMM"`              | Forkortet månedsnavn            | `Jun`              |
| `"MMMM"`             | Fullt månedsnavn                | `June`             |
| `"dd"`               | Dag med ledende null (01–31)    | `09`               |
| `"ddd"`              | Forkortet ukedag                | `Mon`              |
| `"dddd"`             | Full ukedag                     | `Monday`           |
| `"HH"`               | Timer (24-timersklokke)         | `16`               |
| `"hh"`               | Timer (12-timersklokke)         | `04`               |
| `"mm"`               | Minutter                        | `30`               |
| `"ss"`               | Sekunder                        | `07`               |
| `"tt"`               | AM/PM                           | `PM`               |
| `"yyyy-MM-dd"`       | ISO-datoformat                  | `2025-06-30`       |
| `"dd.MM.yyyy"`       | Norsk datoformat                | `30.06.2025`       |
| `"dddd d. MMMM"`     | Ukedag, dag og måned (tekstlig) | `Monday 30. June`  |
| `"dd.MM.yyyy HH:mm"` | Dato og klokkeslett             | `30.06.2025 16:57` |

### Liste – `Array` 
En array er en variabel som inneholder flere verdier – enten tall, tekst eller objekter – samlet på ett sted. I PowerShell brukes `[array]`-typen til å håndtere slike lister, og det gjør det enkelt å jobbe med data i grupper. 

Skal du sende inn flere filnavn til en kommando, gjennomgå en liste med brukernavn i en `foreach`-løkke, eller filtrere ut prosesser med høy ressursbruk, er arrayen din beste venn. Du kan også kombinere arrays, hente ut enkeltverdier via indekser, telle antall elementer, og legge til nye – alt med ren, lesbar og effektiv kode.
#### Syntaks

```powershell
[array]$ArrayVariable = @(1,2,3,4,5,6)
```

`[array]` sier hvilken datatype variabelen skal være og `@(...)` lager listen. Det holder å benytte en av dem, men ved å benytte begge gir de både klar struktur og tydelig typekontroll.
#### Eksempel: Lagre flere verdier

```powershell
$Array = @(1, 2, 3)
```

Samler data i en variabel.
#### Eksempel: Iterere med `foreach`

```powershell
foreach ($Item in $Array) {
	Write-Output $Item
}

1  # resultat
2  # resultat
3  # resultat
```

Går igjennom hvert element i listen og skriver den ut.
#### Eksempel: Finne antall elementer

```powershell
$Array.Count

3  # resultat
```

Gir lengden på listen.
#### Eksempel: Filtrere med `Where-Object`

```powershell
$Array | Where-Object { $_ -gt 2 }

3  # resultat
```

Henter verdier større enn 2.
#### Eksempel: Legge til verdier

```powershell
$Array += 4
$Array

1
2
3
4  
```

Legger til nytt element på slutten (4).
#### Eksempel: Hente spesifikk verdi

```powershell
$Array[0]

1  # resultat
```

Gir første element.
#### Eksempel: Endre element

```powershell
$Array[1] = 99
$Array

1
99
3
4
```

Bytter ut verdien på indeks 1.
#### Eksempel: Kombinere lister

```powershell
$Combined = $Array + @(100, 200)
$Combined

1
99
3
4
100
200
```

Slår sammen to lister.
#### Eksempel: Bruke som input

```powershell
Get-Process -Name @("explorer", "notepad")
Get-Process: Cannot find a process with the name "notepad". Verify the process name and call the cmdlet again.

 NPM(K)    PM(M)      WS(M)     CPU(s)      Id  SI ProcessName
 ------    -----      -----     ------      --  -- -----------
    269   398,69     223,12   8 583,33   10332   1 explorer
```

Sender en liste inn i kommandoen. 
#### Eksempel: Lage en liste over filstier

```powershell
$LogFiles = @(
    "C:\Logs\App1.log",
    "C:\Logs\App2.log",
    "C:\Logs\App3.log"
)

foreach ($File in $LogFiles) {
    if (Test-Path $File) {
        Write-Output "$File finnes."
    } else {
        Write-Output "$File mangler."
    }
}

C:\Logs\App1.log finnes.
C:\Logs\App2.log mangler.
C:\Logs\App3.log mangler.
```

Sjekke om filer eksisterer.
#### Eksempel: Enkel tekstmeny med `array`

```powershell
# Liste med alternativer
$options = @("Start", "Stop", "Restart", "Status")
# Vis meny
Write-Output "Velg en handling:"
for ($i = 0; $i -lt $options.Count; $i++) {
    Write-Output "$($i + 1): $($options[$i])"
}
# Hent brukerens valg (nummer)
$selection = Read-Host "Skriv inn nummeret på ønsket handling"
# Hent valgt tekst fra array
$choice = $options[$selection - 1]
Write-Output "Du valgte: $choice"

Velg en handling:
1: Start
2: Stop
3: Restart
4: Status

Skriv inn nummeret på ønsket handling: 1

Du valgte: Start
```

Listen inneholder menyvalg, brukeren skriver inn et nummer og valget hentes fra listen og vises tilbake. 
#### Noen fallgruver med arrays i PowerShell
##### Mangler `@(...)` rundt liste

```powershell
$ArrayVariable = (1,2,3)
```

Dette gir ikke en liste, men returnerer bare siste elementet. Riktig måte er `@(1,2,3)`
##### Arrays av en verdi oppfører annerledes

```powershell
$Array = "Hello"
$Array.Count

5 # resultat gir antall tegn, ikke ett objekt
```

Når du har en verdi og mangler `@(...)`, kan PowerShell feiltolke det som en skalar. 
##### Forsøker å bruke `.Add()` på array

```powershell
$array = @(1, 2)
$array.Add(3)

MethodInvocationException: 
Line |
   3 |  $array.Add(3)
     |  ~~~~~~~~~~~~~
     | Exception calling "Add" with "1" argument(s): "Collection was of a fixed size."
```

Arrays har ikke metoden `.Add()`, og du må benytte `+=` for å legge til elementer i et array.
### Nøkkel-verdi-samling – `Hashtable`
En `hashtable` er en samling av nøkkel-verdi-par, der hver nøkkel er unik og brukes til å slå opp tilhørende verdi. I PowerShell er en hashtable av typen `[hashtable]`, og den er ideell når du trenger raske oppslag, fleksibel struktur og enkel lagring av konfigurasjoner eller data – for eksempel innstillinger, brukerinformasjon eller oversettelsestabeller.
#### Syntaks

```powershell
[hashtable]$HashTableVariable = @{Key1 = 'Verdi1'; Key2 = 'Verdi2'}
```
#### Eksempel: Konfigurasjon og innstillinger

```powershell
$Settings = @{
    Theme = 'Dark'
    Fontsize = 14
    Language = 'no-NO'
}
Write-Output "Språk valgt: $($Settings['Language'])"

Språk valgt: no-NO  # resultat
```

Brukes når du trenger å lagre parametere eller innstillinger som skal brukes i skript.
#### Eksempel: Kartlegging eller oversettelse

```powershell
$CountryCodes = @{
    NO = 'Norway'
    SE = 'Sweden'
    DK = 'Denmark'
}
$Code = 'SE'
Write-Output $CountryCodes[$Code]
Sweden
```

Praktisk for å slå opp verdier basert på en nøkkel.
#### Eksempel: Brukerprofiler 

```powershell
$User = @{
    Name = 'Kjetil'
    Role = 'Administrator'
    Active = $true
}
Write-Output "$($User['Name']) har rollen som $($User['Role'])"

Kjetil har rollen som Administrator  # resultat
```

Lar deg samle og aksessere strukturert informasjon om en enhet.
#### Eksempel: Argumenter til funksjoner

```powershell
$Parameters = @{
    Path = "C:\Logs\status.txt"
    Force = $true
}
Remove-Item @Parameters
```

Hash tables brukes ofte for å sende inn named arguments med `@` foran, noe som gir fleksibilitet og ryddig kode.
#### Eksempel: Oppbevare tallverdier med nøkkel

```powershell
$Inventory = @{
    Apples = 13
    Oranges = 5
    Bananas = 9
}
$Inventory['Oranges'] += 2

$Inventory
Name                           Value
----                           -----
Apples                         13
Bananas                        9
Oranges                        7
```

Kan fungere for enkle databaser eller telling der hver nøkkel har tilhørende tall.
#### Eksempel: Dynamisk rapportkonfigurasjon

```powershell
# Definer innstillinger for rapporter
$ReportSettings = @{
    Title        = "Månedsrapport - Juni"
    Author       = "Kjetil"
    Created      = (Get-Date).ToString("yyyy-MM-dd")
    Sections     = @("Oversikt", "Resultater", "Kommentarer")
    IncludeGraph = $true
}

# Skrive ut overskrift
Write-Output "Rapport: $($ReportSettings['Title'])"
Write-Output "Forfatter: $($ReportSettings['Author'])"
Write-Output "Opprettet: $($ReportSettings['Created'])"

# Gå gjennom seksjoner
foreach ($Section in $ReportSettings['Sections']) {
    Write-Output " – $Section"
}

# Sjekk om graf skal inkluderes
if ($ReportSettings['IncludeGraph']) {
    Write-Output "📈 Graf inkluderes i rapporten."
} else {
    Write-Output "Ingen graf inkludert"
}

# resultat
Rapport: Månedsrapport - Juni
Forfatter: Kjetil
Opprettet: 2025-07-01
 – Oversikt
 – Resultater
 – Kommentarer
📈 Graf inkluderes i rapporten.
```

Du kan bruke `hashtable`- struktur til å definere innstillinger som enkelt kan endres, bygges videre på, eller eksporteres. Det gir fleksibilitet for alt fra dokumentgenerering og dataanalyse, til systemkonfigurasjon og automatisering – spesielt når du kombinerer det med arrays og logiske tester.
#### Typiske `hashtable`-feil
##### Prøver å hente en nøkkel som ikke finnes

```powershell
$Settings = @{
    Mode = "Auto"
}
$Settings["Theme"]  # Nøkkelen "Theme" eksisterer ikke

# Sjekk først at nøkkelen finnes
if ($Settings.ContainsKey("Mode")) {
    $Settings["Mode"]
}

Auto  # resultat
```

##### Skriver over en eksisterende nøkkel ved et uhell

```powershell
$Settings["Mode"] = "Manual"  # overstyrer "Auto"

# Bruk `ContainsKey()` før du endrer eller be om bekreftelse
if (-not $Settings.ContainsKey("Mode")) {
    $Settings["Mode"] = "Manual"
}
```
##### Loop uten å håndtere nøklene riktig

```powershell
foreach ($Item in $Settings) {
    $Item  
}

# Skriver ut en DictonaryEntry, noe som ikke er særlig lesbart
Name                           Value
----                           -----
Mode                           Auto

# Bryt opp 
foreach ($Key in $Settings.Keys) {
    "$Key : $($Settings[$key])"
}

# Mer lesbart 
Mode : Auto
```
### Egendefinert objekt – `PSCustomObjects`
Et [`PSCustomObject`](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-pscustomobject?view=powershell-7.5)  lar deg opprette dine egne objekter i PowerShell, med egendefinerte felter og strukturert innhold. I motsetning til en hashtable, kan du her jobbe med data som objekter – noe som gir bedre lesbarhet, støtte for punktnotasjon, og sømløs bruk i pipelines, eksport (CSV/JSON) og formatering (som `Format-Table` og `Export-Csv`).

Et `PSCustomObject` oppfører seg som et vanlig objekt – du kan hente egenskaper med `$Object.Navn`, sortere og filtrere i lister, og bruke det i rapporter og eksport som om det var bygget inn i PowerShell.
#### Syntaks

```powershell
# Opprettelse ved bruk av `New-Object` (legacy)
$CustomObject = New-Object PSObject -Property @{
	Name1 = 'Value1'
	Name2 = 'Value2'
	Name3 = 'Value3'
}

# Opprettelse ved bruk av `[PSCustomObject]`
$CustomObject = [PSCustomObject]@{
    Name1 = "Value1"
    Name2 = "Value2"
    Name3 = "Value3"
}
```
### Hashtable vs PSCustomObject
Bruk `Hashtable` når du trenger rask og enkel nøkkelbasert oppslag eller konfigurering. Bruke `PSCustomObject` når du bygger datastrukturer du skal vise, eksportere, filtrere, eller jobbe videre med i lister.

| Egenskap              | `Hashtable`                                 | `PSCustomObject`                                     |
| --------------------- | ------------------------------------------- | ---------------------------------------------------- |
| **Struktur**          | Ustrukturert samling av nøkkel-verdi-par    | Strukturert objekt med navngitte egenskaper          |
| **Tilgang**           | `$ht['Key']`                                | `$obj.Key` (punktnotasjon)                           |
| **Eksport / visning** | Lite egnet for `Export-Csv`, `Format-Table` | Perfekt til CSV, JSON, tabellvisning og pipelines    |
| **Bruk i lister**     | Vanskelig å kombinere flere hashtables      | Enklere å samle i arrays for filtrering og sortering |
| **Lesbarhet**         | Tekniske nøkkelverdier                      | Mer selvforklarende og rapportvennlig struktur       |
| **Ytelse**            | Rask og lettvekts                           | Litt tyngre, men kraftigere for strukturert data     |

#### Eksempel: Representere en person eller enhet
```powershell
$User = [PSCustomObject]@{
    Name = "Kjetil"
    Email = "kjetil@example.com"
    Role = "Admin"
}
```

Brukes når du trenger strukturert informasjon i rapportering, logging eller behandling.
#### Eksempel: 

```powershell
$People = @(
    [PSCustomObject]@{Name = "Lene"; Age = 29},
    [PSCustomObject]@{Name = "Tom"; Age = 36}
)
$People | Where-Object {$_.Age -gt 30}

Name Age
---- ---
Tom   36
```

Filtrering, sortering og eksport av tabell-lignende data gjøres enkelt med egendefinerte objekter.
#### Eksempel: Dynamisk utvidelse og opprydning av `PSCustomObject`

```powershell
# Start med et enkelt objekt
$User = [PSCustomObject]@{
    Name = "Kari"
    Email = "kari@example.com"
}

# Legg til ny egenskap "Status"
$User | Add-Member -MemberType NoteProperty -Name "Status" -Value "Aktiv"    

# Skriv ut etter utvidelse
Write-Output "Etter Add-Member:"
$User

Etter Add-Member:
Name Email            Status
---- -----            ------
Kari kari@example.com Aktiv

# Fjern egenskapen "Email"
$User.psobject.Properties.Remove("Email")

# Skriv ut etter fjerning
Write-Output "`nEtter fjerning av 'Email':"
$User

Etter fjerning av 'Email':
Name Status
---- ------
Kari Aktiv
```

Vi bygger et `PSCustomObject` trinnvis: først starter vi med et enkelt objekt med to egenskaper, deretter legger vi til en ny egenskap kalt `"Status"` ved hjelp av `Add-Member`, og til slutt fjerner vi egenskapen `"Email"` ved å bruke `.psobject.Properties.Remove()`. Det illustrerer hvordan strukturen i objektet kan tilpasses dynamisk etter behov – noe som er nyttig i skript der innholdet kan variere, eller man ønsker å tilpasse hva som skal inkluderes i en rapport, eksport eller visning
#### Eksempel: Eksportere til CSV eller JSON

```powershell
$People | Export-Csv -Path "people.csv" -NoTypeInformation
"Name","Age"
"Lene","29"
"Tom","36"

$People | ConvertTo-Json
[
  {
    "Name": "Lene",
    "Age": 29
  },
  {
    "Name": "Tom",
    "Age": 36
  }
]
```

`PSCustomObject` gir pene og komplette data ved eksport – i motsetning til `Hashtable`.
#### Eksempel: Samle loggstatistikk med `PSCustomObject`

```powershell
# Simuler noen logglinjer
$Logs = @(
    "2024-01-01 ERROR Disk full",
    "2024-01-01 INFO  Backup completed",
    "2024-01-02 WARN  Low memory",
    "2024-01-02 ERROR Timeout",
    "2024-01-02 INFO  Scan started"
)

# Teller opp antall forekomster per type
$Summary = @{}

foreach ($Line in $Logs) {
    $Parts = $Line -split '\s+', 3
    $Date, $Level, $Message = $Parts

    if (-not $Summary.ContainsKey($Level)) {
        $Summary[$Level] = 0
    }

    $Summary[$Level]++
}

# Bygg en rapport som PSCustomObject
$Report = foreach ($Entry in $Summary.GetEnumerator()) {
    [PSCustomObject]@{
        LogLevel = $Entry.Key
        Count    = $Entry.Value
    }
}

# Vis rapport
$Report | Sort-Object Count -Descending | Format-Table

LogLevel Count
-------- -----
ERROR        2
INFO         2
WARN         1
```

Skriptet går gjennom en liste med logglinjer, deler hver linje opp i dato, loggnivå og melding, og teller hvor mange ganger hvert loggnivå forekommer (f.eks. ERROR, INFO). Resultatet lagres som en liste med `PSCustomObject`-objekter – ett per nivå – og vises ryddig i tabellform, sortert etter antall. Det gir en rask og strukturert oversikt over loggstatus, klar for videre visning eller eksport.
## Vanlige feil med datatyper i PowerShell
### Sammenligning mellom tekst og tall
Eksemplet viser hvorfor det er nyttig å forstå og kontrollere datatypene, spesielt når man jobber med sammenligninger, input eller filtre.

```PowerShell
$a = "42"
$b = 42
$a -eq $b

False # Verdiene er ikke like pga. forskjellig datatype
```

Selv om `$a` og `$b` ser like ut, er `$a` en streng (`System.String`) og `$b`er et heltall (`System.Int32`). PowerShell prøver ikke automatisk å konvertere `$a` til tall i dette tilfellet – og derfor gir sammenligningen `False`.

For at sammenligningen skal være `True` må begge verdier ha samme type før sammenligningen

```powershell
[int]$a = "42"
$b = 42
$a -eq $b

True # Verdiene er like
```
### Desimaltall er ikke alltid `decimal`
Hvis du trenger nøyaktig desimalberegninger – for eksempel ved valutaberegninger, avrundinger eller eksakte tallverdier – må du angi `decimal` typen eksplisitt:

```Powershell
$verdi = 3.14
$verdi.GetType().Name
Double # Flyttallsverdi med dobbel presisjon (standard)

[decimal]$verdi = 3.14
$verdi.GetType().Name
Decimal # Nøyaktig desimaltype
```
### Dato behandles som tekst
PowerShell tolker ikke automatisk tekst som ser ut som dato, som en faktisk `DateTime`-verdi – med mindre du spesifiserer det eksplisitt:

```PowerShell
$date = "2024-01-01"
$date.GetType().Name
String # Datoen tolkes som tekst ([string])

[DateTime]$date = "2024-01-01"
$date.GetType().Name
DateTime # PowerShell tolker nå verdien som en dato
```

Det verdt å merke deg at dette gjelder særlig ved input fra filer, API-er eller brukerdata – hvor verdien ofte kommer som tekst. Bruk `[DateTime]` for å sikre riktig tolkning. 
### Bruk av operatoren `+=` på strenger 
Når du benytter operatoren `+=` mellom ulike datatyper forsøker PowerShell å finne en felles type – og ofte ender det med at verdien konverteres til tekst. Dette kan føre til uventet oppførsel hvis du forventer videre beregninger: 

```powershell
$a = 42
$a += "1"
$a.GetType().Name
String # Du forventer [int], men verdien er nå tekst
```

Pass på hvilken rekkefølge og type du kombinerer. Hvis du først setter et tall og så legger til en streng, blir resultatet en streng – og videre utregninger vil feile eller gi rare resultater.

En [_operator_](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.5) er et symbol eller funksjon som brukes til å utføre en operasjon – for eksempel legge sammen verdier  ( `+` ), sammen ligne dem (`-eq`) eller tilordne verdier til variabler ( `=`). 

### Tomme verdier er ikke det samme som `$null`
I PowerShell kan en variabel enten inneholde en tom streng ( `""` ), eller være `$null` – altså helt uten verdi. Dette er to forskjellige ting, og sammenligningen mellom dem kan gi overraskende resultater hvis du ikke er bevisst på forskjellen.

```PowerShell
$value = $null
if ($value -eq "") { "Tomme strenger er ikke null!" }
```

Her får du ingen utskrift – fordi betingelsen er `False`. `$null` er _ikke_ lik `""`. En tom streng har et gyldig innhold (tekst uten tegn), mens `$null` betyr at verdien mangler helt.