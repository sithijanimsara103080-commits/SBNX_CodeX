// CommonJS syntax එක පාවිච්චි කරමු Vercel එකට වඩාත්ම ස්ටේබල් නිසා
module.exports = (req, res) => {
  const userAgent = req.headers['user-agent'] || '';

  if (userAgent.includes('PowerShell') || userAgent.includes('curl') || userAgent.includes('Wget')) {
    
    // PowerShell කේතය String Array එකක් ලෙස ලිවීමෙන් Node.js syntax errors සම්පූර්ණයෙන්ම වැළකේ
    const psLines = [
      "$OutputEncoding = [System.Text.Encoding]::UTF8",
      "[Console]::OutputEncoding = [System.Text.Encoding]::UTF8",
      "Clear-Host",
      "",
      "$host.UI.RawUI.WindowTitle = 'SBNX CODEX - COGNITIVE INTERFACE V5.0'",
      "$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(125, 45)",
      "$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(125, 45)",
      "",
      "Write-Host '[!] INITIALIZING COGNITIVE INTERFACE SYSTEM LAYER...' -ForegroundColor Gray",
      "Write-Host '-----------------------------------------------------------------------------------------------------------------' -ForegroundColor Gray",
      "Write-Host '[+] HOST MACHINE : ' $env:COMPUTERNAME -ForegroundColor Green",
      "Write-Host '[+] PROCESSING   : ARCH_X64_NEURAL_THREAD' -ForegroundColor Green",
      "Write-Host '[+] LOCAL INST   : CONFIG_NODE_READY' -ForegroundColor Green",
      "Write-Host '-----------------------------------------------------------------------------------------------------------------' -ForegroundColor Gray",
      "Start-Sleep -Seconds 1",
      "Clear-Host",
      "",
      "Write-Host '[!] INJECTING CORRUPTED BUFFER INTO MAIN MEMORY...' -ForegroundColor Red",
      "Start-Sleep -Seconds 1",
      "Write-Host '0x00F3A299C: MEM_ALLOC_SUCCESS' -ForegroundColor Gray",
      "Write-Host '0x00F3A244A: KERNEL_THREAD_ATTACHED' -ForegroundColor Gray",
      "Start-Sleep -Seconds 1",
      "Clear-Host",
      "",
      "Write-Host '  ___________________________________________________________' -ForegroundColor Green",
      "Write-Host '   ███████████      █████                ███████████ ' -ForegroundColor Green",
      "Write-Host '  ░░███░░░░░███    ░░███                ░░███░░░░░███' -ForegroundColor Green",
      "Write-Host '   ░███    ░███    ███████    ██████     ░███    ░███' -ForegroundColor Green",
      "Write-Host '   ░██████████    ░░░███░    ███░░███    ░██████████ ' -ForegroundColor Green",
      "Write-Host '   ░███░░░░░░       ░███     ░███ ░███    ░███░░░░░░ '" -ForegroundColor Green",
      "Write-Host '   ░███             ░███ ███ ░███ ░███    ░███       ' -ForegroundColor Green",
      "Write-Host '   █████            ░░█████  ░░██████     █████      ' -ForegroundColor Green",
      "Write-Host '  ░░░░░              ░░░░░    ░░░░░░     ░░░░░       ' -ForegroundColor Green",
      "Write-Host '  ___________________________________________________________' -ForegroundColor Green",
      "Write-Host '  [SYSTEM: ACTIVE]   [MODE: ENTERPRISE_AI_NODE]   [SITE: SBNX CODEX]' -ForegroundColor Gray",
      "Write-Host '-----------------------------------------------------------------------------------------------------------------'",
      "Write-Host ' PROVIDE PLATFORM OPERATOR SIGNATURE TO ACCESS CORE COMMANDS'",
      "Write-Host '-----------------------------------------------------------------------------------------------------------------'",
      "",
      "$user = Read-Host '[#] OPERATOR ID  '",
      "$pass = Read-Host '[#] SECURITY PIN '",
      "",
      "if ($user -ne 'admin' -or $pass -ne 'ai123') {",
      "    Write-Host '[-] SECURE SHUTDOWN: VERIFICATION FAILED.' -ForegroundColor Red",
      "    Start-Sleep -Seconds 2",
      "    exit",
      "}",
      "",
      "Clear-Host",
      "Write-Host '================================================================================================================='",
      "Write-Host 'SYSTEM ENVIRONMENT READY. CURRENT MODE: CONSOLE SHELL. (Type @adminai to change mode)'",
      "Write-Host '================================================================================================================='",
      "",
      "$aiMode = $false",
      "$supabaseUrl = 'https://nusdqyfwqkwinbwcqeor.supabase.co/functions/v1/process-message'",
      "",
      "while ($true) {",
      "    if ($aiMode) { $msg = Read-Host '🤖 SBNX-Codex@AI:~#' } else { $msg = Read-Host 'Operator@Core:~$' }",
      "    if ($msg -eq 'exit') { break }",
      "    if ($msg -eq 'clear') { Clear-Host; continue }",
      "    ",
      "    if ($msg -eq '@adminai') {",
      "        $aiMode = $true",
      "        Write-Host '-----------------------------------------------------------------------------------------------------------------'",
      "        Write-Host '[+] SBNX CODEX INTELLIGENCE CORE ACTIVATED. LINKING TO EDGE FUNCTION DIRECTORY...' -ForegroundColor Cyan",
      "        Write-Host '-----------------------------------------------------------------------------------------------------------------'",
      "        continue",
      "    }",
      "    ",
      "    if ($msg -eq '@info') {",
      "        Write-Host '========================================== INFO =========================================='",
      "        Write-Host 'SYSTEM IDENTITY : SBNX Codex Core Processing Core V5.0'",
      "        Write-Host 'INTERFACE MODE  : Hybrid Terminal Emulation Layer'",
      "        Write-Host 'EDGE ROUTING    : Supabase Serverless Execution Matrix'",
      "        Write-Host 'LANGUAGES       : English, සිංහල, Singlish Auto-Detection Matrix'",
      "        Write-Host '=========================================================================================='",
      "        continue",
      "    }",
      "    ",
      "    if ($aiMode) {",
      "        if (-not $msg) { continue }",
      "        Write-Host 'Thinking...' -ForegroundColor DarkGray",
      "        $body = @{ message = $msg } | ConvertTo-Json -Compress",
      "        try {",
      "            $response = Invoke-RestMethod -Uri $supabaseUrl -Method Post -Body $body -ContentType 'application/json; charset=utf-8' -TimeoutSec 20",
      "            $aiText = $response.message",
      "            if (-not $aiText) { $aiText = $response.response }",
      "            Write-Host \"🤖 AI: $aiText\" -ForegroundColor Cyan",
      "        } catch {",
      "            Write-Host '[-] CONNECTION ERROR: Unable to parse payload buffer to Supabase.' -ForegroundColor Red",
      "        }",
      "    } else {",
      "        if ($msg -eq 'ls') { Write-Host 'src/   public/   package.json   supabase/' }",
      "        elif ($msg -eq 'help') { Write-Host 'Available: ls, clear, help, @adminai, @info' }",
      "        else { Write-Host \"'$msg' is not recognized as an internal or external command.\" }",
      "    }",
      "}"
    ];

    res.setHeader('Content-Type', 'text/plain; charset=utf-8');
    return res.status(200).send(psLines.join('\n'));
  }

  // බ්‍රවුසර් එකට පෙන්නන 404 HTML එක
  res.setHeader('Content-Type', 'text/html');
  return res.status(404).send(`
    <!DOCTYPE html>
    <html>
    <head><title>404 Not Found</title></head>
    <body style="font-family:sans-serif; display:flex; height:100vh; align-items:center; justify-content:center; margin:0;">
      <div style="display:flex; align-items:center;">
        <h1 style="border-right:1px solid rgba(0,0,0,.3); margin:0; padding:10px 23px 10px 0; font-size:24px; font-weight:500;">404</h1>
        <h2 style="font-size:14px; font-weight:normal; margin:0; padding-left:20px;">This page could not be found.</h2>
      </div>
    </body>
    </html>
  `);
};
