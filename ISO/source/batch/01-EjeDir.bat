rem *********************************************
rem  Crea a estructura de arquivos e carpetas 
rem  necesaria para o exercicio 01-EjeDir
rem *********************************************
@echo off
set ruta=D:\usuarios

rem Creando carpetas
md %ruta%\D1
md %ruta%\D2
md %ruta%\D1\D3
md %ruta%\D1\D3\D4

rem Creando arquivos en D1
echo x > %ruta%\D1\cap1.txt
echo x > %ruta%\D1\cap2.txt
echo x > %ruta%\D1\capitan.txt
echo x > %ruta%\D1\pru.txt
echo x > %ruta%\D1\1hola.bak
echo x > %ruta%\D1\a1.bak
echo x > %ruta%\D1\a2.bak
echo x > %ruta%\D1\a3.bak

rem Creando arquivos en D2

echo x > %ruta%\D2\f4.bak
echo x > %ruta%\D2\f5.txt
echo x > %ruta%\D2\f1.txt

rem Creando arquivos en D3

echo x > %ruta%\D1\D3\cap3.txt

rem Creando arquivos en D4

echo x > %ruta%\D1\D3\D4\f1.txt