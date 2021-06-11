#! /bin/bash

CONTINUAR=1

while [ $CONTINUAR -eq 1 ]
do
    ipvalido="^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$"
    ipativo="0% packet loss"
    
    clear

    echo -e "\033[32mInicializado o script testador! \033[0m"

     if [ $# -eq 0 ] || [ ! -f $1 ]; then 
        input=0
        while [ ! -f $input ]
        do
            echo  -e "\033[32mObs.:Caso ja esteja no diretorio do arquivo,\033[0m"
            echo  -e "\033[32mvoce pode informar somente o nome do arquivo =)\033[0m"
            echo
            echo  -e "\033[32mFavor inserir o nome ou caminho do arquivo.\033[0m" 
            read input
            if [ ! -f $input ] ; then
                clear
                echo -e "\033[31mEste caminho eh invalido. \033[0m"
                echo
            fi
        done
        else if [ -f $1 ] ; then
            input=$1
        fi
    fi

    echo > valido.txt
    contv=0
    while IFS= read -r line
    do
        if [[ $line =~ $ipvalido ]] ; then
            if [ $contv -eq 0 ] ; then
                echo -e
                echo -en "\033[01mTestando os enderecos, por favor aguarde...\033[0m"
                echo
                echo -n "$line - " > valido.txt
            else 
                echo -n "$line - " >> valido.txt
            fi
            ping -s 24 -t 6 -c 1 $line | comp= `egrep "(\b([0-9]{2}|[0-9]{1}|[^100])% packet loss)"`
        fi
        echo "$comp"
        if [[ $comp =~ $ipativo ]] ; then 
            echo "$line" " - " "$comp"
        fi
    done < "$input"

    echo
    echo -en "\033[32mDeseja inserir um novo arquivo? [s/n]\033[0m"
    echo 
    read resp

    case $resp in
        "s" | "S")
            echo > Resultados_teste.txt
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
