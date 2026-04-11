$p = Start-Process -FilePath "D:\opencode\GoClaw\picoclaw.exe" -ArgumentList "gateway" -PassThru
Start-Sleep -Seconds 3
if (-not $p.HasExited) {
    Write-Host "Running - PID: $($p.Id)"
} else {
    Write-Host "Exited with code: $($p.ExitCode)"
}