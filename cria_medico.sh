#!/bin/bash
echo "$1 $2 $3 $4"
if [ $# -eq 4 ]; then 
  exists=0
  if [ -f "medicos.txt" ]; then
    for cedula in $(cat medicos.txt | awk -F ';' '{print $2}'); do
      if (( $2 == $cedula )); then
        echo -e "Error: O médico com a cédula $2 já existe.\n"
        cat medicos.txt
        exists=1
        break
      fi
    done
    if [ $exists -eq 0 ]; then
      echo "$1;$2;$3;$4;0;0;0" >> medicos.txt
      echo -e "Médico inserido com sucesso\n"
      cat medicos.txt
    fi
  else
    echo "$1;$2;$3;$4;0;0;0" > medicos.txt 
  fi
else
  echo "SYNTAX $0: <nome> <cédula> <especialidade> <e-mail>"
fi