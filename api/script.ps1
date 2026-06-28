$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

# --- Supabase Injection ---
$supabaseUrl = "https://nusdqyfwqkwinbwcqeor.supabase.co/functions/v1/process-message"
$supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51c2RxeWZ3cWt3aW5id2NxZW9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI2MTc4NTMsImV4cCI6MjA5ODE5Mzg1M30.VjEuoKrkvhr3P-rjWekTVkhPztL8MndioKqUie3Mmhs"

# Window Title
if ($PSVersionTable.OS -like "*Windows*") {
    $host.UI.RawUI.WindowTitle = "SBNX CODEX - COGNITIVE INTERFACE V5.0"
}

# --- LOADING ANIMATION FUNCTION ---
function Show-Loading {
    param ([string]$Message, [int]$Seconds)
    $frames = @("⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏")
    $iterations = $Seconds * 10
    for ($i = 0; $i -lt $iterations; $i++) {
        $frame = $frames[$i % $frames.Length]
        Write-Host "`r[$frame] $Message" -NoNewline -ForegroundColor Cyan
        Start-Sleep -Milliseconds 100
    }
    Write-Host "`r[+] $Message... DONE!" -ForegroundColor Green
}

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
" ███████║██████╔╝██║ ╚████║██╔╝ ██╗     ╚██████╗╚██████╔╝███████╗██╔╝ ██╗`n" +
" ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝      ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝`n" +
" _________________________________________________________________________________________________________________"

Write-Host $BANNER_1 -ForegroundColor Green
Write-Host "  [SYSTEM: ACTIVE]   [MODE: ENTERPRISE_AI_NODE]   [SITE: SBNX CODEX]" -ForegroundColor Gray
Write-Host "-----------------------------------------------------------------------------------------------------------------"
Write-Host " PROVIDE PLATFORM OPERATOR SIGNATURE TO ACCESS CORE COMMANDS" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------------------------------------------------------------------"

$user = Read-Host "[#] OPERATOR ID  "
$pass = Read-Host "[#] SECURITY PIN "

if ($user -ne "admin" -or $pass -ne "ai123") {
    Write-Host "[-] SECURE SHUTDOWN: VERIFICATION FAILED." -ForegroundColor Red
    Start-Sleep -Seconds 2
    exit
}

Clear-Host
Show-Loading "LOADING SECURITY SUITE" 1
Show-Loading "CONNECTING TO COGNITIVE INTERFACE LAYER" 1
Clear-Host

Write-Host $BANNER_1 -ForegroundColor Green
Write-Host "=================================================================================================================" -ForegroundColor Gray
Write-Host "SYSTEM ENVIRONMENT READY. CURRENT MODE: CONSOLE SHELL." -ForegroundColor Green
Write-Host "=================================================================================================================" -ForegroundColor Gray

$aiMode = $false

while ($true) {
    if ($aiMode) {
        $msg = Read-Host "🤖 SBNX-Codex@AI:~#"
    } else {
        $msg = Read-Host "Operator@Core:~$"
    }

    $trimmedMsg = $msg.Trim()

    # GLOBAL EXIT
    if ($trimmedMsg.ToLower() -eq "exit" -or $trimmedMsg.ToLower() -eq "quit") {
        Write-Host "[-] SHUTTING DOWN NEURAL LINK CONSOLE... GOODBYE!" -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        break
    }
    
    # EXIT FROM AI MODE
    if ($trimmedMsg -eq "@exitai" -or $trimmedMsg -eq "@aiexit" -or $trimmedMsg -eq "back") {
        if ($aiMode) {
            $aiMode = $false
            Write-Host "-----------------------------------------------------------------------------------------------------------------"
            Write-Host "[-] SBNX CODEX INTELLIGENCE CORE DEACTIVATED. RETURNED TO LOCAL PARAMETERS." -ForegroundColor Yellow
            Write-Host "-----------------------------------------------------------------------------------------------------------------"
            continue
        }
    }

    # SECRET COMMAND TO ENTER AI MODE
    if ($trimmedMsg -eq "@adminai") {
        $aiMode = $true
        Show-Loading "TUNNELING INTO SUPABASE SERVERLESS NETWORK" 1
        Write-Host "-----------------------------------------------------------------------------------------------------------------"
        Write-Host "[+] SBNX CODEX INTELLIGENCE CORE ACTIVATED. LINKING TO EDGE FUNCTION DIRECTORY..." -ForegroundColor Cyan
        Write-Host "-----------------------------------------------------------------------------------------------------------------"
        continue
    }

    if ($trimmedMsg -eq "@info") {
        Write-Host "========================================== INFO ==========================================" -ForegroundColor Cyan
        Write-Host "SYSTEM IDENTITY : SBNX Codex Core Processing Core V5.0"
        Write-Host "INTERFACE MODE  : Hybrid Terminal Emulation Layer"
        Write-Host "EDGE ROUTING    : Supabase Serverless Execution Matrix"
        Write-Host "==========================================================================================" -ForegroundColor Cyan
        continue
    }

    if ($trimmedMsg -eq "clear") {
        Clear-Host
        if ($aiMode) { Write-Host $BANNER_2 -ForegroundColor Green } else { Write-Host $BANNER_1 -ForegroundColor Green }
        continue
    }

    if ([string]::IsNullOrWhiteSpace($trimmedMsg)) { continue }

    # AI MODE RESPONSE PIPELINE
    if ($aiMode) {
        Write-Host "Thinking..." -ForegroundColor DarkGray
        
        # 3-Key Payload Injection (සර්වර් එකේ මොන ලොජික් එක තිබ්බත් මැච් වෙන්න)
        $bodyObj = @{ 
            message = $trimmedMsg
            prompt  = $trimmedMsg
            content = $trimmedMsg
        }
        $body = $bodyObj | ConvertTo-Json -Compress
        
        # Standard CORS-Safe Supabase Edge Headers
        $headers = @{ 
            "apikey"        = $supabaseKey
            "Authorization" = "Bearer $supabaseKey"
            "X-Client-Info" = "supabase-js-power"
        }

        try {
            # Web Request එකක් විදිහට Execute කරලා Data Stream එක කියවීම
            $apiResponse = Invoke-WebRequest -Uri $supabaseUrl -Method Post -Headers $headers -Body $body -ContentType "application/json; charset=utf-8" -TimeoutSec 30
            $response = $apiResponse.Content | ConvertFrom-Json
            
            $replyText = ""
            if ($response.message) { $replyText = $response.message }
            elseif ($response.response) { $replyText = $response.response }
            elseif ($response.reply) { $replyText = $response.reply }
            elseif ($response.choices[0].message.content) { $replyText = $response.choices[0].message.content }
            else { $replyText = $apiResponse.Content } # JSON Parser එකක් නැත්නම් මුළු Text එකම

            Write-Host "`n🤖 AI: $replyText`n" -ForegroundColor Cyan
        }
        catch {
            # --- ADVANCED DEBUG MATRIX ---
            # සර්වර් එකෙන් එවන සැබෑ Error එක (404/500/CORS) කෙළින්ම ප්‍රින්ට් කරනවා
            $statusCode = $_.Exception.Response.StatusCode.value__
            $statusDesc = $_.Exception.Response.StatusDescription
            
            Write-Host "`n[-] CONNECTION ERROR: Server responded with Status: $statusCode ($statusDesc)" -ForegroundColor Red
            
            if ($_.Exception.Response) {
                $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
                $serverErr = $reader.ReadToEnd()
                Write-Host "[!] Server Raw Error Dump: $serverErr" -ForegroundColor DarkYellow
            }
            Write-Host ""
        }
    } else {
        # REAL TERMINAL COMMAND EXECUTION MATRIX
        try {
            $finalCmd = $trimmedMsg
            if ($trimmedMsg.StartsWith("sudo ")) {
                $finalCmd = $trimmedMsg.Substring(5)
            }

            if ($PSVersionTable.OS -like "*Windows*") {
                cmd.exe /c $finalCmd
            } else {
                /bin/sh -c $finalCmd
            }
        }
        catch {
            Write-Host "[-] ExecError: '$trimmedMsg' failed to invoke inside host environment shell." -ForegroundColor Red
        }
    }
}
