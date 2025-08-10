@echo off
REM CloudCannon Build Script - Universal Theme Compatibility (Windows)
REM This script ensures Hugo builds work on CloudCannon regardless of sync status

echo === CloudCannon Build Script Starting ===
echo Working directory: %cd%
hugo version

REM Diagnostic information
echo === Environment Check ===
echo HUGO_THEME: %HUGO_THEME%
echo HUGO_ENV: %HUGO_ENV%
echo HUGO_VERSION: %HUGO_VERSION%

REM Check themes directory
echo === Theme Directory Check ===
if exist "themes" (
    echo Themes directory exists:
    dir themes
    
    REM Ensure both theme names are available
    if exist "themes\bigspring" if not exist "themes\bigspring-light" (
        echo Creating bigspring-light compatibility junction...
        mklink /J themes\bigspring-light themes\bigspring
    )
    
    if exist "themes\bigspring-light" if not exist "themes\bigspring" (
        echo Creating bigspring compatibility junction...
        mklink /J themes\bigspring themes\bigspring-light
    )
) else (
    echo ERROR: themes directory not found!
    exit /b 1
)

REM Check for Hugo config files
echo === Configuration Check ===
set CONFIG_FILE=
if exist "hugo.yaml" set CONFIG_FILE=hugo.yaml
if exist "hugo.yml" set CONFIG_FILE=hugo.yml  
if exist "hugo.toml" set CONFIG_FILE=hugo.toml
if exist "hugo-cloudcannon.yaml" set CONFIG_FILE=hugo-cloudcannon.yaml

if "%CONFIG_FILE%"=="" (
    echo ERROR: No Hugo configuration file found!
    exit /b 1
)

echo Using configuration: %CONFIG_FILE%

REM Build the site
echo === Building Hugo Site ===
hugo --gc --minify --config %CONFIG_FILE% --verbose

echo === Build Complete ===
echo Output directory contents:
dir public

echo === CloudCannon Build Script Finished Successfully ===