$start = Get-Date
$proc = Start-Process -FilePath "D:\opencode\GoClaw\picoclaw.exe" -ArgumentList "gateway" -PassThru
Start-Sleep -Seconds 5
if (-not $proc.HasExited) {
    Write-Host "SUCCESS: Running with PID: $($proc.Id)"
    netstat -ano | Select-String "18790|8080"
} else {
    Write-Host "FAILED: Exit code: $($proc.ExitCode)"
    # Check new log entries
    $logs = Get-Content "C:\Users\86159\.picoclaw\logs\gateway.log" -Tail 20
    $logs | ForEach-Object { Write-Host $_ }
}