#! /bin/bash

CONTINUAR=1

while [ $CONTINUAR -eq 1 ]
do
    ipvalido="^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$"
    ipativo="(\b([0-9]{2}|[0-9]{1}|[^100])% packet loss)"
    
    clear

    echo -e "\033[32mInicializado o script testador!\033[0m"

     if [ $# -eq 0 ] || [ ! -f $1 ]; then 
        input=0
        while [ ! -f $input ]
        do
            echo  -e "\033[32mObs.:Caso ja esteja no diretorio do arquivo,\033[0m"
            echo  -e "\033[32mvoce pode informar somente o nome do arquivo =)\033[0m"
            echo
            echo  -e "\033[32mFavor inserir o nome ou caminho do arquivo.\033[0m" 
            read input
            clear
            if [ ! -f $input ] ; then
                clear
                echo -e "\033[31mEste caminho eh invalido.\033[0m"
                echo
            fi
        done
        else if [ -f $1 ] ; then
            input=$1
        fi
    fi

    echo -e
    echo -en "\033[01mTestando os enderecos, por favor aguarde...\033[0m"
    echo
    comp=comp.txt
    while IFS= read -r line
    do
        if [[ $line =~ $ipvalido ]] ; then
            ping -s 24 -t 10 -c 1 $line | egrep -wo "([0-9]?[0-9]?[0-9]% packet loss)" > comp.txt
            while IFS= read -r linha
            do
                if [[ $linha =~ $ipativo ]] ; then 
                    echo "$line" " - Equipamento ligado!"
                fi
            done < "$comp"
            
        fi
    done < "$input"

    echo
    echo -en "\033[32mDeseja inserir um novo arquivo? [s/n]\033[0m"
    echo 
    read resp
    case $resp in
        "s" | "S")
            CONTINUAR=1
        ;;
        "n" | "N")
            echo -e "\033[01mPressione uma tecla para finalizar.\033[0m"
            CONTINUAR=0
            read -n1
        ;;
            *)
            CONTINUAR=0
        ;;
    esac
    clear 
done
