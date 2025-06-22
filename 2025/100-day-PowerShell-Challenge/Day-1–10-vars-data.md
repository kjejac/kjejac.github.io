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

Datatypen til en variabel bestemmes av _.NET-typen_ til verdien den inneholder. For å vise objekttypen til en variabel, kan du bruke kommandoen [`Get-Member`](Day-1–10-Help.md#Get-Member).

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
