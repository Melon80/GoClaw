$proc = Start-Process -FilePath "D:\opencode\GoClaw\picoclaw.exe" -ArgumentList "gateway" -PassThru -WindowStyle Hidden
Start-Sleep -Seconds 2
if ($proc.HasExited) {
    Write-Host "Exited with code: $($proc.ExitCode)"
} else {
    Write-Host "Running - PID: $($proc.Id)"
    # Check pid file
    $pidFile = "C:\Users\86159\.picoclaw\.picoclaw.pid"
    if (Test-Path $pidFile) {
        Write-Host "PID file exists:"
        Get-Content $pidFile
    }
    Stop-Process -Id $proc.Id
}