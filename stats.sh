#!/bin/bash
if [[ $# == 1 ]]; then
  if [[ $1 =~ ^[0-9]+$ ]]; then
    awk -v min=$1 'BEGIN { FS=";" } ; { if ($6 > min) { print $0 } }' pacientes.txt
  else
    awk -v city=$1 'BEGIN { FS=";" } ; { if (tolower($3) == tolower(city)) { print $0 } }' pacientes.txt
  fi
elif [[ $# == 2 ]]; then 
  if [[ $1 =~ ^[a-zA-Z]+$ && $2 =~ ^[0-9]+$ ]]; then
    awk -v min=80 -v city="Carcavelos" 'BEGIN { FS=";" } ; { if (tolower($3) == tolower(city) && $6 > min) { print $0 } }' pacientes.txt
  else
    echo "SYNTAX $0: <localicade> <saldo mínimo>"
  fi
else
  echo "Error: Excedeu o número máximo de argumentos. Intruduza 1 ou 2 argumentos."
fi