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

cont=3
#contador de ips validos
contv=0 
#contador de dados invalidos
conti=0
ativos=0
inativos=0
invalidos=0
hora=$(date +%H)
ipvalido="^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$"
ipativo="(\b([0-9]{2}|[0-9]{1}|[^100])% packet loss)"
ipinativo="(100% packet loss)"
clear

## cumprimento com o usuario, opcional e apenas uma frescura que eu inventei - carvalho

echo -en "\033[32mSeja bem vindo ao Sir_I, o script analista de enderecos IPV4! \033[0m"
echo

if [ 6 -lt $hora ] && [ $hora -lt 12 ] ; then
    echo -en "\033[32mBom dia, $USER. Aceita um cafe? \033[0m"
	echo 
else if [ 12 -lt $hora ] && [ $hora -lt 18 ] ; then
    echo -en "\033[32mBoa tarde, $USER. Aceita um suco? \033[0m"
	echo 
else if [ 18 -lt $hora ] && [ $hora -lt 23 ] ; then
    echo -en "\033[32m Boa noite, $USER. Hora da breja.\033[0m"
	echo 
fi ; fi ; fi

#echo -en "\033[32mSeja bem vindo ao Sir_Ip, o script analista de enderecos IPV4! \033[0m"
#echo

if [ $# -eq 0 ] || [ ! -f $1 ]; then 
## se nenhum parametro foi passado
	echo -en "\033[31mNenhum caminho foi informado. \033[0m"
    echo
	input=0
	while [ ! -f $input ]
	do
	## enquanto input nao for um arquivo valido
		echo  -en "\033[32mInsira o caminho do arquivo. \033[0m"
        echo
		##echo  -en "\033[32mobs:caso esteja no diretorio, por favor informar somente o nome do arquivo. \033[0m" 
        ##echo
		read input
		if [ ! -f $input ] ; then
			clear
			(( cont-- ))
			echo -en "\033[31mCaminho invalido. Tentativas restantes: \033[0m""\033[31m$cont\033[0m"
            echo
		fi
		if [ $cont -eq 0 ] ; then 
			echo -en "\033[31mNenhum caminho valido foi inserido com sucesso. Encerrando programa.\n\033[0m"
			exit 0
		fi
	done
else if [ -f $1 ] ; then
## se foi, input = parametro
		input=$1
	fi
fi

echo > valido.txt ; #echo VALIDOS > valido.txt ## criaçao de arquivos, talvez tentar juntar em apenas um? - carvalho
echo > invalido.txt ; #echo INVALIDOS > invalido.txt

while IFS= read -r line
do
	if [[ $line =~ $ipvalido ]] ; then
		if [ $contv -eq 0 ] ; then
            echo -en "\033[01mTestando os enderecos... aguarde.\033[0m"
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

##daqui pra baixo ainda eh trabalho em progresso. juntar os validos e invalidos no Resultados_teste.txt - carvalho
## aparentemente tem um bug em que alguns endereços sao repetidos e imprimidos duas vezes. importante checar - carvalho

valido=valido.txt
invalido=invalido.txt

echo ' ' 
echo -en "\033[04m---------------------------------------------\033[0m"
echo ' '
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

#echo
#echo -en "\033[32mFim de arquivo\033[0m"
echo 
echo -en "\033[32mDeseja exportar os resultados para um arquivo? [s/n]\033[0m"
echo 
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
	echo > valido.txt  && echo > invalido.txt && echo > Resultados_teste.txt
	CONTINUAR=1
	;;
	"n" | "N")
	echo -en "\033[01mEncerrando o Sir_I...\n\033[0m"
	CONTINUAR=0
	;;
	*)
	CONTINUAR=0
	;;
esac
sleep 1
clear   
done

#aqui esta dando pau, era para pegar letras diferente de s e n;
#if [ "$resp" -ne "s" ] ; then
#     while true
#     do
#       echo "digite novamente"
#       read t
#       if [ "$t" = "s" ] ; then
#       break
#       fi
#     done
#fi  