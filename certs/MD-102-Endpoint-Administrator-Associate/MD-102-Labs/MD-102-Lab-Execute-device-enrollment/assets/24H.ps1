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
    $global:NeedsReboot = $true

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