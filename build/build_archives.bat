::
:: Set variables
::

set /P version= Enter the version number: 

set tempFolder=temp
set outputFolder=output

set higurashiData=HigurashiEp04_Data

set changelog=cambiamenti.txt

set readme=leggimi.txt
set readmeInstaller=leggimi_07th_mod_installer.txt
set readmeManual=leggimi_manuale.txt

set assets=sharedassets0.assets
set assetsWindowsSteamGogMangaGamer=sharedassets0.assets
set assetsLinuxMacOsSteamGogMangaGamer=LinuxMac-Steam-GOG-MG-5.4.1f1.languagespecificassets

set output07th=himatsubushi_ita_07th_mod_installer.7z
set outputWindowsSteamGogMangaGamer=himatsubushi_ita_windows_steam_gog_mg_%version%.7z
set outputLinuxMacOsSteamGogMangaGamer=himatsubushi_ita_linux_macos_steam_gog_mg_%version%.7z


::
:: Create folders
::

rmdir /Q /S .\%tempFolder%
md .\%tempFolder%

md .\%outputFolder%


::
:: Delete old archives
::

del .\%outputFolder%\%output07th%
del .\%outputFolder%\%outputWindowsSteamGogMangaGamer%
del .\%outputFolder%\%outputLinuxMacOsSteamGogMangaGamer%


::
:: Create 07th archive
::

robocopy ..\%higurashiData% .\%tempFolder%\%higurashiData% /E /MIR
copy ..\%changelog% .\%tempFolder%\%changelog%
copy ..\%readmeInstaller% .\%tempFolder%\%readme%

7za a .\%outputFolder%\%output07th% .\%tempFolder%\* -ssw -mx9


::
:: Initialize common manual archive
::

del .\%tempFolder%\%readme%

copy ..\%readmeManual% .\%tempFolder%\%readme%


::
:: Create Windows Steam/GOG/MangaGamer manual archive
::

del .\%tempFolder%\%higurashiData%\%assets%
del .\%tempFolder%\%higurashiData%\%assetsWindowsSteamGogMangaGamer%
del .\%tempFolder%\%higurashiData%\%assetsLinuxMacOsSteamGogMangaGamer%

copy ..\%higurashiData%\%assetsWindowsSteamGogMangaGamer% .\%tempFolder%\%higurashiData%\%assets%

7za a .\%outputFolder%\%outputWindowsSteamGogMangaGamer% .\%tempFolder%\* -ssw -mx9


::
:: Create Linux/MacOS Steam/GOG/MangaGamer manual archive
::

del .\%tempFolder%\%higurashiData%\%assets%
del .\%tempFolder%\%higurashiData%\%assetsWindowsSteamGogMangaGamer%
del .\%tempFolder%\%higurashiData%\%assetsLinuxMacOsSteamGogMangaGamer%

copy ..\%higurashiData%\%assetsLinuxMacOsSteamGogMangaGamer% .\%tempFolder%\%higurashiData%\%assets%

7za a .\%outputFolder%\%outputLinuxMacOsSteamGogMangaGamer% .\%tempFolder%\* -ssw -mx9


::
:: Remove temp files
::

rmdir /Q /S .\%tempFolder%