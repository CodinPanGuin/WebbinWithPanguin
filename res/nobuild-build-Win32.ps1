Write-Host "Downloading nob.h"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tsoding/nob.h/refs/heads/main/nob.h" -OutFile "nob.h"

Write-Host "Writing nob.c"
@"
#define NOB_IMPLEMENTATION

#include "nob.h"

#define BUILD_FOLDER "build\\"
#define SRC_FOLDER   "src\\"

int main(int argc, char **argv)
{
    NOB_GO_REBUILD_URSELF(argc, argv);

    Nob_Cmd cmd = {0};

    if (!nob_mkdir_if_not_exists(BUILD_FOLDER)) return 1;
    nob_cmd_append(&cmd, "gcc", "-Wall", "-Wextra", "-o", BUILD_FOLDER "main.exe", SRC_FOLDER "main.c");
    if (!nob_cmd_run_sync(cmd)) return 1;

    return 0;
}
"@ | Out-File -Encoding utf8 nob.c

Write-Host "Creating starter code"
New-Item -ItemType Directory -Force -Path src | Out-Null
@"
#include <stdio.h>

int main()
{
    printf("Hello, World!\n");
    return 0;
}
"@ | Out-File -Encoding utf8 src\main.c

Write-Host "Creating building script"
@"
@echo off
gcc -o nob.exe nob.c
nob.exe
"@ | Out-File -Encoding utf8 build.bat

Write-Host "Making build script executable"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
icacls build.bat /grant Everyone:F

Write-Host "Cleaning up"
Remove-Item -Force nobuild-build-Unix.sh -ErrorAction SilentlyContinue