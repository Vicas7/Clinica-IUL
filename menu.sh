#!/bin/bash

while :; do
  echo -e "\n****** MENU ******\n1. Cria pacientes\n2. Cria médicos\n3. Stats\n4. Avalia médicos\n0. Sair\n"
  read number

  case $number in
    0 ) clear 
        break;;
    1 ) clear
        ./cria_paciente.sh ;;
    2 ) read -p "Nome: " nome
        read -p "Cedula: " cedula
        read -p "Especialidade: " especialidade
        read -p "E-mail: " email
        clear
        ./cria_medico.sh "$nome" "$cedula" "$especialidade" "email";;
    3 ) read -p "Quantos argumentos quer usar? : " numero
        if (( $numero == 1 )); then 
          read -p "Localidade/Saldo mínimo: " argumento
          clear
          ./stats.sh "$argumento"
        elif (( $numero == 2 )); then
          read -p "Localidade: " localidade
          read -p "Saldo mínimo: " min
          clear
          ./stats.sh "$localidade" "$min"
        else
          ./stats.sh
        fi;;
    4 ) clear
        ./avalia_medicos.sh
  esac
done