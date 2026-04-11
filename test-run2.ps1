$errLog = "$env:TEMP\picoclaw_err_$PID.log"
$outLog = "$env:TEMP\picoclaw_out_$PID.log"
$proc = Start-Process -FilePath "D:\opencode\GoClaw\picoclaw.exe" -ArgumentList "gateway" -PassThru -RedirectStandardError $errLog -RedirectStandardOutput $outLog
Start-Sleep -Seconds 3
Write-Host "Exit code: $($proc.ExitCode)"
Write-Host "--- STDERR ---"
if (Test-Path $errLog) { Get-Content $errLog }
Write-Host "--- STDOUT ---"
if (Test-Path $outLog) { Get-Content $outLog }
# Cleanup
Remove-Item $errLog -ErrorAction SilentlyContinue
Remove-Item $outLog -ErrorAction SilentlyContinue