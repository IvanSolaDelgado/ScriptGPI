#!/bin/bash

# Crear directorio para los logs si no existe
mkdir -p ~/logs

# 1. Compilación con Maven
echo "Iniciando compilación..."
cd ~/sakaiGPI/kernel
mvn clean install > ~/logs/compilacion.log 2>&1
~/pmd-bin-7.0.0/bin/pmd check -d ~/sakaiGPI/kernel -f text -R rulesets/java/quickstart.xml > ~/logs/analisis.log 2>&1
mvn test > ~/logs/tests.log 2>&1
echo "Analisis y tests ejecutados"
