@echo off

:instalarimpressora
title Instalar Impressora - jks_84@hotmail.com

:: Definindo as variáveis. Dados referente à impressora:
set MARCAPRINTER=Lexmark
set MODELOPRINTER=T654
set SNPRINTER=SN123456789XYZ
set ENDIPPRINTER=127.0.0.1
set PASTADRIVERPRINTER=%SYSTEMDRIVE%\TEMP\LexmarkUniversal\Drivers\Print\GDI
set ARQUIVODRIVERPRINTER=%SYSTEMDRIVE%\TEMP\LexmarkUniversal\Drivers\Print\GDI\LMUD1o40.inf
set NOMEDRIVERPRINTER=Lexmark Universal v2

:: Remover Porta TCP/IP
Cscript "%WINDIR%\system32\Printing_Admin_Scripts\pt-BR\Prnport.vbs" -d -r IP_%ENDIPPRINTER%

:: Criar porta local da impressora:
Cscript "%WINDIR%\system32\Printing_Admin_Scripts\pt-BR\Prnport.vbs" -a -r IP_%ENDIPPRINTER% -h %ENDIPPRINTER% -o raw -n 9100

:: Adicionando o driver de impressão para impressora especificada. Apontando o arquivo e diretório local do driver de impressão:
Cscript "%WINDIR%\system32\Printing_Admin_Scripts\pt-BR\Prndrvr.vbs" -a -m "%NOMEDRIVERPRINTER%" -i "%ARQUIVODRIVERPRINTER%" -h "%PASTADRIVERPRINTER%"

:: Instalando impressora para o driver especificado, definindo seu nome e porta:
Cscript "%WINDIR%\system32\Printing_Admin_Scripts\pt-BR\Prnmngr.vbs" -a -p "%MARCAPRINTER% - %MODELOPRINTER% - %SNPRINTER%" -m "%NOMEDRIVERPRINTER%" -r IP_%ENDIPPRINTER%

:: Imprimir pagina teste:
wmic printer where name="%MARCAPRINTER% - %MODELOPRINTER% - %SNPRINTER%" call printtestpage

:: Abre o painel das impressoras e dispositivos
control printers 

exit 
