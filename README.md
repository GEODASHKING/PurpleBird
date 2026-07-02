Purple Bird 🐦
Purple Bird is a lightweight, open-source adversary simulation framework designed for IT professionals, system administrators, and security defenders. It allows you to safely run synthetic security tests to see if your EDR (Endpoint Detection and Response), SIEM, or Antivirus software is actively monitoring, detecting, and alerting on suspicious behaviors.

Inspired by frameworks like Atomic Red Team, Purple Bird focuses on simple, transparent, and completely harmless scripts to help you validate your security controls and logging configuration.

Features
Modular Design: Simple framework structure making it incredibly easy to add custom tests.

100% Non-Destructive: Actions mimic malware patterns but carry entirely benign payloads.

Automated Self-Cleanup: Built-in cleanup logic ensures test artifacts are removed immediately after execution.

Zero Dependencies: Pure PowerShell framework that requires no external software or heavy installations.

Repository Structure
The project is kept highly organized and readable:

PurpleBird/
├── README.md          # Project documentation
├── purplebird.ps1     # The interactive main menu/controller script
└── module1.ps1        # Module 1: Virus:DOS/Finnish_Sprayer simulation

Simulation Modules
🛡️ Module 1: Virus:DOS/Finnish_Sprayer
Behavior Mimicked: Automated dropper or wiper behavior. It attempts to rapidly spray files into a common system staging area.

The Heuristic Trigger: High-frequency file creation inside a crucial system directory (C:\Windows\Temp) combined with fake MZ magic bytes (the classic executable binary headers).

Safety Reality: The script drops empty, harmless payload files, pauses for 15 seconds to give your security software time to react, and then automatically sweeps the directory clean.

Installation & Setup
To install and run Purple Bird, open PowerShell as an Administrator and run this combined one-liner. This automatically unblocks script execution for the session, downloads the repository, and deploys it straight to your C:\ drive:

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-RestMethod -Uri "https://github.com/GEODASHKING/PurpleBird/archive/refs/heads/main.zip" -OutFile "$env:TEMP\PurpleBird.zip"; Expand-Archive -Path "$env:TEMP\PurpleBird.zip" -DestinationPath "C:" -Force; Get-ChildItem -Path "C:" -Filter "PurpleBird-*" | ForEach-Object { Move-Item -Path $_.FullName -Destination "C:\PurpleBird" -ErrorAction SilentlyContinue }; Remove-Item -Path "$env:TEMP\PurpleBird.zip" -Force

How to Run
Make sure you are using an Administrator PowerShell window (administrative privileges are required for scripts to write into system temporary paths).

Change your directory to the install location:
cd C:\PurpleBird

Launch the interactive framework runner:
.\purplebird.ps1

Enter 1 to select and execute the Finnish_Sprayer simulation.

Verifying Detections
Once a module finishes execution, log into your EDR console (e.g., Microsoft Defender for Endpoint, CrowdStrike, SentinelOne) or check your local Windows Event Viewer (Applications and Services Logs > Microsoft > Windows > PowerShell > Operational).

Look for alerts or logs mapping to these triggers:

Behavioral Heuristics: High-frequency file creation anomalies inside C:\Windows\Temp.

Script Block Logging: Automated loops originating from unsigned PowerShell contexts.

Static Binary Signatures: Heuristic detection of MZ signatures inside unexpected raw files.
