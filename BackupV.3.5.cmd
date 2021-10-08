rem Script para Backup de dados do Usuário.
rem V.3.5
rem Executar sempre como Administrador
rem Início Log -----------------------------------------
rem Incluso Pasta Configuração Google Drive							- 26/11/2017
rem Incluso Pasta Credentials em %localappdata% 						- 26/11/2017
rem Alterado destino perfil do usuário com .BKP no final					- 26/11/2017
rem Incluso lista de arquivos abertos recentemente do Office					- 26/11/2017
rem Incluso lista de arquivos abertos recentemente do Windows					- 26/11/2017
rem Incluso lista de atalhos da Bibliotecas							- 26/11/2017
rem Incluso pasta Themes (Papel de Parede)							- 26/11/2017
rem Alterada linha backup Totvs para cópia somente dos arquivos *.INI para a pasta Totvs.BKP 	- 04/01/2018
rem Alterada linha backup Lotus Notes para inibir a cópia das pastas temporárias *.ft 		- 12/01/2018
rem Adicionada linha para cópia do Sticky Notes específica das versões novas do Windows 10 	- 12/01/2018
rem Adicionada linha para cópia do MySQL (Configuração do Aplicativo) 				- 18/01/2018
rem Adicionada linha para cópia do Elcomsoft 							- 18/01/2018
rem Adicionada linha para fechar a execução do Lotus Notes antes da cópia do perfil 		- 18/01/2018
rem Adicionado Bloco para Carteiras Virtuais - Ethereum e Ethereum Wallet em %appdata% 		- 18/01/2018
rem Adicionada linha para cópia do NetExpress (Aplicativo Bradesco para PC) 			- 18/01/2018
rem Incluso linha para ignorar cópia total da pasta totvssped no bloco C:\			- 14/02/2018
rem Adicionada linha para cópia do totvssped (Complemento TAF+TSS)				- 14/02/2018
rem Corrigido linha %appdata%\Microsoft\Office\Recent que estava com e no final (recente)	- 22/02/2018
rem Adicionada a linha para cópia de Templates do Office					- 22/02/2018
rem Adicionada a linha para copiar o arquivo backup para o disco C e executa-lo continuamente	- 20/03/2018
rem Adicionada a linha para copiar o Programas_SPED						- 18/04/2018
rem Alterada a linha que copiava a Lixeira, a variável estava errada				- 18/04/2018
rem Alterada a linha do Onedrive - Alfa Laval, pois não estava sendo executada			- 15/06/2018
rem Alterada a linha para evitar copiar arquivos .BKP do Outlook				- 30/08/2018
rem Adicionada a linha para cópia dos temas do usuário						- 05/10/2018
rem Acrescentado a exclusão da pasta Windows.old no bloco BLOCO RAIZ DISCO C:			- 29/11/2018
rem Adicionada a linha para cópia de Programas RFB da Pasta Arquivos de Programas(x86)		- 08/01/2019
rem Alterada linha "Onedrive - Empresa" para Onedrive - Empresa.BKP" para evitar conflitos	- 05/02/2019
rem Adicionado exclusão de arquivos TMP da linha do Google Chrome				- 07/02/2019
rem Comentada linha do Onedrive - Empresa (Backup Nuvem) - Desnecessario			- 19/03/2019
rem Adicionado Mensagem para que seja checado o status do backup do Onedrive - Alfalaval	- 19/03/2019 2.9
rem Adicionado exclusão da pasta Logs do Backup do Itunes (%appdata%\Apple Computer\Logs)	- 26/03/2019 3.0
rem Adicionado exclusão do arquivo IPSW (Atualização Apple) (%appdata%\Apple Computer\Logs)	- 26/03/2019 3.0
rem Adicionada linha para cópia da pasta GRRF - Guia de Recolhimento Rescisório			- 10/05/2019 3.1
rem Adicionado linha para Citrix e alterada a linha do stickynotes para copia da pasta		- 30/03/2020 3.2
rem Alterada a linha de cópia das pastas do c:\ para excluir pastas desnecessárias		- 30/03/2020 3.2
rem Alterada linhas para backup de perfil com nome duplo - bug de perfil			- 06/06/2020 3.3
rem Retirada exceção da pasta OneDriveTemp para que seja feita a cópia				- 15/09/2020 3.4
rem Criado menu para escolha de destino do backup.						- 08/10/2021 3.5

rem Fim Log --------------------------------------------
cls

@Echo off

ECHO ***************************************************************************************************************
ECHO  						  Script de Backup 
ECHO 										Created by MFMMENEGHIN V.3.5
ECHO ***************************************************************************************************************
Echo Escolha um disco de Destino (ex: "D:", "E:", SEM ASPAS) ou caminho de rede (ex: "\\servidor\pasta", SEM ASPAS)
Echo.
Echo ***** Recomenda-se rodar em Modo Administrador! Caso o PC tenha mais de um usuario, rodar em todos eles! *****
Echo.
Echo Digite e aperte Enter!
Echo.
Echo.
set /p dsk=Destino: 


:BACKUP
REM ---------- BLOCO DADOS DE APLICATIVO ----------
ROBOCOPY "%appdata%\Apple Computer" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Roaming\Apple Computer" /xd logs /xf *.ipsw /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Audacity" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Audacity /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\DraftSight" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\DraftSight /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Elcomsoft" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Elcomsoft /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\FileZilla" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\FileZilla /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\IBM" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\IBM /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Credentials" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Microsoft\Credentials /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Internet Explorer\Quick Launch" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Office\Recent" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Microsoft\Office\Recent /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Signatures" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Microsoft\Signatures /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Sticky Notes" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Roaming\Microsoft\Sticky Notes" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Templates" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Microsoft\Templates /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Windows\Libraries" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Microsoft\Windows\Libraries /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Windows\Recent" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Microsoft\Windows\Recent /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Microsoft\Windows\Themes" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Microsoft\Windows\Themes /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\MySQL" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\MySQL /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\NetExpress50" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\NetExpress50 /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Notepad++" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Notepad++ /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Programas RFB" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Roaming\Programas RFB" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Sefaz" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Sefaz /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Serpro" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Serpro /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Skype" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Skype /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Stardock" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Stardock /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\TeamViewer" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\TeamViewer /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\UltraVNC" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\UltraVNC /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\VMware" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\VMware /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\uTorrent" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\uTorrent *.torrent /S /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\vlc" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\vlc /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Alfa Laval" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Local\Alfa Laval" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Autodesk" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Autodesk /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Citrix\SelfService" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Citrix\SelfServiceAutodesk /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Google\Chrome\User Data\Default" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Local\Google\Chrome\User Data\Default" *.* /xf *.tmp /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Google\Drive" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Google\Drive *.* /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\LogMeIn Hamachi" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Local\LogMeIn Hamachi" /E /R:1 /W:0 /XJ /ZB
"%ProgramFiles(x86)%\IBM\Lotus\Notes\nsd.exe" -hang -kill
ROBOCOPY "%localappdata%\Lotus" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Lotus /xd *.ft /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Microsoft\Credentials" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Microsoft\Credentials /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Microsoft\Outlook" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Microsoft\Outlook /xf *.bak *.ost /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Microsoft\Windows Photo Gallery" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Local\Microsoft\Windows Photo Gallery" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Microsoft\Windows\History" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Microsoft\Windows\History /xf *.ini /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Microsoft\Windows\Themes" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Microsoft\Windows\Themes /xf *.ini /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\ *.* /S /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\Xmarks" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Xmarks /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%\AppData\LocalLow\Sun\Java\Deployment\security" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Appdata\LocalLow\Sun\Java\Deployment\security\ *.sites /E /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO DADOS DE APLICATIVO CARTEIRAS VIRTUAIS ---------- 
ROBOCOPY "%appdata%\Ethereum Wallet" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\AppData\Roaming\Ethereum Wallet" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%appdata%\Ethereum" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Roaming\Ethereum /E /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO DADOS DE APLICATIVO WINDOWS 8/8.1/10---------- 
ROBOCOPY "%localappdata%\Microsoft\Windows\FileHistory" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\Microsoft\Windows\FileHistory /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%localappdata%\VirtualStore" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\AppData\Local\VirtualStore /E /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO DO PERFIL DO USUARIO ----------
ROBOCOPY "%userprofile%" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\ /s /xjd /xjf /xd .metadata .receitanet .vec AppData "Box Sync" Contacts Desktop Documents Downloads Dropbox Favorites GoogleDrive Links Music Onedrive Pictures "Saved Games" Skydrive Videos "VirtualBox VMs" /xf *.bak *.dat *.ini *.log* ntuser*.* *.pol *.regtrans-ms *.sys /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\.VirtualBox "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\.VirtualBox /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\.metadata "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\.metadata /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\.receitanet "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\.receitanet /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\.vec "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\.vec /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Contacts "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Contacts /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Desktop "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Desktop /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Documents "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Documents /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Downloads "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Downloads /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Dropbox "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Dropbox /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Favorites "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Favorites /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\GoogleDrive "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\GoogleDrive /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Links "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Links /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Music "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Music /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Onedrive "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Onedrive /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Pictures "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Pictures /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Searches "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Searches /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Skydrive "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Skydrive /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%"\Videos "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%".BKP\Videos /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%\Box Sync" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\Box Sync" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%\Saved Games" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\Saved Games" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%userprofile%\VirtualBox VMs" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\VirtualBox VMs" /E /R:1 /W:0 /XJ /ZB
rem ROBOCOPY "%userprofile%\OneDrive - Alfa Laval" "%dsk%\Backup\%COMPUTERNAME%\Users\%USERNAME%.BKP\OneDrive - Alfa Laval.BKP" /E /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO PROGRAMAS ----------
ROBOCOPY "%ProgramFiles(x86)%\CAIXA\SEFIP" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\CAIXA\SEFIP" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\Dimep\DMPREP" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\Dimep\DMPREP" *.cfg /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\GRRF" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\GRRF" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\IBM\Client Access\Emulator\Private" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\IBM\Client Access\Emulator\Private" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\IBM\Lotus\Notes\Data" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\IBM\Lotus\Notes\Data" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\Programas RFB" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\Programas RFB" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\Programas_SPED" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\Programas_SPED" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\REP_DESPESAS\UserReports" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\REP_DESPESAS\UserReports" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY "%ProgramFiles(x86)%\RMAdmin" "%dsk%\Backup\%COMPUTERNAME%\Program Files (x86)\RMAdmin" *.ini /S /R:1 /W:0 /XJ /ZB
ROBOCOPY "C:\Arquivos de Programas RFB" "%dsk%\Backup\%COMPUTERNAME%\Arquivos de Programas RFB" /E /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO RAIZ DISCO C: ----------
ROBOCOPY %Systemdrive%\$Recycle.bin %dsk%\Backup\%COMPUTERNAME%\Lixeira /E /R:1 /W:0 /XJ /ZB /xf desktop.ini
ROBOCOPY C:\ %dsk%\Backup\%COMPUTERNAME% /s /xjd /xjf /xd $av_asw $Recycle.bin $SysReset $WINDOWS.~BT $Windows.~WS adwcleaner APPS "Arquivos de Programas RFB" Autodesk Boot Config.msi Dell Documents Docume~1 ESD Intel MSDS MSOCache oem Perflogs Pimaco "Program files" "Program Files (x86)" Programdata Protheus Recovery "System Volume Information" Temp Totvs totvssped Users Windows Windows.old /xf bootmgr *.bak *.log *.sys /E /R:1 /W:0 /XJ /ZB
ROBOCOPY C:\Documents %dsk%\Backup\%COMPUTERNAME%\Documents /E /R:1 /W:0 /XJ /ZB
ROBOCOPY C:\Protheus %dsk%\Backup\%COMPUTERNAME%\Protheus /E /R:1 /W:0 /XJ /ZB
ROBOCOPY C:\Totvs %dsk%\Backup\%COMPUTERNAME%\Totvs.BKP *.ini /S /R:1 /W:0 /XJ /ZB
ROBOCOPY C:\totvssped %dsk%\Backup\%COMPUTERNAME%\totvssped.BKP *.ini /S /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO PROGRAM DATA / DISCO C: ----------
ROBOCOPY "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Startup" "%dsk%\Backup\%COMPUTERNAME%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" /E /R:1 /W:0 /XJ /ZB /xf desktop.ini
ROBOCOPY "%ProgramData%\Microsoft\Windows\Parental Controls" "%dsk%\Backup\%COMPUTERNAME%\ProgramData\Microsoft\Windows\Windows\Parental Controls" /E /R:1 /W:0 /XJ /ZB
ROBOCOPY %ProgramData%\AMMYY %dsk%\Backup\%COMPUTERNAME%\ProgramData\AMMYY /E /R:1 /W:0 /XJ /ZB
ROBOCOPY %ProgramData%\Microsoft\DRM %dsk%\Backup\%COMPUTERNAME%\ProgramData\Microsoft\DRM /E /R:1 /W:0 /XJ /ZB
ROBOCOPY %ProgramData%\Microsoft\Windows\DRM %dsk%\Backup\%COMPUTERNAME%\ProgramData\Microsoft\Windows\DRM /E /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO PASTA WINDOWS ----------
ROBOCOPY %windir%\System32\Drivers\etc %dsk%\Backup\%COMPUTERNAME%\Windows\System32\Drivers\etc hosts /E /R:1 /W:0 /XJ /ZB
ROBOCOPY %windir%\Fonts %dsk%\Backup\%COMPUTERNAME%\Windows\Fonts /E /R:1 /W:0 /XJ /ZB
ROBOCOPY %windir%\Tasks %dsk%\Backup\%COMPUTERNAME%\Windows\Tasks /E /R:1 /W:0 /XJ /ZB


REM ---------- BLOCO EXPORTA REGISTRO ---------- 
REG EXPORT "HKEY_CURRENT_USER\Software\VB and VBA Program Settings" %dsk%\Backup\%COMPUTERNAME%\VBA-%USERNAME%.REG /y

MSG * CHECAR A PASTA ONEDRIVE - Empresa ou Onedrive!!! VERIFICAR SE CONSTAM AS 3 PASTAS NO BACKUP!!! (DESKTOP, DOCUMENTS E FAVORITES)
"%LOCALAPPDATA%\Microsoft\OneDrive\OneDrive.exe"
MSG * BACKUP FINALIZADO!!! Verificar as pastas de perfil do usuário.
MSG * Backup encontra-se em %dsk%\Backup\%COMPUTERNAME%\

rem copy Backup.cmd c:\
rem c:\Backup.cmd