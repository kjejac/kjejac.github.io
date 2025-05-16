# Kort introduksjon til PowerShell

## PowerShell

PowerShell gir en kraftfull måte å administrere systemer på ved å kombinere kommandolinjeverktøy med skriptlogikk. I stedet for å manuelt utføre oppgaver, kan du **automatisere og effektivisere prosesser**.

Eksempler på bruksområder:
- **Administrasjon av nettverk og tjenester** – Oppdatering av DNS på en hel serverpark.
- **Brukerhåndtering i Active Directory (AD)** – Legge til eller endre flere brukere samtidig.
- **Automatisering av oppgaver** – Planlegging og utrulling av endringer på tvers av systemer.   

PowerShell er spesielt verdifullt i IT-drift fordi det **reduserer tid brukt på repetitive oppgaver** og **minimerer feil** ved manuell konfigurasjon.
### Hva er et shell

Et shell, eller "kommandoskall" på norsk, er et tekstorientert grensesnitt mellom operativsystemet og bruker hvor du kan utføre kommandoer.
### Hva er et skriptspråk

Et programmeringsspråk som er designet for å integrere og kommunisere med andre programmeringsspråk. Eksempler på slike språk er for eksempel PowerShell, Java script og Perl. 
### Hva er PowerShell

PowerShell (7.5) er en kryssplattform automatiserings løsning som består av et kommandolinje shell, et skriptspråk og et konfigurasjons administrasjons rammeverk. PowerShell kjører på Windows, Linux og macOS.

I motsetning til andre typiske shell, som mottar og returnerer tekst, så både aksepterer og returnerer PowerShell .Net objekter. Andre funksjoner: 
- En robust kommando-linje historie 
- Tabulator fullførelse av kommandoer og prediksjon av kommando
- Støtter kommando og parameter aliaser
- Pipeline for å lenke kommandoer
- Hjelp inne i konsolet, tilsvarende Unix man sider.

[PowerShell 7.5](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.5])_
#### Skriptspråk

Som et skriptspråk er PowerShell brukt vanligvis for å automatisere styringen av systemer. Det kan også brukes til å bygge, teste og distribuere løsninger, ofte innen CI/CD miljøer. 
Da PowerShell er bygget på .NET Common Language Runtime (CLR) er alle inputs og outputs .NET objekter. Det er dermed ikke behov for å parse returnert tekst. PowerShell skriptspråket inkluderer funksjoner for
- Utvidelse gjennom "functions", "classes", "scripts" og "modules"
- Utvidelse av formateringen for enklere output
- Utvidelse type-systemet for å opprette dynamiske typer
- Innebygd støtte for vanlige data format som CSV, JSON og XML

#### CI/CD

CI/CD står for _Continuous Integration and Continuous Delivery_, og er praksiser for å kontinuerlig forbedring samt automatisert utrulling av programvare. 
#### .NET

.NET er en samling av teknologier fra Microsoft for programvareutvikling. Det er et mellomlag mellom applikasjoner og operativsystem og kan sammenlignes med Java-basert utvikling.
#### .NET Common Language Runtime (CLR)

.NET har et run-time miljø som kalles _common language runtime_ som kjører kode og gir tjenester som gjør utviklingsprosessen enklere.
#### PowerShell functions

En _function_ er en liste av PowerShell uttalelser som er definert med et navn. For å bruke den skriver du inn navnet på den. 

PowerShell har to typer functions:
- En blokk av kode som kan kalles opp med navn. Den kan ta input og returnere output.
- Et _filters_ er et type function som er designet for å prosessere data fra piplinen. Filters er definert med nøkkelordet `filter`. 

Functions kan operere som på samme måte som en cmdlet. 

Syntaksen til en function
```powershell
function [<scope:>]<name> {
  param([type]$Parameter1 [,[type]$Parameter2])
  dynamicparam {<statement list>}
  begin {<statement list>}
  process {<statement list>}
  end {<statement list>}
  clean {<statement list>}
}
```

Functions inneholder 
- Et `function` nøkkelordet
- Scope (valgfritt)
- Et navn (du velger)
- Navngitte parametere (valgfritt), inkludert dynamiske parametere
- En eller flere PowerShell uttalelser lukket inn i krøllparanteser `{}`

Benyttes ikke nøkkelordene `begin`, `process`, `end` eller `clean` i en function vil PowerShell kjøre koden i `end` blokken.

Mer informasjon om [about\_Functions](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-7.5) og [about\_Functions\_Advanced](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced?view=powershell-7.5).
#### PowerShell classes

En "class" i PowerShell er en mal som definerer en struktur for et objekt. Den består av egenskaper og metoder for å beskrive objektets tilstand og atferd. 
Normalt blir en "class" i PowerShell deklarert ved bruke nøkkelordet `class` etterfulgt av navnet og lukket inn i krøllparanteser `{}`. Egenskaper og metoder er definert på innsiden av krøllparantesene.

Syntaksen til en "class" består av
```powershell 
class <class-name> [: [<base-class>][,<interface-list>]] {
    [[<attribute>] [hidden] [static] <property-definition> ...]
    [<class-name>([<constructor-argument-list>])
      {<constructor-statement-list>} ...]
    [[<attribute>] [hidden] [static] <method-definition> ...]
}
```

Mer informasjon [about\_Classes](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes?view=powershell-7.5) og [Unlocking PowerShell Classes: An In-Depth Overview](https://locall.host/what-is-a-powershell-class-an-overview/)
#### PowerShell modules

En modul er en selvstendig, gjenbrukbar enhet som kan omfatte cmdlets, providers, funksjoner, variabler og andre ressurser. Som standard laster PowerShell automatisk en installert modul første gang du bruker en kommando fra modulen.

Mer informasjon [about\_Modules](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-7.5)
#### Type systems

Data av utvidet type definerer ytterligere egenskaper og metoder ("medlemmer") av objekttyper i PowerShell. Det er to teknikker for å legge til utvidede type data til en PowerShell -økt.  
  
`Typer.ps1xml` -fil: en XML -fil som definerer data om utvidet type.  
`OPPDATERING-TYPEDATA`: En cmdlet som laster inn typer.ps1xml filer og definerer utvidede data for typer i den aktuelle økten.

Mer informasjon [about\_Types. ps1xml](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_types.ps1xml?view=powershell-7.5)
#### Vanlige data-formater

**CSV**: En komma separert fil
**JSON**: Et åpent dataformat for å lagre og utveksle (avansert) strukturert informasjon
**XML**: Et markeringsspråk (Extensible Markup Language, XML) som kan brukes til å beskrive strukturert informasjon. Brukes til definere spesialisert språk for spesifikke behov.
