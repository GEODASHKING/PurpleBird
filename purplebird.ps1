Clear-Host

Write-Host "========================================" -ForegroundColor Purple
Write-Host "             PURPLE BIRD               " -ForegroundColor Purple
Write-Host "========================================" -ForegroundColor Purple
Write-Host ""
Write-Host "Select a simulation module to run:" -ForegroundColor Cyan
Write-Host " [1] Virus:DOS/Finnish_Sprayer (module1.ps1)"
Write-Host " [2] Exit"
Write-Host ""

$Selection = Read-Host "Enter choice"

switch ($Selection) {
    "1" {
        $ModulePath = "$PSScriptRoot\module1.ps1"
        
        if (Test-Path $ModulePath) {
            Write-Host "`n[+] Executing module1.ps1..." -ForegroundColor Yellow
            & $ModulePath
            Write-Host "[+] Execution finished." -ForegroundColor Green
        } else {
            Write-Host "`n[-] Error: module1.ps1 not found in the current directory." -ForegroundColor Red
        }
    }
    
    "2" {
        Write-Host "`n[+] Exiting Purple Bird."
        Exit
    }
    
    Default {
        Write-Host "`n[-] Invalid choice." -ForegroundColor Red
    }
}
