#!/bin/bash

# Actualizar el sistema
sudo apt update
sudo apt upgrade

# Instalar los paquetes necesarios
sudo apt install git mono-runtime libmono-system-windows-forms4.0-cil libmono-system-web4.0-cil libmono-system-xml-linq4.0-cil libmono-system-data-linq4.0-cil libmono-system-runtime-caching4.0-cil libmono-system-runtime-serialization4.0-cil mono-devel screen

# Descargar OpenSimulator
cd ~
git clone https://github.com/opensim/opensim.git

# Compilar OpenSimulator
cd opensim
./runprebuild.sh
nant

# Configurar OpenSimulator
cp bin/Regions/Regions.ini.example bin/Regions/Regions.ini
sed -i 's/default_region =.*/default_region = YourRegionName, 9000, '$(hostname -I | cut -d\  -f1)'/' bin/Regions/Regions.ini

# Iniciar OpenSimulator en segundo plano
screen -S opensim -dm mono bin/OpenSim.exe
