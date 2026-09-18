# Starts the local services required by Data Deduplication, verifies them,
# and opens the project. Run from PowerShell as Administrator.

$ErrorActionPreference = 'Stop'
$tomcatService = 'Tomcat7'
$mysqlService = 'MySQL55'
$projectUrl = 'http://localhost:8084/Data-depulication-2024/'

function Start-RequiredService([string]$name) {
    $service = Get-Service -Name $name -ErrorAction Stop
    if ($service.Status -ne 'Running') {
        Write-Host "Starting $name ..." -ForegroundColor Yellow
        Start-Service -Name $name
        $service.WaitForStatus('Running', [TimeSpan]::FromSeconds(30))
    }
    Write-Host "$name is running." -ForegroundColor Green
}

try {
    Start-RequiredService $mysqlService
    Start-RequiredService $tomcatService

    Write-Host 'Waiting for the web application to start ...' -ForegroundColor Yellow
    $response = $null
    for ($attempt = 1; $attempt -le 12; $attempt++) {
        try {
            $response = Invoke-WebRequest -Uri $projectUrl -UseBasicParsing -TimeoutSec 5
            break
        }
        catch {
            Start-Sleep -Seconds 2
        }
    }

    if ($null -eq $response -or $response.StatusCode -ne 200) {
        throw 'The project did not return HTTP 200. Check C:\Tomcat7\logs for errors.'
    }

    Write-Host 'SUCCESS: MySQL, Tomcat, and the Data Deduplication home page are working.' -ForegroundColor Green
    Start-Process $projectUrl
}
catch {
    Write-Host "CHECK FAILED: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
