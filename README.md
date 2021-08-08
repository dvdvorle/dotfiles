# Highlights

Installeert en configureert
- Visual Studio met de juiste loadout om Socrates te kunnen ontwikkelen
- WSL2 met Ubuntu 20.04
- gVim als editor
- Chrome

en [meer](choco-packages.config)...

## Op de oude VDI
- Indien je gebruik maakt van sql developer. Maak een export van alle connections incl. password.
- Exporteer je browser favorites

Sla beide exports op buiten de VDI, bijv. je H:\ schijf

## Op de nieuwe VDI

1. Edit in `home\.gitconfig` de user.email en user.name
2. Open powershell als Administrator, navigeer naar de huidige map en draai de volgende commando's
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Force
   Unblock-File .\provision1.ps1
   .\provision1.ps1
   ```
3. Wacht tot het script is afgelopen, de computer wordt automatisch herstart.
4. Log opnieuw in. Automatisch wordt het vervolg, `provision2.ps1`, gestart.
5. Enkele resterende handmatige acties worden getoond aan het einde van `provision2.ps1`
6. Start Ubuntu, creeer een account, navigeer naar de map met scripts (bijv. `/mnt/d/dotfiles-main/`) en voer de volgende commando's uit
   ```bash
   cp provision.sh ~/provision.sh
   cd ~
   sudo ./provision.sh
   ```
