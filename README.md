# Highlights

Installeert en configureert
- Visual Studio met de juiste loadout om Socrates te kunnen ontwikkelen
- WSL2 met Ubuntu 20.04
- ConEmu als console host
- gVim als editor
- Chrome

en [meer](choco-packages.config)...

## Op de oude VDI
- Indien je gebruik maakt van sql developer. Maak een export van alle connections incl. password.
- Exporteer je browser favorites

Sla beide exports op buiten de VDI, bijv. je H:\ schijf

## Op de nieuwe VDI

Open powershell als Administrator, navigeer naar de huidige map en draai de volgende commando's

	Set-ExecutionPolicy RemoteSigned
	.\provision1.ps1

Nadat deze gedraaid heeft, reboot dan de machine. Negeer het Docker Desktop venster ("WSL 2
installation is complete"). Voer vervolgens in een nieuw Administrator powershell venster uit:

	.\provision2.ps1

Nadat deze klaar is kun je in het Docker Desktop venster "Restart" aanklikken. Enkele resterende
handmatige acties worden getoond aan het einde van `provision2.ps1`
