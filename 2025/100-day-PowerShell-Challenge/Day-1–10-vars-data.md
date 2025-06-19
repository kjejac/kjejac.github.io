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
Du kan lagre 