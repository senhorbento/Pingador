
#! /bin/bash

contv=0 ##contador de ips validos
conti=0 ##contador de dados invalidos
hora=$(date +%H)
clear

## cumprimento com o usuario, opcional e apenas uma frescura que eu inventei - carvalho

if [ 6 -lt $hora ] && [ $hora -lt 12 ] ; then
	echo Bom dia, $USER. Quer um cafe?
else if [ 12 -lt $hora ] && [ $hora -lt 18 ] ; then
	echo Boa tarde, $USER.
else if [ 18 -lt $hora ] && [ $hora -lt 23 ] ; then
	echo Boa noite, $USER.
fi ; fi ; fi

##

if [ $# -eq 0 ] ; then ## se nenhum parametro foi passado
	echo Nenhum caminho foi informado.
	input=0
	while [ ! -f $input ] ## enquanto input nao for um arquivo valido
		do
		echo Insira o caminho correspondente ao arquivo:
		read input
		if [ ! -f $input ] ; then
			clear
			echo Caminho invalido.
		fi
	done
else ## se foi, input = parametro
	input=$1
fi

touch ping.txt 
## criaçao de arquivos, talvez tentar juntar em apenas um? - carvalho
touch valido.txt ; echo VALIDOS > valido.txt
touch invalido.txt ; echo INVALIDOS > invalido.txt

while read line
do
	## se for um ip valido
	if [[ $line =~ ^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$ ]] ; then
		if [ $contv -eq 0 ] ; then
			echo Testando os enderecos... aguarde.
			echo -n "$line - " >> valido.txt
		else 
			echo -n "$line - " >> valido.txt
		fi
		ping -c 1 $line | egrep -wo "([0-9]?[0-9]?[0-9]% packet loss)" >> valido.txt
		contv+=1
	else 
		echo "$line" >> invalido.txt
		conti+=1
	fi

done < "$input"

##daqui pra baixo ainda eh trabalho em progresso. juntar os validos e invalidos no resultado.txt - carvalho

valido=/home/carvalho/Documentos/lft/Trabalho/valido.txt

echo ENDERECOS INATIVOS > resultado.txt

while read line 
do
	if egrep "(100% packet loss)" ; then 
		echo $line >> resultado.txt
	fi
done < "$valido"

#cat resultado.txt 
#exit 0

cat valido.txt > resultado.txt
echo " " >> resultado.txt
cat invalido.txt >> resultado.txt
cat resultado.txt
#exit 0


echo Fim de arquivo.
