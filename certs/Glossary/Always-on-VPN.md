---
title: Always on VPN (AON)
nav_order:
parent:
has_children:
nav_exclude: true
tags:
  - MD-102
  - MD-102/AlwaysOnVPN
---
Always On VPN er Microsofts moderne VPN‑plattform som gir _automatisk, vedvarende og sikker tilkobling_ til organisasjonens nettverk for både brukere og enheter. Den erstatter DirectAccess i nye miljøer og fungerer på tvers av domenejoinede, Entra‑joinede og ikke‑domenejoinede enheter.

Always On VPN er tilgjengelig i alle Windows‑utgaver og kan administreres via Intune, Configuration Manager, PowerShell eller andre MDM‑verktøy.

## Hva Always On VPN gjør

- etablere _auto‑triggered_ VPN‑tilkoblinger basert på apper, navneoppslag eller nettverksforhold
- støtte både _User Tunnel_ og _Device Tunnel_ (maskinen kobler til før brukeren logger inn)
- gi _granulær kontroll_ over hvilke apper og hvilken trafikk som får bruke VPN
- bruke _standardisert XML‑profil (ProfileXML)_ for konfigurasjon
- integrere med tredjeparts VPN‑løsninger via UWP‑plug‑ins
    

## Integrasjoner

Always On VPN støtter integrasjon med:

- _Windows Information Protection (WIP)_ – automatisk VPN‑tilkobling basert på policy
- _Windows Hello for Business_ – sømløs autentisering uten ekstra passord
- _Microsoft Entra Conditional Access_ – MFA, device compliance og kortlivede IPsec‑sertifikater
- _NPS + RADIUS_ – for sterk autentisering og MFA
- _Tredjeparts IKEv2‑gatewayer_ – bred kompatibilitet

## Sikkerhetsfunksjoner

Always On VPN tilbyr:

- IKEv2 som standard protokoll (SSTP fallback for User Tunnel)
- støtte for maskin‑ og brukersertifikater
- app‑ og trafikkbaserte filtre
- conditional access for VPN
- per‑app VPN
- støtte for EAP‑basert autentisering (passord, smartkort, WHfB, MFA)
- TPM‑attesterte nøkler

## Tilkoblingsfunksjoner

Always On VPN kan:

- trigges av apper, DNS‑navn eller nettverksendringer
- unngå tilkobling når enheten er på et _trusted network_
- bruke Device Tunnel for administrasjon før innlogging
- vise status via Network Connectivity Assistant

## Nettverksfunksjoner

Always On VPN støtter:

- IPv4 og IPv6 (dual‑stack)
- split‑tunnel eller force‑tunnel
- per‑app routing
- exclusion routes
- flere domener og skogtopologier
- DNS‑suffix og NRPT‑basert navneoppløsning

## Kort oppsummert

Always On VPN er en fleksibel, moderne og sikker VPN‑løsning som:

- fungerer for både BYOD og bedriftsenheter
- støtter avansert sikkerhet og conditional access
- gir automatisk og sømløs tilkobling
- kan administreres gjennom moderne verktøy som Intune
- erstatter DirectAccess i nye miljøer

```xml
<VPNProfile>
  <ProfileName>Contoso Always On VPN</ProfileName>
  <Servers>vpn.contoso.com</Servers>

  <NativeProfile>
    <NativeProtocolType>IKEv2</NativeProtocolType>
    <Authentication>
      <UserMethod>Eap</UserMethod>
      <Eap>
        <!-- EAP-TLS -->
        <Configuration>
          <EapHostConfig xmlns="http://www.microsoft.com/provisioning/EapHostConfig">
            <EapMethod>
              <Type>13</Type>
              <AuthorId>0</AuthorId>
            </EapMethod>
            <Config>
              <EapTls xmlns="http://www.microsoft.com/provisioning/EapTlsConnectionPropertiesV1">
                <CredentialsSource>
                  <CertificateStore>
                    <SimpleCertSelection>true</SimpleCertSelection>
                  </CertificateStore>
                </CredentialsSource>
                <ServerValidation>
                  <DisableUserPromptForServerValidation>true</DisableUserPromptForServerValidation>
                  <ServerNames>vpn.contoso.com</ServerNames>
                </ServerValidation>
                <DifferentUsername>false</DifferentUsername>
              </EapTls>
            </Config>
          </EapHostConfig>
        </Configuration>
      </Eap>
    </Authentication>
  </NativeProfile>

  <!-- Alltid på -->
  <AlwaysOn>true</AlwaysOn>
  <RememberCredentials>true</RememberCredentials>

  <!-- Trafikkregler (valgfritt – her full tunnel) -->
  <RoutingPolicyType>ForceTunnel</RoutingPolicyType>

  <!-- Trusted network detection (valgfritt) -->
  <TrustedNetworkDetection>corp.contoso.com</TrustedNetworkDetection>

  <!-- Device tunnel? (false = brukertunnel) -->
  <DeviceTunnel>false</DeviceTunnel>

  <!-- Split tunneling (false = alt går via VPN) -->
  <SplitTunneling>false</SplitTunneling>

  <!-- DNS (valgfritt) -->
  <DnsSuffix>corp.contoso.com</DnsSuffix>
  <DnsServers>10.0.0.10,10.0.0.11</DnsServers>
</VPNProfile>

```
[Always On VPN - Kunnskapsbasen - NTNU](https://i.ntnu.no/wiki/-/wiki/Norsk/Always+On+VPN)
[About Always On VPN for Windows Server Remote Access | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/remote/remote-access/overview-always-on-vpn)