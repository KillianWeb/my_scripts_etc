::Guide to execute ytdlp download
@echo off

set audioswitch=
set format=
set url=
set sponsorblock=
set timestamp=

set /p url="Enter video URL: "
echo %url%
echo.

echo 1.Audio
echo 2.Video
choice /C 12 /M "Enter your choice:"
if ERRORLEVEL 2 goto Video
if ERRORLEVEL 1 goto Audio
:Audio
echo "Audio"
set audioswitch=-x
set format=--audio-format mp3
goto End
:Video
echo "Video"
set format=-S res,ext:mp4:m4a --recode mp4
goto End
:End
echo.

echo 1.Whole Video
echo 2.Partial Video
choice /C 12 /M "Enter your choice:"
if ERRORLEVEL 2 goto Partial
if ERRORLEVEL 1 goto Whole
:Whole
echo "Whole Video"
echo.
echo 1.Remove intro/outro
echo 2.Keep intro/outro
choice /C 12 /M "Enter your choice:"
if ERRORLEVEL 2 goto Keep
if ERRORLEVEL 1 goto Remove
:Keep
echo "Keep"
goto End2
:Remove
echo "Remove"
set sponsorblock=--sponsorblock-remove "intro,outro,music_offtopic"
goto End2
:End2
goto End
:Partial
echo "Partial Video"
echo.
set /p start="Enter start time in 00:00 format: "
set /p end="Enter end time in 00:00 format: "
set timestamp=--download-sections "*00:%start%-00:%end%"
goto End
:End
echo.

echo yt-dlp %audioswitch% %format% %sponsorblock% %timestamp% "%url%"
yt-dlp %audioswitch% %format% %sponsorblock% %timestamp% "%url%"

pause
