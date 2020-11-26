#! /bin/bash

CONTINUAR=1

while [ $CONTINUAR -eq 1 ]
do
    if [ -f invalido.txt ] ; then 
        rm invalido.txt
    fi 
    if [ -f valido.txt ] ; then 
        rm valido.txt
    fi
    if [ -f Resultados_teste.txt ] ; then 
        rm Resultados_teste.txt
    fi

    cont=3
    contv=0
    conti=0
    ativos=0
    inativos=0
    invalidos=0
    hora=$(date +%H)
    ipvalido="^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$"
    ipativo="(\b([0-9]{2}|[0-9]{1}|[^100])% packet loss)"
    ipinativo="(100% packet loss)"
    
    clear

    echo -e "\033[32mMe chamo Sir_I, e sou um script analista de enderecos IPV4! \033[0m"

    if [ 4 -lt $hora ] && [ $hora -lt 12 ] ; then
        echo -e "\033[32mBom dia, $USER. Aceita um cafe?\033[0m"
        echo 
    else if [ 12 -lt $hora ] && [ $hora -lt 18 ] ; then
        echo -e "\033[32mBoa tarde, $USER. Aceita um suco?\033[0m"
        echo 
    else if [ 18 -lt $hora ] && [ $hora -lt 3 ] ; then
        echo -e "\033[32mBoa noite, $USER. Hora da breja.\033[0m"
        echo 
            fi 
        fi
    fi

    if [ $# -eq 0 ] || [ ! -f $1 ]; then 
        echo -e "\033[31mVoce nao informou nenhum caminho. \033[0m" 
        echo 
        input=0
        while [ ! -f $input ]
        do
            echo  -e "\033[32mObs.:Caso ja esteja no diretorio,\033[0m"
            echo  -e "\033[32mvoce pode informar somente o nome do arquivo =)\033[0m"
            echo
            echo  -e "\033[32mFavor inserir o caminho do arquivo.\033[0m" 
            read input
            if [ ! -f $input ] ; then
                clear
                (( cont-- ))
                echo -e "\033[31mEste caminho eh invalido. \033[0m"
                echo -e "\033[31mTentativas restantes: \033[0m""\033[31m$cont\033[0m"
                echo
            fi
            if [ $cont -eq 0 ] ; then
                clear 
                echo -e "\033[31mNenhum caminho valido foi inserido.\033[0m"
                echo
                echo -e "\033[01mEstou encerrando os trabalhos...\033[0m"
                echo -e "\033[01mObrigado por utilizar os meus servicos.\033[0m"
                echo 
                echo -e "\033[01mPressione uma tecla para finalizar.\033[0m"
                read -n1
                clear
                exit 0
            fi
        done
        else if [ -f $1 ] ; then
            input=$1
        fi
    fi

    echo > valido.txt
    echo > invalido.txt

    while IFS= read -r line
    do

        if [[ $line =~ $ipvalido ]] ; then
            if [ $contv -eq 0 ] ; then
                echo -e
                echo -en "\033[01mTestando os enderecos, por favor aguarde...\033[0m"
                echo
                echo -en "\033[33m[\033[0m"
                echo -n "$line - " > valido.txt
            else 
                echo -n "$line - " >> valido.txt
            fi
            ping -c 4 $line | egrep -wo "([0-9]?[0-9]?[0-9]% packet loss)" >> valido.txt
            (( contv++ ))
            echo -en "*"

        else 
            if [ $conti -eq 0 ] ; then 
                echo "$line" > invalido.txt
            fi
            echo "$line" >> invalido.txt
            (( conti++ ))
        fi

    done < "$input"

    echo -en "\033[33m]\033[0m"
    valido=valido.txt
    invalido=invalido.txt
    echo
    echo -e "\033[04m---------------------------------------------\033[0m"
    echo

    echo -e "\tENDERECOS ATIVOS" > Resultados_teste.txt
    while IFS= read -r line
    do
        if [[ $line =~ $ipativo ]] ; then 
            echo -en "\t" >> Resultados_teste.txt && echo $line >> Resultados_teste.txt
            (( ativos++ ))
        fi
    done < "$valido"
    echo -e "\tTOTAL:" "$ativos" "ENDERECOS ATIVOS" >> Resultados_teste.txt
    
    echo >> Resultados_teste.txt
    
    echo -e "\tENDERECOS INATIVOS" >> Resultados_teste.txt 
    while IFS= read -r line
        do
        if [[ $line =~ $ipinativo ]] ; then 
            echo -en "\t" >> Resultados_teste.txt && echo $line >> Resultados_teste.txt
            (( inativos++ ))
        fi
    done < "$valido"
    echo -e "\tTOTAL:" "$inativos" "ENDERECOS INATIVOS" >> Resultados_teste.txt
    
    echo >> Resultados_teste.txt
    
    echo -e "\tENDERECOS INVALIDOS" >> Resultados_teste.txt 
    while IFS= read -r line
    do
        echo -en "\t" >> Resultados_teste.txt && echo $line >> Resultados_teste.txt
        (( invalidos ++ ))
    done < "$invalido"
    echo -e "\tTOTAL:" "$invalidos" "ENDERECOS INVALIDOS" >> Resultados_teste.txt
    
    cat Resultados_teste.txt

    if [ -f invalido.txt ] ; then 
        rm invalido.txt
    fi 
    if [ -f valido.txt ] ; then 
        rm valido.txt
    fi

    echo
    echo -e "\033[32mUfa! Finalizei o arquivo.\033[0m"
    echo -e "\033[32mO arquivo Resultados_teste.txt foi criado com sucesso\033[0m"
    echo 
    echo -e "\033[32mVoce deseja copiar os resultados para um outro arquivo?[s/n] \033[0m"
    read op

    case $op in 
        "s" | "S")
        echo -en "\033[32mInsira o nome do arquivo a ser exportado.\033[0m"
        echo 
        read nome 
        cat Resultados_teste.txt > $nome.txt
    esac

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
            clear
            echo -e "\033[01mEstou encerrando os trabalhos...\033[0m"
            echo -e "\033[01mObrigado por utilizar os meus servicos.\033[0m"
            echo 
            echo -e "\033[01mPressione uma tecla para finalizar.\033[0m"
            CONTINUAR=0
        ;;
            *)
            CONTINUAR=0
        ;;
    esac
    read -n1 
    clear 

done
