$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

# --- Supabase Injection ---
$supabaseUrl = "https://nusdqyfwqkwinbwcqeor.supabase.co/functions/v1/process-message"
$supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51c2RxeWZ3cWt3aW5id2NxZW9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI2MTc4NTMsImV4cCI6MjA5ODE5Mzg1M30.VjEuoKrkvhr3P-rjWekTVkhPztL8MndioKqUie3Mmhs"

if ($PSVersionTable.OS -like "*Windows*") {
    $host.UI.RawUI.WindowTitle = "SBNX CODEX - COGNITIVE INTERFACE V5.0"
}

# --- TERMINAL HISTORY BUFFER ---
$terminalHistory = New-Object System.Collections.Generic.List[string]

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

$BANNER_2 = " _________________________________________________________________________________________________________________`n" +
"  ███████████      █████                ███████████      █████████                                            `n" +
" ░░███░░░░░███    ░░███                ░░███░░░░░███    ███░░░░░███                                           `n" +
"  ░███    ░███    ███████    ██████     ░███    ░███   ░███     ░░░   ██████  █████ █████  ██████  ████████    `n" +
"  ░██████████    ░░░███░    ███░░███    ░██████████    ░░█████████  ███░░███░░███ ░░███  ███░░███░░███░░███   `n" +
"  ░███░░░░░░       ░███     ░███ ░███    ░███░░░░░░      ░░░░░░░░███░███████  ░███  ░███ ░███████  ░███ ░░░    `n" +
"  ░███             ░███ ███ ░███ ░███    ░███            ███    ░███░███░░░   ░░███ ███  ░███░░░   ░███        `n" +
"  █████            ░░█████  ░░██████     █████          ░░█████████ ░░██████   ░░█████    ░░██████ █████       `n" +
" ░░░░░              ░░░░░    ░░░░░░     ░░░░░            ░░░░░░░░░   ░░░░░░     ░░░░░      ░░░░░░ ░░░░░        `n" +
" _________________________________________________________________________________________________________________"

# ඔයා දීපු BANNER_2 එක ඒ විදිහටම (උඩ ලයින් එකත් එක්කම) මෙතනට දැම්මා මචං
$BANNER_1 = " _________________________________________________________________________________________________________________`n" +
" ███████╗██████╗ ███╗   ██╗██╗  ██╗     ██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗`n" +
" ██╔════╝██╔══██╗████╗  ██║╚██╗██╔╝     ██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗██╔╝`n" +
" ███████╗██████╔╝██╔██╗ ██║ ╚███╔╝      ██║     ██║   ██║██║  ██║█████╗   ╚███╔╝ `n" +
" ╚════██║██╔══██╗██║╚██╗██║ ██╔██╗      ██║     ██║   ██║██║  ██║██╔══╝   ██╔██╗ `n" +
" ███████║██████╔╝██║ ╚████║██╔╝ ██╗     ╚██████╗╚██████╔╝██████╔╝███████╗██╔╝ ██╗`n" +
" ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝      ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝`n" +
" _________________________________________________________________________________________________________________"

# --- RE-RENDER ENGINE (දෙකම හැමවෙලේම උඩින්ම පෙන්වයි) ---
function Refresh-Terminal {
    param ([bool]$Mode)
    Clear-Host
    Write-Host $BANNER_1 -ForegroundColor Green
    Write-Host $BANNER_2 -ForegroundColor Green
    
    if ($Mode) {
        Write-Host "  [SYSTEM: ACTIVE]   [MODE: ENTERPRISE_AI_NODE]   [SITE: SBNX CODEX]" -ForegroundColor Cyan
    } else {
        Write-Host "  [SYSTEM: ACTIVE]   [MODE: LOCAL_CONSOLE_SHELL]  [SITE: SBNX CODEX]" -ForegroundColor Gray
    }
    Write-Host "=================================================================================================================" -ForegroundColor Gray
    
    foreach ($line in $terminalHistory) {
        Write-Host $line
    }
}

# Login Screen Setup
Write-Host $BANNER_1 -ForegroundColor Green
Write-Host $BANNER_2 -ForegroundColor Green
Write-Host "  [SYSTEM: ACTIVE]   [MODE: INITIALIZING]         [SITE: SBNX CODEX]" -ForegroundColor Gray
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

$aiMode = $false
Refresh-Terminal $aiMode

while ($true) {
    if ($aiMode) {
        $promptStr = "🤖 SBNX-Codex@AI:~# "
    } else {
        $promptStr = "Operator@Core:~$ "
    }

    $msg = Read-Host $promptStr
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
            $terminalHistory.Clear()
            Refresh-Terminal $aiMode
            $terminalHistory.Add("[-] SBNX CODEX INTELLIGENCE CORE DEACTIVATED. RETURNED TO LOCAL PARAMETERS.")
            Refresh-Terminal $aiMode
            continue
        }
    }

    # SECRET COMMAND TO ENTER AI MODE
    if ($trimmedMsg -eq "@adminai") {
        $aiMode = $true
        Show-Loading "TUNNELING INTO SUPABASE SERVERLESS NETWORK" 1
        $terminalHistory.Clear()
        Refresh-Terminal $aiMode
        $terminalHistory.Add("[+] SBNX CODEX INTELLIGENCE CORE ACTIVATED. LINKING TO EDGE FUNCTION DIRECTORY...")
        Refresh-Terminal $aiMode
        continue
    }

    if ($trimmedMsg -eq "@info" -or $trimmedMsg -eq "info") {
        $terminalHistory.Add("`n========================================== INFO ==========================================")
        $terminalHistory.Add("SYSTEM IDENTITY : SBNX Codex Core Processing Core V5.0")
        $terminalHistory.Add("INTERFACE MODE  : Hybrid Terminal Emulation Layer")
        $terminalHistory.Add("EDGE ROUTING    : Supabase Serverless Execution Matrix")
        $terminalHistory.Add("==========================================================================================`n")
        Refresh-Terminal $aiMode
        continue
    }

    if ($trimmedMsg -eq "clear" -or $trimmedMsg -eq "cls") {
        $terminalHistory.Clear()
        Refresh-Terminal $aiMode
        continue
    }

    if ([string]::IsNullOrWhiteSpace($trimmedMsg)) { continue }

    # AI MODE RESPONSE PIPELINE
    if ($aiMode) {
        $terminalHistory.Add("🤖 User: $trimmedMsg")
        Refresh-Terminal $aiMode
        Write-Host "Thinking..." -ForegroundColor DarkGray
        
        $bodyObj = @{ message = $trimmedMsg; prompt = $trimmedMsg; content = $trimmedMsg }
        $body = $bodyObj | ConvertTo-Json -Compress
        $headers = @{ "apikey" = $supabaseKey; "Authorization" = "Bearer $supabaseKey"; "X-Client-Info" = "supabase-js-power" }

        try {
            $apiResponse = Invoke-WebRequest -Uri $supabaseUrl -Method Post -Headers $headers -Body $body -ContentType "application/json; charset=utf-8" -TimeoutSec 30
            $response = $apiResponse.Content | ConvertFrom-Json
            
            $replyText = ""
            if ($response.message) { $replyText = $response.message }
            elseif ($response.response) { $replyText = $response.response }
            elseif ($response.reply) { $replyText = $response.reply }
            elseif ($response.choices[0].message.content) { $replyText = $response.choices[0].message.content }
            else { $replyText = $apiResponse.Content }

            $terminalHistory.Add("🤖 AI: $replyText`n")
            Refresh-Terminal $aiMode
        }
        catch {
            $terminalHistory.Add("[-] CONNECTION ERROR: API payload block was rejected.`n")
            Refresh-Terminal $aiMode
        }
    } else {
        # REAL TERMINAL COMMAND EXECUTION MATRIX
        $terminalHistory.Add("Operator@Core:~$ $trimmedMsg")
        
        try {
            $finalCmd = $trimmedMsg
            if ($trimmedMsg.StartsWith("sudo ")) {
                $finalCmd = $trimmedMsg.Substring(5)
            }

            if ($finalCmd -like "cd*" -or $finalCmd -like "cd *") {
                Invoke-Expression $finalCmd
                Refresh-Terminal $aiMode
                continue
            }

            if ($PSVersionTable.OS -like "*Windows*") {
                if (Get-Command ( ($finalCmd -split ' ')[0] ) -ErrorAction SilentlyContinue) {
                    $cmdOutput = Invoke-Expression $finalCmd | Out-String
                } else {
                    $cmdOutput = cmd.exe /c $finalCmd | Out-String
                }
            } else {
                $cmdOutput = /bin/sh -c $finalCmd | Out-String
            }

            if (-not [string]::IsNullOrWhiteSpace($cmdOutput)) {
                $terminalHistory.Add($cmdOutput.TrimEnd())
            }
        }
        catch {
            $terminalHistory.Add("[-] ExecError: '$trimmedMsg' failed to invoke inside host environment shell.")
        }
        
        Refresh-Terminal $aiMode
    }
}
