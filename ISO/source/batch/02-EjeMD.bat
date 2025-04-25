@echo off

rem *********************************************
rem  Crea a estructura de arquivos e carpetas 
rem  necesaria para o exercicio 01-EjeDir
rem *********************************************

set ruta=D:\usuarios

rem Creando carpetas
md %ruta%\D1
md %ruta%\D2
md %ruta%\D1\D3
md %ruta%\D1\D4

echo x > %ruta%\D1\f1.txt

echo x > %ruta%\D2\f2.txt

echo x > %ruta%\D1\D3\f3.txt
