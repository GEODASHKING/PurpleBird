$TargetDir = "C:\Windows\Temp\Finnish_Sprayer"
$FileCount = 100

if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -ErrorAction SilentlyContinue | Out-Null
}

for ($i = 1; $i -le $FileCount; $i++) {
    $FileName = "v_sprayer_$i.dat"
    Set-Content -Path "$TargetDir\$FileName" -Value "MZ@" -ErrorAction SilentlyContinue
}

Start-Sleep -Seconds 15

Remove-Item -Path "$TargetDir" -Recurse -Force -ErrorAction SilentlyContinue
