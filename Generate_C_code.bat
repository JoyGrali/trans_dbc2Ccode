@echo off

set "exe_path=.\coderdbc.exe"
set "dbc_folder=.\"
set "output_dir=.\code"

del /q "%output_dir%\*.c"
del /q "%output_dir%\*.h"

if not exist "%output_dir%" (
    mkdir "%output_dir%"
)

for %%F in ("%dbc_folder%\*.dbc") do (
    set "dbc_file=%%~fF"
    set "drvname=%%~nF"
    "%exe_path%" -dbc "%%F" -out "%output_dir%" -drvname "%%~nF"

)


move /y "%output_dir%\000\*.c" "%output_dir%"
move /y "%output_dir%\butl\*.c" "%output_dir%"
move /y "%output_dir%\conf\*.c" "%output_dir%"
move /y "%output_dir%\inc\*.c" "%output_dir%"
move /y "%output_dir%\lib\*.c" "%output_dir%"
move /y "%output_dir%\usr\*.c" "%output_dir%"

move /y "%output_dir%\000\*.h" "%output_dir%"
move /y "%output_dir%\butl\*.h" "%output_dir%"
move /y "%output_dir%\conf\*.h" "%output_dir%"
move /y "%output_dir%\inc\*.h" "%output_dir%"
move /y "%output_dir%\lib\*.h" "%output_dir%"
move /y "%output_dir%\usr\*.h" "%output_dir%"

rd /s /q "%output_dir%\000"
rd /s /q "%output_dir%\butl"
rd /s /q "%output_dir%\conf"
rd /s /q "%output_dir%\inc"
rd /s /q "%output_dir%\lib"
rd /s /q "%output_dir%\usr"

exit -b