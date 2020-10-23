#!/bin/bash

if [ $# -ne 0 ]; then
  echo "SYNTAX $0: não leva argumentos"
else
  awk 'BEGIN { FS=";" } ; { if ( $5 < 5  && $6 > 6 ) { print $0 }}' medicos.txt > lista_negra_medicos.txt
  cat lista_negra_medicos.txt
fi