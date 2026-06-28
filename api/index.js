const fs = require('fs');
const path = require('path');

module.exports = (req, res) => {
  const userAgent = req.headers['user-agent'] || '';

  // CMD/PowerShell/Curl හරහා ආවොත් පමණක් ස්ක්‍රිප්ට් එක සර්ව් කිරීම
  if (userAgent.includes('PowerShell') || userAgent.includes('curl') || userAgent.includes('Wget')) {
    try {
      // api ෆෝල්ඩර් එක ඇතුලේ තියෙන script.ps1 ෆයිල් එකේ පාත් එක ගැනීම
      const filePath = path.join(__dirname, 'script.ps1');
      
      // ෆයිල් එක UTF-8 විදිහට Read කිරීම
      const psScriptRaw = fs.readFileSync(filePath, 'utf8');
      
      // String.raw භාවිතා කර කිසිදු character එකක් වෙනස් නොවී සුරැකීම
      const safeScript = String.raw`${psScriptRaw}`;

      res.setHeader('Content-Type', 'text/plain; charset=utf-8');
      return res.status(200).send(safeScript);
      
    } catch (error) {
      // ෆයිල් එක කියවද්දී මොකක් හරි අවුලක් වුණොත් සේෆ්ටි එකට දෙන මැසේජ් එක
      res.setHeader('Content-Type', 'text/plain; charset=utf-8');
      return res.status(500).send("Write-Host '[-] SERVER ERROR: Internal file tracking failed.' -ForegroundColor Red");
    }
  }

  // සාමාන්‍ය බ්‍රවුසර් එකකින් ආවොත් දෙන සිරාම 404 HTML එක
  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  return res.status(404).send(
    '<html><head><title>404 Not Found</title></head>' +
    '<body style="font-family:sans-serif; display:flex; height:100vh; align-items:center; justify-content:center; margin:0; background:#fff; color:#000;">' +
    '<div style="display:flex; align-items:center;">' +
    '<h1 style="border-right:1px solid rgba(0,0,0,.3); margin:0; padding:10px 23px 10px 0; font-size:24px; font-weight:500;">404</h1>' +
    '<h2 style="font-size:14px; font-weight:normal; margin:0; padding-left:20px;">This page could not be found.</h2>' +
    '</div></body></html>'
  );
};
