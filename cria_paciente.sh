#!/bin/bash

cat /etc/passwd | awk -F '[:,]' '/^a[0-9]/ {split($1,v,"a"); print v[2] ";" $5 ";;;" v[1] v[2] "@iscte-iul.pt;100"}' | head > pacientes.txt
cat pacientes.txt