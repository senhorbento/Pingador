#! /bin/bash
CONTINUAR=1
while [ $CONTINUAR -eq 1 ]
do
    ipvalido="^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$"
    ipativo="(\b([0-9]{2}|[0-9]{1}|[^100])% packet loss)"
    clear
    echo -e "Inicializado o script testador!"
     if [ $# -eq 0 ] || [ ! -f $1 ]; then 
        input=0
        while [ ! -f $input ]
        do
            echo  -e "Obs.:Caso ja esteja no diretorio do arquivo,"
            echo  -e "voce pode informar somente o nome do arquivo =)"
            echo
            echo  -e "Favor inserir o nome ou caminho do arquivo." 
            read input
            if [ ! -f $input ] ; then
                clear
                echo -e "Este caminho eh invalido."
                echo
            fi
        done
        else if [ -f $1 ] ; then
            input=$1
        fi
    fi
    clear
    echo -en "Testando os enderecos, por favor aguarde..."
    echo
    comp=comp.txt
    ligado=0
    while IFS= read -r line
    do
        if [[ $line =~ $ipvalido ]] ; then
            ping -s 24 -t 10 -c 1 $line | egrep -wo "([0-9]?[0-9]?[0-9]% packet loss)" > comp.txt
            while IFS= read -r linha
            do
                if [[ $linha =~ $ipativo ]] ; then 
                    if [[ $ligado -eq 0 ]] ; then
                        echo
                        echo "Equipamentos ligados:"
                        echo
                    fi
                    (( ligado++ ))
                    echo "$ligado""." "$line"
                fi
            done < "$comp"
        fi
    done < "$input"
    rm comp.txt
    echo
    if [[ $ligado -eq 0 ]] ; then
        echo
        echo "Nenhum equipamento foi econtrado ligado!"
        echo
    fi
    echo -en "Deseja inserir um novo arquivo? [s/n] "
    read resp
    case $resp in
        "s" | "S")
            CONTINUAR=1
        ;;
        "n" | "N")
            echo -e "Pressione uma tecla para finalizar."
            CONTINUAR=0
            read -n1
        ;;
            *)
            CONTINUAR=0
        ;;
    esac
    clear 
done
