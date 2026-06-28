$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

# --- Supabase Injection ---
$supabaseUrl = "https://nusdqyfwqkwinbwcqeor.supabase.co/functions/v1/process-message"
$supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51c2RxeWZ3cWt3aW5id2NxZW9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI2MTc4NTMsImV4cCI6MjA5ODE5Mzg1M30.VjEuoKrkvhr3P-rjWekTVkhPztL8MndioKqUie3Mmhs"

# Cross-platform window title handling
if ($PSVersionTable.OS -like "*Windows*") {
    $host.UI.RawUI.WindowTitle = "SBNX CODEX - COGNITIVE INTERFACE V5.0"
}

Write-Host "[!] INITIALIZING COGNITIVE INTERFACE SYSTEM LAYER..." 
Write-Host "-----------------------------------------------------------------------------------------------------------------" 
Write-Host "[+] HOST MACHINE : $env:COMPUTERNAME" 
Write-Host "[+] PROCESSING   : ARCH_X64_NEURAL_THREAD" 
Write-Host "[+] LOCAL INST   : CONFIG_NODE_READY" 
Write-Host "-----------------------------------------------------------------------------------------------------------------" 
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
" ███████╗██████╗ ███╗   ██╗██╗  ██╗      ██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗`n" +
" ██╔════╝██╔══██╗████╗  ██║╚██╗██╔╝     ██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗██╔╝`n" +
" ███████╗██████╔╝██╔██╗ ██║ ╚███╔╝      ██║     ██║   ██║██║  ██║█████╗   ╚███╔╝ `n" +
" ╚════██║██╔══██╗██║╚██╗██║ ██╔██╗      ██║     ██║   ██║██║  ██║██╔══╝   ██╔██╗ `n" +
" ███████║██████╔╝██║ ╚████║██╔╝ ██╗     ╚██████╗╚██████╔╝███████╗██╔╝ ██╗`n" +
" ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝      ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝`n" +
" _________________________________________________________________________________________________________________"

Clear-Host
Write-Host $BANNER_1
Write-Host "  [SYSTEM: ACTIVE]   [MODE: ENTERPRISE_AI_NODE]   [SITE: SBNX CODEX]" 
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Write-Host " PROVIDE PLATFORM OPERATOR SIGNATURE TO ACCESS CORE COMMANDS"
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Start-Sleep -Seconds 1

$user = Read-Host "[#] OPERATOR ID  "
$pass = Read-Host "[#] SECURITY PIN "

if ($user -ne "admin" -or $pass -ne "ai123") {
    Write-Host "[-] SECURE SHUTDOWN: VERIFICATION FAILED."
    Start-Sleep -Seconds 2
    exit
}

Clear-Host
Write-Host $BANNER_1
Write-Host "================================================================================================================="
Write-Host "SYSTEM ENVIRONMENT READY. CURRENT MODE: CONSOLE SHELL."
Write-Host "================================================================================================================="

$aiMode = $false

while ($true) {
    if ($aiMode) {
        $msg = Read-Host "🤖 SBNX-Codex@AI:~#"
    } else {
        $msg = Read-Host "Operator@Core:~$"
    }

    # 1. GLOBAL EXIT (Terminal Exit)
    if ($msg.Trim().ToLower() -eq "exit" -or $msg.Trim().ToLower() -eq "quit") {
        Write-Host "[-] SHUTTING DOWN NEURAL LINK CONSOLE... GOODBYE!"
        Start-Sleep -Seconds 1
        break
    }
    
    # 2. EXIT FROM AI MODE (Return to local)
    if ($msg -eq "@exitai" -or $msg -eq "@aiexit" -or $msg -eq "back") {
        if ($aiMode) {
            $aiMode = $false
            Write-Host "-----------------------------------------------------------------------------------------------------------------"
            Write-Host "[-] SBNX CODEX INTELLIGENCE CORE DEACTIVATED. RETURNED TO LOCAL PARAMETERS."
            Write-Host "-----------------------------------------------------------------------------------------------------------------"
            continue
        }
    }

    # SECRET COMMAND TO ENTER AI MODE
    if ($msg -eq "@adminai") {
        $aiMode = $true
        Write-Host "-----------------------------------------------------------------------------------------------------------------"
        Write-Host "[+] SBNX CODEX INTELLIGENCE CORE ACTIVATED. LINKING TO EDGE FUNCTION DIRECTORY..."
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
        if ($aiMode) { Write-Host $BANNER_2 } else { Write-Host $BANNER_1 }
        continue
    }

    # AI MODE RESPONSE PIPELINE
    if ($aiMode) {
        if (-not $msg) { continue }
        Write-Host "Thinking..."
        
        $body = @{ message = $msg } | ConvertTo-Json -Compress
        
        # Injected Auth Headers using your publishable anon key
        $headers = @{
            "apikey"        = $supabaseKey
            "Authorization" = "Bearer $supabaseKey"
        }

        try {
            $response = Invoke-RestMethod -Uri $supabaseUrl -Method Post -Headers $headers -Body $body -ContentType "application/json; charset=utf-8" -TimeoutSec 30
            
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

            Write-Host "`n🤖 AI: $replyText`n"
        }
        catch {
            Write-Host "`n[-] CONNECTION ERROR: API payload block was rejected. Please verify the Edge Function status.`n"
        }
    } else {
        # LOCAL CONSOLE MODE COMMANDS
        if ($msg -eq "ls") { Write-Host "src/   public/   package.json   supabase/" }
        elseif ($msg -eq "help") { Write-Host "Available: ls, clear, help, @info, exit" }
        elseif ([string]::IsNullOrWhiteSpace($msg)) { continue }
        else { Write-Host "'$msg' is not recognized as an internal or external command." }
    }
}
