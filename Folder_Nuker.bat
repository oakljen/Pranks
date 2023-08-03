@echo off
setlocal enabledelayedexpansion

set "alphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set "numbers=1"
fsutil file createnew large_file.txt 1000000000

FOR /L %%N IN (1,1,20) do (
    set /a "random_letter1=!RANDOM! %% 26"
    set /a "random_letter2=!RANDOM! %% 26"

    for %%A in (!random_letter1!) do set "letter1=!alphabet:~%%A,1!"
    for %%B in (!random_letter2!) do set "letter2=!alphabet:~%%B,1!"

    set "random_folder=!letter1!!letter2!!numbers!"

    md "!random_folder!"
    copy "large_file.txt" "!random_folder!\large_file.txt"

    set /a "numbers+=1"
)
del large_file.txt
pause
