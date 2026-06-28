$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

$host.UI.RawUI.WindowTitle = "SBNX CODEX - COGNITIVE INTERFACE V5.0"
$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(125, 45)
$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(125, 45)

Write-Host "[!] INITIALIZING COGNITIVE INTERFACE SYSTEM LAYER..." -ForegroundColor Gray
Write-Host "-----------------------------------------------------------------------------------------------------------------" -ForegroundColor Gray
Write-Host "[+] HOST MACHINE : $env:COMPUTERNAME" -ForegroundColor Green
Write-Host "[+] PROCESSING   : ARCH_X64_NEURAL_THREAD" -ForegroundColor Green
Write-Host "[+] LOCAL INST   : CONFIG_NODE_READY" -ForegroundColor Green
Write-Host "-----------------------------------------------------------------------------------------------------------------" -ForegroundColor Gray
Start-Sleep -Seconds 1
Clear-Host

$BANNER_1 = " _________________________________________________________________________________________________________________`n" +
"  ███████████      █████                ███████████      █████████                                            `n" +
" ░░███░░░░░███    ░░███                ░░███░░░░░███    ███░░░░░███                                           `n" +
"  ░███    ░███    ███████    ██████     ░███    ░███   ░███     ░░░   ██████  █████ █████  ██████  ████████    `n" +
"  ░██████████    ░░░███░    ███░░███    ░██████████    ░░█████████  ███░░███░░███ ░░███  ███░░███░░███░░███   `n" +
"  ░███░░░░░░       ░███     ░███ ░███    ░███░░░░░░      ░░░░░░░░███░███████  ░███  ░███ ░███████  ░███ ░░░    `n" +
"  ░███             ░███ ███ ░███ ░███    ░███            ███    ░███░███░░░   ░░███ ███  ░███░░░   ░███        `n" +
"  █████            ░░█████  ░░██████     █████          ░░█████████ ░░██████   ░░█████    ░░██████ █████       `n" +
" ░░░░░              ░░░░░    ░░░░░░     ░░░░░            ░░░░░░░░░   ░░░░░░     ░░░░░      ░░░░░░ ░░░░░        `n" +
" _________________________________________________________________________________________________________________"

$BANNER_2 = " _________________________________________________________________________________________________________________`n" +
" ███████╗██████╗ ███╗   ██╗██╗  ██╗     ██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗`n" +
" ██╔════╝██╔══██╗████╗  ██║╚██╗██╔╝     ██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗██╔╝`n" +
" ███████╗██████╔╝██╔██╗ ██║ ╚███╔╝      ██║     ██║   ██║██║  ██║█████╗   ╚███╔╝ `n" +
" ╚════██║██╔══██╗██║╚██╗██║ ██╔██╗      ██║     ██║   ██║██║  ██║██╔══╝   ██╔██╗ `n" +
" ███████║██████╔╝██║ ╚████║██╔╝ ██╗     ╚██████╗╚██████╔╝██████╔╝███████╗██╔╝ ██╗`n" +
" ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝      ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝`n" +
" _________________________________________________________________________________________________________________"

Clear-Host
Write-Host $BANNER_1 -ForegroundColor Green
Write-Host "  [SYSTEM: ACTIVE]   [MODE: ENTERPRISE_AI_NODE]   [SITE: SBNX CODEX]" -ForegroundColor Gray
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Write-Host " PROVIDE PLATFORM OPERATOR SIGNATURE TO ACCESS CORE COMMANDS"
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Start-Sleep -Seconds 1

$user = Read-Host "[#] OPERATOR ID  "
$pass = Read-Host "[#] SECURITY PIN "

if ($user -ne "admin" -or $pass -ne "ai123") {
    Write-Host "[-] SECURE SHUTDOWN: VERIFICATION FAILED." -ForegroundColor Red
    Start-Sleep -Seconds 2
    exit
}

Clear-Host
Write-Host $BANNER_1 -ForegroundColor Green
Write-Host "================================================================================================================="
Write-Host "SYSTEM ENVIRONMENT READY. CURRENT MODE: CONSOLE SHELL. (Type @adminai to change mode)"
Write-Host "================================================================================================================="

$aiMode = $false
$supabaseUrl = "https://nusdqyfwqkwinbwcqeor.supabase.co/functions/v1/process-message"

while ($true) {
    if ($aiMode) {
        $msg = Read-Host "🤖 SBNX-Codex@AI:~#"
    } else {
        $msg = Read-Host "Operator@Core:~$"
    }

    # 1. GLOBAL EXIT (ටර්මිනල් එකෙන්ම Exit වීම)
    if ($msg.Trim().ToLower() -eq "exit" -or $msg.Trim().ToLower() -eq "quit") {
        Write-Host "[-] SHUTTING DOWN NEURAL LINK CONSOLE... GOODBYE!" -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        break
    }
    
    # 2. EXIT FROM AI MODE (AI Mode එකෙන් විතරක් අයින් වීම - @exitai, @aiexit හෝ back)
    if ($msg -eq "@exitai" -or $msg -eq "@aiexit" -or $msg -eq "back") {
        if ($aiMode) {
            $aiMode = $false
            Write-Host "-----------------------------------------------------------------------------------------------------------------"
            Write-Host "[-] SBNX CODEX INTELLIGENCE CORE DEACTIVATED. RETURNED TO LOCAL PARAMETERS." -ForegroundColor Yellow
            Write-Host "-----------------------------------------------------------------------------------------------------------------"
            continue
        }
    }

    if ($msg -eq "@adminai") {
        $aiMode = $true
        Write-Host "-----------------------------------------------------------------------------------------------------------------"
        Write-Host "[+] SBNX CODEX INTELLIGENCE CORE ACTIVATED. LINKING TO EDGE FUNCTION DIRECTORY..." -ForegroundColor Cyan
        Write-Host "-----------------------------------------------------------------------------------------------------------------"
        continue
    }

    if ($msg -eq "@info") {
        Write-Host "========================================== INFO =========================================="
        Write-Host "SYSTEM IDENTITY : SBNX Codex Core Processing Core V5.0"
        Write-Host "INTERFACE MODE  : Hybrid Terminal Emulation Layer"
        Write-Host "EDGE ROUTING    : Supabase Serverless Execution Matrix"
        Write-Host "=========================================================================================="
        continue
    }

    if ($msg -eq "clear") {
        Clear-Host
        if ($aiMode) { Write-Host $BANNER_2 -ForegroundColor Green } else { Write-Host $BANNER_1 -ForegroundColor Green }
        continue
    }

    # AI MODE RESPONSE PIPELINE
    if ($aiMode) {
        if (-not $msg) { continue }
        Write-Host "Thinking..." -ForegroundColor DarkGray
        
        $body = @{ message = $msg } | ConvertTo-Json -Compress
        try {
            $response = Invoke-RestMethod -Uri $supabaseUrl -Method Post -Body $body -ContentType "application/json; charset=utf-8" -TimeoutSec 30
            
            # SMART MULTI-KEY EXTRACTION PARSER
            $replyText = ""
            if ($response.message) {
                $replyText = $response.message
            } elseif ($response.response) {
                $replyText = $response.response
            } elseif ($response.reply) {
                $replyText = $response.reply
            } else {
                $replyText = "⚠️ Payload Buffer Empty: No valid text block parsed from endpoint."
            }

            Write-Host "`n🤖 AI: $replyText`n" -ForegroundColor Cyan
        }
        catch {
            Write-Host "[-] CONNECTION ERROR: Unable to parse payload buffer to Supabase. Check networking configurations." -ForegroundColor Red
        }
    } else {
        # LOCAL CONSOLE MODE COMMANDS
        if ($msg -eq "ls") { Write-Host "src/   public/   package.json   supabase/" }
        elseif ($msg -eq "help") { Write-Host "Available: ls, clear, help, @adminai, @info, exit" }
        elseif ([string]::IsNullOrWhiteSpace($msg)) { continue }
        else { Write-Host "'$msg' is not recognized as an internal or external command." }
    }
}
