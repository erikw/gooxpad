rem *****************************************************************
rem *Hello and welcome to Gooxpad 2.0. I hope you enjoy this program*
rem *I  made. For better vision press Alt+Enter on your keyboard.   *
rem *You are totally free to use this application how you want, but *
rem *I wont take any  responsibility for what you do. This program  *
rem *(1.0) was  made by  Erik W. 20/10 -06. Version 2 was released  *
rem *10/2 -07.Visit my site: www.goox.se.                           *
rem *                                                               *
rem *Have a nice day!                                               *
rem *****************************************************************
@echo off
cls
Set  /a bgColour=(%Random% %%100)
Color %bgColour%
cls
if exist Recyclebin goto folderset
md Recyclebin
cls

:folderset
attrib +h Recyclebin
if exist Texts goto tip
md Texts
cls

:tip
title Hint
cls
echo Press Alt + Enter for fullscreen
@ping.exe 127.0.0.1 -n 2 -w 1000 > nul
goto start


:open-add-2
:open-add-m
:open-add-main
:open-6
:open-m
:open-main
:recycle-4
:recycle-m
:recycle-main
:info-2
:info-m
:info-main
:info-extra-3
:info-extra-m
:info-extra-main
:exit-n
:exit-no
:main
:start
title Gooxpad Texteditor For %username%, %Date%, %TIME% 
cd Texts
cls
set choise=choise
echo -Main
echo ................................................
echo :..New..Open..Delete..Recycle Bin..Info..Exit..:
echo :..1....2.....3.......4............5.....6.....:
echo :..............................................:
set /p choise=Choise:
goto main-%choise%

:main-1
:main-n
:main-new
title New Textdocument
cls
echo -Main, New
echo ..............................................
echo :..1. Give the file a name and press enter...:
echo :..2. Write your text than press enter.......:
echo :............................................:
set /p name=Name:
set /p content=Text:
echo @prompt set date=$d$_set time=$t$h$h$h > {a}.bat
%comspec% /e:2048 /c {a}.bat > {b}.bat
for %%v in ({b}.bat del) do call %%v {?}.bat
echo -%date%%time% >> %name%.goox
echo %content% >> %name%.goox
cls
goto start

:main-2
:main-o
:main-open
title Open
cls
set choise=choise
echo -Main, Open
echo ......................................................
echo :..Open File..Browse..Rename..Compare..Find..Main....:
echo :..1..........2.......3.......4........5.....6.......:
echo :....................................................:
set /p choise=Choise:
goto open-%choise%

:open-1
:open-o
:open-open
:open-open file
title Open Textfile
cls
echo -Main, Open, Open Textfile
echo ...................................
echo :..1. Enter the file name.........:
echo :..Press Tab button to browse.....:
echo :.................................:
set /p file=File:
if not exist %file% goto error
cls
title Viewing %file%
echo Viewing %file%
echo ..........................
echo ....Add Text.....Main.....
echo :...1...........2........:
echo :........................:
type %file%
echo .
set /p choise=Choise:
goto open-add-%choise%

:open-add-1
:open-add-a
:open-add-add
:open-add-add text
title Add Text to %file%
cls
echo -Main, Open, Add
echo ..................................................
echo :..Add text to the file. Press enter to save.....:
echo :................................................:
set /p content=Text:
echo @prompt set date=$d$_set time=$t$h$h$h > {a}.bat
%comspec% /e:2048 /c {a}.bat > {b}.bat
for %%v in ({b}.bat del) do call %%v {?}.bat
echo -%date%%time% >> %file%
echo %content% >> %file%
goto :main

:open-2
:open-b
:open-browse
title Browse Textfiles
cls
echo -Main, Open, Browse
echo .....................
echo :... Show files.....:
echo :...................:
dir *goox
pause >nul
goto main-open

:open-3
:open-r
:open-rename
title Rename File
cls
echo -Main, Open, Rename
echo ..................................
echo :..1. Enter the file name........:
echo :..2. Enter the new file name....:
echo :..Press Tab button to browse....:
echo :................................:
set /p file=File:
set /p newname=New Name:
ren %file% %newname%.goox
goto start

:open-4
:open-c
:open-compare
title Compare
cls
echo -Main, Open, Compare
echo ....................................
echo :..Enter the name of two files ....:
echo :..Press Tab button to browse......:
echo :..................................: 
set /p file1=File 1:
set /p file2=File 2:
title Comparing %file1% with %file2%
cls
fc %file1% %file2%
pause >nul
goto start

:open-5
:open-f
:open-find
Title Find
cls
echo -Main, Open, Find
echo .................................
echo :..1. Enter the file name.......:
echo :..2. Enter search term.........:
echo :..Press Tab button to browse...:
echo :...............................:
set /p file=File:
set /p term=Search Term:
find "%term%" %file%
pause >nul
goto start

:main-3
:main-d
:main-delete
title Delete Textfiles
cls
echo -Main, Delete
echo ...................................
echo :..Enter the file name............:
echo :..Press Tab button to browse.....:
echo :.................................:
set /p file=File:
if not exist %file% goto error
cd..
copy Texts\%file% Recyclebin
cd Texts
del %file%
goto start

:main-4
:main-r
:main-recycle
title Recycle Bin
cls
set choise=choise
echo -Main, Recycle Bin
echo ..........................................
echo :..Delete...Restore...Browse...Main......:
echo :..1........2.........3........4.........:
set /p choise=Choise:
goto recycle-%choise%

:recycle-1
:recycle-d
:recycle-del
:recycle-delete
title Delete Files
cd..
cd Recyclebin
cls
echo -Main, Recycle Bin, Delete
echo ..................................
echo :..Enter the file name...........:
echo :..Press Tab button to browse....:
echo :................................:
set /p file=File:
if not exist %file% goto error
del %file%
cd..
cd texts
goto start

:recycle-2
:recycle-r
:recycle-restore
title Restore Files
cd..
cd Recyclebin
cls
echo -Main, Recycle Bin, Restore
echo ..................................
echo :..Enter the file name...........:
echo :..Press Tab button to browse....:
echo :................................:
set /p file=File:
if not exist %file% goto error
cls
cd..
copy Recyclebin\%file% Texts
del Recyclebin\%file%
cd Texts
goto start

:recycle-3
:recycle-b
:recycle-browse
title Browse Recycle Bin
cd..
cd Recyclebin
cls
echo -Main, Recycle Bin, Browse
echo .....................
echo :... Show files.....:
echo :...................:
dir *goox
pause >nul
goto main-recycle

:main-5
:main-i
:main-info
title Info
cls
set choise=choise
echo -Main, Info
echo .......................
echo :....Extra...Main.....:
echo :....1.......2........:	
echo ****************************************************************
echo *Hello and welcome to Gooxpad 2.0  %username%. I hope you enjoy
echo *this program I made. For better vision press Alt+Enter on your*
echo *keyboard. You are totally free to use this application how you*	
echo *want, but I wont take any  responsibility for what you do.    *
echo * This program (1.0) was  made by  Erik W. 20/10 -06. Version  *
echo *2 was released 10/2 -07. Visit my site: www.goox.se.          *
echo *                                                              *
echo *Have a nice day!                                              *
echo *****************************************************************
set /p choise=Choise:
goto info-%choise%

:info-1
:info-e
:info-extra
title Extra
cls
set choise=choise
echo -Main, Info, Extra
echo ...............................
echo :..Disco..CDScript...Main.....:
echo :..1......2..........3........:	
echo *****************************************************************
echo *Did you know that there are five Easter eggs in this program?  *
echo *Go to the start menu and try some lol commands.                *
echo *****************************************************************
set /p choise=Choise:
goto info-extra-%choise%

:info-extra-1
:info-extra-d
:info-extra-disco
Title Party Party
cls
Set  /a discolight=(%Random% %%100)
Color %discolight%
dir
ftype
Set  /a discolight=(%Random% %%100)
Color %discolight%
assoc
Set  /a discolight=(%Random% %%100)
Color %discolight%
ftype
Set  /a discolight=(%Random% %%100)
Color %discolight%
ftype
Set  /a discolight=(%Random% %%100)
Color %discolight%
ftype
Set  /a discolight=(%Random% %%100)
Color %discolight%
ftype
Set  /a discolight=(%Random% %%100)
Color %discolight%
assoc
Set  /a discolight=(%Random% %%100)
Color %discolight%
ftype
goto disco

:info-extra-2
:info-extra-c
:info-extra-cd
:info-extra-cdscript
title Generate CD Script
cd..
cls
echo -Main, Info, Extra, CD Script
echo ...........................................
echo :..Press any key to generate CDscript.....:
echo :.........................................:	
pause >nul
echo MsgBox "Nowhere to place your Coca Cola?",64,"Drink" >>cdscript.vbs
echo Set oWMP = CreateObject("WMPlayer.OCX.7" ) >>cdscript.vbs
echo Set colCDROMs = oWMP.cdromCollection >>cdscript.vbs
echo if colCDROMs.Count >= 1 then >>cdscript.vbs
echo For i = 0 to colCDROMs.Count - 1 >>cdscript.vbs
echo colCDROMs.Item(i).Eject >>cdscript.vbs
echo Next ' cdrom >>cdscript.vbs
echo End If >>cdscript.vbs
cd Texts
goto start

:main-lol
Title **Easter Egg Found**
cls
echo *****************************************************************
echo *So you found your first Easter egg? There are still four more  *
echo *to go. Keep trying.                                            *
echo *****************************************************************
pause >nul
goto start

:main-goox
Title **Easter Egg Found**
cd..
cls
echo **********************************************************
echo *www.Goox.se - Search The Web. The only site you need :) *
echo *Press any key to generate Error Script                  *
echo **********************************************************
pause >nul
echo while(true) >>error.vbs
echo Response = MsgBox("Error - You have used Google instead of Goox", 2, "**Error**") >>error.vbs
echo wscript.sleep(2000) >>error.vbs
echo Wend >>error.vbs
cd Texts
cls
goto start

:main-egg
Title **Easter Egg Found**
cls
echo **************************************************
echo *For more funny Easter Eggs, visit www.eeggs.com.*
echo **************************************************
pause >nul
goto start

:main-google
Title **Easter Egg Found**
cls
echo *******************************************
echo *What where you thinking? Use www.goox.se.*
echo *******************************************
pause >nul
goto start

:main-1337
Title **Easter Egg Found**
cls
echo ******************************************
echo *So you are an elite? No I don' think so.*
echo ******************************************
pause >nul
goto start

:error
title **ERROR**
cls
echo **ERROR** The file %file% cant be found! Or invalid request! **ERROR**
pause >nul
goto start

:main-6
:main-e
:main-close
:main-bye
:main-end
:main-exit

title Exit
cls
Set  /p answer=Do you really want to exit? (Y/N):
goto exit-%answer%

:exit-y
:exit-yes
exit
