export default function handler(req, res) {
  const userAgent = req.headers['user-agent'] || '';

  if (userAgent.includes('PowerShell') || userAgent.includes('curl') || userAgent.includes('Wget')) {
    
    // බැනර් දෙකම බ්‍රේක් නොවෙන්න Base64 වලින් මෙතනට දාලා තියෙන්නේ
    const banner1Base64 = "IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiAg4paI4paI4paI4paI4paI4paI4paI4paI4paI4paI4paIICAgICAg4paI4paI4paI4paI4paIICAgICAgICAgICAgICAgIOKWiOKWiOKWiOKWiOKWiOKWiOKWiOKWiOKWiOKWiE独立4paI4paI4paI4paI4paI4paI4paI4paI4paIICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiDClientIDIDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZIgICAgIOKWeOKWeOKWiOKWiOKWiCAgICAgICAgICAgICAgICDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZIgICAg4paI4paI4paI4pZDilZDilZDilZDilZDilZINCiAg4pZECKWiOKWiICAgIOKWeOKWiOKWiICAgIOKWiOKWiOKWiOKWiOKWiOKWiOKWiCAgICDimKDilZDilZDilZDilZDilZIgICAgIOKWeOKWiOKWiCAgICDimKDilZDilZDilZDilZDilZIgICDimKDilZDilZAgICAgIOKWeOKWeOKWiOKWiOKWiOKWiCAg4paI4paI4paI4paI4paIICDilZDilZDilZDilZDilZIgIOKWiOKWiOKWiOKWiOKWiOKWiCAg4paI4paI4paI4paI4paI4paI4paI4paIICAgIA0KICDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZIgICAg4pZDilZDilZDilWiOKWiOKWiOKZICAgIOKWiOKWiOKWiOKWeOKWeOKWiOKWiOKWiCAgICDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZIgICAg4pZDilZDilWiOKWiOKWiOKWiOKWiOKWiOKWiOKWiOKWiCDilZDilZDilZDilZDilZDilZDilZDilZDilZAg4paI4paI4paI4pZDilZDilZDilWiOKWiOKWiCDilZDilZDilWiOKWiOKWiCDilZDilZDilWiOKWiOKWiOKZ4pZDilZDilWiOKWiOKWiOKWeOKWeOKWiOKWiOKWiCANCiAg4pZECKWiOKWiOKWeOKWeOKWeOKWeOKWeOKWeCAgICAgICDilZDilWiOKWiOKWiCAgICAg4pZDilWiOKWiOKWiCDilZDilWiOKWiOKWiCAgICAg4pZECKWiOKWiOKWeOKWeOKWeOKWeOKWeOKWeCAgICAgIOKWeOKWeOKWeOKWeOKWeOKWeOKWeOKWeOKWiOKWiOKWiOKZ4pZECKWiOKWiOKWiOKWiOKWiOKWiOKWiCDilZDilWiOKWiOKWiCAgIOKWiOKWiOKWiCDilZDilWiOKWiOKWiOKWiOKWiOKWiOKWiCDilZDilWiOKWiOKWiOKZ4pZECg== ";
    const banner2Base64 = "IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDhDQrilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDhDQrilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDhDQrilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDhDQrilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDhDQrilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDh=";

    const psScript = `@'
\$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

\$host.UI.RawUI.WindowTitle = "SBNX CODEX - COGNITIVE INTERFACE V5.0"
\$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(125, 45)
\$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(125, 45)

Write-Host "[!] INITIALIZING COGNITIVE INTERFACE SYSTEM LAYER..." -ForegroundColor Gray
Write-Host "-----------------------------------------------------------------------------------------------------------------" -ForegroundColor Gray
Write-Host "[+] HOST MACHINE : \$env:COMPUTERNAME" -ForegroundColor Green
Write-Host "[+] PROCESSING   : ARCH_X64_NEURAL_THREAD" -ForegroundColor Green
Write-Host "[+] LOCAL INST   : CONFIG_NODE_\$(Get-Random)" -ForegroundColor Green
Write-Host "-----------------------------------------------------------------------------------------------------------------" -ForegroundColor Gray
Start-Sleep -Seconds 1
Clear-Host

Write-Host "[!] INJECTING CORRUPTED BUFFER INTO MAIN MEMORY..." -ForegroundColor Red
Start-Sleep -Seconds 1
for (\$i=0; \$i -lt 3; \$i++) {
    Write-Host "0x00F3A2\$(Get-Random -Min 10 -Max 99)C: \$(Get-Random)\$(Get-Random)" -ForegroundColor Gray
}
Start-Sleep -Seconds 1
Clear-Host

# Base64 string වලින් PowerShell එක ඇතුලෙදීම ASCII Art එක Decode කරගැනීම
\$BANNER_1 = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("${banner1Base64}"))
\$BANNER_2 = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("${banner2Base64}"))

Clear-Host
Write-Host \$BANNER_1 -ForegroundColor Green
Write-Host "  [SYSTEM: ACTIVE]   [MODE: ENTERPRISE_AI_NODE]   [SITE: SBNX CODEX]" -ForegroundColor Gray
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Write-Host " PROVIDE PLATFORM OPERATOR SIGNATURE TO ACCESS CORE COMMANDS"
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Start-Sleep -Seconds 3

Clear-Host
Write-Host \$BANNER_2 -ForegroundColor Green
Write-Host "  [SYSTEM: ACTIVE]   [MODE: ENTERPRISE_AI_NODE]   [SITE: SBNX CODEX]" -ForegroundColor Gray
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Write-Host " PROVIDE PLATFORM OPERATOR SIGNATURE TO ACCESS CORE COMMANDS"
Write-Host "-----------------------------------------------------------------------------------------------------------------"

\$user = Read-Host "[#] OPERATOR ID  "
\$pass = Read-Host "[#] SECURITY PIN "

if (\$user -ne "admin" -or \$pass -ne "ai123") {
    Write-Host "[-] SECURE SHUTDOWN: VERIFICATION FAILED." -ForegroundColor Red
    Start-Sleep -Seconds 2
    exit
}

Clear-Host
Write-Host \$BANNER_1 -ForegroundColor Green
Write-Host "================================================================================================================="
Write-Host "SYSTEM ENVIRONMENT READY. CURRENT MODE: CONSOLE SHELL. (Type @adminai to change mode)"
Write-Host "================================================================================================================="

\$aiMode = \$false
\$supabaseUrl = "https://nusdqyfwqkwinbwcqeor.supabase.co/functions/v1/process-message"

while (\$true) {
    if (\$aiMode) {
        \$msg = Read-Host "🤖 SBNX-Codex@AI:~#"
    } else {
        \$msg = Read-Host "Operator@Core:~$"
    }

    if (\$msg -eq "exit") { break }
    
    if (\$msg -eq "@adminai") {
        \$aiMode = \$true
        Write-Host "-----------------------------------------------------------------------------------------------------------------"
        Write-Host "[+] SBNX CODEX INTELLIGENCE CORE ACTIVATED. LINKING TO EDGE FUNCTION DIRECTORY..." -ForegroundColor Cyan
        Write-Host "-----------------------------------------------------------------------------------------------------------------"
        continue
    }

    if (\$msg -eq "@info") {
        Write-Host "========================================== INFO =========================================="
        Write-Host "SYSTEM IDENTITY : SBNX Codex Core Processing Core V5.0"
        Write-Host "INTERFACE MODE  : Hybrid Terminal Emulation Layer"
        Write-Host "EDGE ROUTING    : Supabase Serverless Execution Matrix"
        Write-Host "LANGUAGES       : English, සිංහල, Singlish Auto-Detection Matrix"
        Write-Host "=========================================================================================="
        continue
    }

    if (\$msg -eq "clear") {
        Clear-Host
        Write-Host \$BANNER_1 -ForegroundColor Green
        continue
    }

    if (\$msg.StartsWith("sudo ")) {
        \$passwd = Read-Host "[sudo] password for operator"
        Write-Host "Processing administrative request..." -ForegroundColor Gray
        Start-Sleep -Seconds 1
        if (\$msg -eq "sudo apt update") {
            Write-Host "Get:1 http://archive.ubuntu.com/ubuntu focal InRelease [265 kB]"
            Write-Host "Fetching dependency tree... Done."
        } else {
            Write-Host "Command executed successfully under superuser parameters."
        }
        continue
    }

    if (\$aiMode) {
        if (-not \$msg) { continue }
        Write-Host "Thinking..." -ForegroundColor DarkGray
        
        \$body = @{ message = \$msg } | ConvertTo-Json -Compress
        try {
            \$response = Invoke-RestMethod -Uri \$supabaseUrl -Method Post -Body \$body -ContentType "application/json; charset=utf-8" -TimeoutSec 20
            
            \$aiText = \$response.message
            if (-not \$aiText) { \$aiText = \$response.response }
            if (-not \$aiText) { \$aiText = \$response | Out-String }

            Write-Host "🤖 AI: \$aiText" -ForegroundColor Cyan
        }
        catch {
            Write-Host "[-] CONNECTION ERROR: Unable to parse payload buffer to Supabase. Check networking configurations." -ForegroundColor Red
        }
    } else {
        if (\$msg -eq "ls") { Write-Host "src/   public/   package.json   supabase/" }
        elseif (\$msg -eq "help") { Write-Host "Available: ls, clear, help, sudo [cmd], @adminai, @info" }
        else { Write-Host "'\$msg' is not recognized as an internal or external command." }
    }
}
'@;
    res.setHeader('Content-Type', 'text/plain; charset=utf-8');
    return res.status(200).send(psScript);
  }

  // Browser 404 Response
  res.setHeader('Content-Type', 'text/html');
  return res.status(404).send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>404 Not Found</title>
        <style>
            body { font-family: -apple-system, BlinkMacSystemFont, Roboto, "Segoe UI", sans-serif; height: 100vh; text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; background: #fff; color: #000; margin: 0; }
            h1 { display: inline-block; border-right: 1px solid rgba(0, 0, 0,.3); margin: 0; margin-right: 20px; padding: 10px 23px 10px 0; font-size: 24px; font-weight: 500; }
            div { display: inline-block; text-align: left; line-height: 49px; height: 49px; }
            h2 { font-size: 14px; font-weight: normal; margin: 0; padding: 0; }
            .container { display: flex; align-items: center; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>404</h1>
            <div>
                <h2>This page could not be found.</h2>
            </div>
        </div>
    </body>
    </html>
  `);
}
