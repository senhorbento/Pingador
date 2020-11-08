
#! /bin/bash

#progress_bar()
#{
#  local PROG_BAR_MAX=${1:-20}
#  local PROG_BAR_DELAY=${2:-1}
#  local PROG_BAR_TODO=${3:-"*"}
#  local PROG_BAR_DONE=${4:-"█"}
#  local i

#  echo -en "["
#  for i in `seq 1 $PROG_BAR_MAX`
#  do
#    echo -en "$PROG_BAR_TODO"
#  done
#  echo -en "]\0015["
#  for i in `seq 1 $PROG_BAR_MAX`
#  do
#    echo -en"$PROG_BAR_DONE"
#    sleep ${PROG_BAR_DELAY}
#  done
#  echo
#clear
#}

while true
do
#contador de ips validos
contv=0 
#contador de dados invalidos
conti=0
hora=$(date +%H)
ipvalido="^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$"
ipativo="(\b([0-9]{2}|[0-9]{1}|[^100])% packet loss)"
ipinativo="(100% packet loss)"
clear

## cumprimento com o usuario, opcional e apenas uma frescura que eu inventei - carvalho

if [ 6 -lt $hora ] && [ $hora -lt 12 ] ; then
	echo "Bom dia, $USER. Aceita um cafe?"
else if [ 12 -lt $hora ] && [ $hora -lt 18 ] ; then
	echo "Boa tarde, $USER. Aceita um suco?"
else if [ 18 -lt $hora ] && [ $hora -lt 23 ] ; then
	echo "Boa noite, $USER. Hora da breja."
fi ; fi ; fi

if [ $# -eq 0 ] || [ ! -f $1 ]; then 
## se nenhum parametro foi passado
	echo "Nenhum caminho foi informado."
	input=0
	while [ ! -f $input ]
	do
	## enquanto input nao for um arquivo valido
		echo "Insira o caminho do arquivo."
		echo "Obs: Caso esteja no diretorio, por favor informar somente o nome do arquivo."
		read input
		if [ ! -f $input ] ; then
			clear
			echo "Caminho invalido."
		fi
	done
else if [ -f $1 ] ; then
## se foi, input = parametro
		input=$1
	fi
fi

touch valido.txt ; #echo VALIDOS > valido.txt ## criaçao de arquivos, talvez tentar juntar em apenas um? - carvalho
touch invalido.txt ; #echo INVALIDOS > invalido.txt

while IFS= read -r line
do

	if [[ $line =~ $ipvalido ]] ; then
		if [ $contv -eq 0 ] ; then
			echo Testando os enderecos... aguarde.
		echo -n "["
			echo -n "$line - " > valido.txt
		else 
			echo -n "$line - " >> valido.txt
		fi
		ping -c 4 $line | egrep -wo "([0-9]?[0-9]?[0-9]% packet loss)" >> valido.txt
		(( contv++ ))
		#echo "$contv"
		est=$((RANDOM%8))
		lst=$((RANDOM%7))
		fut=$((RANDOM%8))

		if [ $est -eq 0 ] ; then
			if [ $lst -eq 0 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[00;31;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[00;31;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[00;31;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[00;31;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[00;31;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[00;31;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[00;31;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[00;31;47m*\033[0m"
                fi
			elif [ $lst -eq 1 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[00;32;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[00;32;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[00;32;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[00;32;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[00;32;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[00;32;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[00;32;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[00;32;47m*\033[0m"
                fi
			elif [ $lst -eq 2 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[00;33;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[00;33;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[00;33;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[00;33;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[00;33;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[00;33;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[00;33;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[00;33;47m*\033[0m"
                fi
			elif [ $lst -eq 3 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[00;34;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[00;34;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[00;34;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[00;34;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[00;34;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[00;34;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[00;34;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[00;34;47m*\033[0m"
                fi
			elif [ $lst -eq 4 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[00;35;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[00;35;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[00;35;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[00;35;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[00;35;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[00;35;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[00;35;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[00;35;47m*\033[0m"
                fi
			elif [ $lst -eq 5 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[00;36;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[00;36;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[00;36;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[00;36;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[00;36;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[00;36;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[00;36;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[00;36;47m*\033[0m"
                fi
			elif [ $lst -eq 6 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[00;37;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[00;37;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[00;37;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[00;37;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[00;37;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[00;37;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[00;37;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[00;37;47m*\033[0m"
                fi
            fi
		elif [ $est -eq 1 ] ; then
			if [ $lst -eq 0 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[01;31;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[01;31;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[01;31;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[01;31;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[01;31;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[01;31;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[01;31;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[01;31;47m*\033[0m"
                fi
			elif [ $lst -eq 1 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[01;32;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[01;32;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[01;32;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[01;32;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[01;32;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[01;32;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[01;32;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[01;32;47m*\033[0m"
                fi
			elif [ $lst -eq 2 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[01;33;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[01;33;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[01;33;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[01;33;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[01;33;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[01;33;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[01;33;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[01;33;47m*\033[0m"
                fi
			elif [ $lst -eq 3 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[01;34;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[01;34;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[01;34;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[01;34;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[01;34;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[01;34;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[01;34;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[01;34;47m*\033[0m"
                fi
			elif [ $lst -eq 4 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[01;35;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[01;35;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[01;35;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[01;35;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[01;35;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[01;35;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[01;35;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[01;35;47m*\033[0m"
                fi
			elif [ $lst -eq 5 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[01;36;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[01;36;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[01;36;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[01;36;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[01;36;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[01;36;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[01;36;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[01;36;47m*\033[0m"
                fi
			elif [ $lst -eq 6 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[01;37;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[01;37;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[01;37;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[01;37;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[01;37;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[01;37;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[01;37;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[01;37;47m*\033[0m"
                fi
            fi
		elif [ $est -eq 2 ] ; then
			if [ $lst -eq 0 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[02;31;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[02;31;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[02;31;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[02;31;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[02;31;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[02;31;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[02;31;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[02;31;47m*\033[0m"
                fi
			elif [ $lst -eq 1 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[02;32;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[02;32;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[02;32;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[02;32;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[02;32;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[02;32;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[02;32;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[02;32;47m*\033[0m"
                fi
			elif [ $lst -eq 2 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[02;33;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[02;33;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[02;33;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[02;33;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[02;33;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[02;33;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[02;33;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[02;33;47m*\033[0m"
                fi
			elif [ $lst -eq 3 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[02;34;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[02;34;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[02;34;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[02;34;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[02;34;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[02;34;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[02;34;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[02;34;47m*\033[0m"
                fi
			elif [ $lst -eq 4 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[02;35;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[02;35;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[02;35;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[02;35;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[02;35;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[02;35;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[02;35;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[02;35;47m*\033[0m"
                fi
			elif [ $lst -eq 5 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[02;36;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[02;36;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[02;36;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[02;36;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[02;36;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[02;36;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[02;36;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[02;36;47m*\033[0m"
                fi
			elif [ $lst -eq 6 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[02;37;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[02;37;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[02;37;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[02;37;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[02;37;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[02;37;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[02;37;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[02;37;47m*\033[0m"
                fi
            fi
		elif [ $est -eq 3 ] ; then
			if [ $lst -eq 0 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[03;31;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[03;31;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[03;31;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[03;31;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[03;31;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[03;31;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[03;31;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[03;31;47m*\033[0m"
                fi
			elif [ $lst -eq 1 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[03;32;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[03;32;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[03;32;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[03;32;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[03;32;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[03;32;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[03;32;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[03;32;47m*\033[0m"
                fi
			elif [ $lst -eq 2 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[03;33;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[03;33;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[03;33;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[03;33;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[03;33;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[03;33;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[03;33;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[03;33;47m*\033[0m"
                fi
			elif [ $lst -eq 3 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[03;34;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[03;34;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[03;34;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[03;34;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[03;34;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[03;34;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[03;34;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[03;34;47m*\033[0m"
                fi
			elif [ $lst -eq 4 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[03;35;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[03;35;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[03;35;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[03;35;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[03;35;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[03;35;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[03;35;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[03;35;47m*\033[0m"
                fi
			elif [ $lst -eq 5 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[03;36;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[03;36;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[03;36;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[03;36;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[03;36;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[03;36;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[03;36;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[03;36;47m*\033[0m"
                fi
			elif [ $lst -eq 6 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[03;37;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[03;37;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[03;37;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[03;37;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[03;37;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[03;37;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[03;37;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[03;37;47m*\033[0m"
                fi
            fi
		elif [ $est -eq 4 ] ; then
			if [ $lst -eq 0 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[04;31;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[04;31;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[04;31;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[04;31;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[04;31;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[04;31;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[04;31;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[04;31;47m*\033[0m"
                fi
			elif [ $lst -eq 1 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[04;32;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[04;32;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[04;32;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[04;32;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[04;32;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[04;32;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[04;32;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[04;32;47m*\033[0m"
                fi
			elif [ $lst -eq 2 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[04;33;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[04;33;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[04;33;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[04;33;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[04;33;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[04;33;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[04;33;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[04;33;47m*\033[0m"
                fi
			elif [ $lst -eq 3 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[04;34;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[04;34;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[04;34;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[04;34;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[04;34;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[04;34;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[04;34;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[04;34;47m*\033[0m"
                fi
			elif [ $lst -eq 4 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[04;35;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[04;35;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[04;35;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[04;35;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[04;35;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[04;35;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[04;35;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[04;35;47m*\033[0m"
                fi
			elif [ $lst -eq 5 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[04;36;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[04;36;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[04;36;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[04;36;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[04;36;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[04;36;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[04;36;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[04;36;47m*\033[0m"
                fi
			elif [ $lst -eq 6 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[04;37;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[04;37;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[04;37;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[04;37;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[04;37;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[04;37;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[04;37;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[04;37;47m*\033[0m"
                fi
            fi
		elif [ $est -eq 5 ] ; then
			if [ $lst -eq 0 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[05;31;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[05;31;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[05;31;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[05;31;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[05;31;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[05;31;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[05;31;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[05;31;47m*\033[0m"
                fi
			elif [ $lst -eq 1 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[05;32;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[05;32;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[05;32;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[05;32;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[05;32;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[05;32;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[05;32;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[05;32;47m*\033[0m"
                fi
			elif [ $lst -eq 2 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[05;33;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[05;33;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[05;33;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[05;33;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[05;33;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[05;33;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[05;33;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[05;33;47m*\033[0m"
                fi
			elif [ $lst -eq 3 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[05;34;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[05;34;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[05;34;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[05;34;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[05;34;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[05;34;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[05;34;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[05;34;47m*\033[0m"
                fi
			elif [ $lst -eq 4 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[05;35;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[05;35;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[05;35;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[05;35;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[05;35;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[05;35;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[05;35;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[05;35;47m*\033[0m"
                fi
			elif [ $lst -eq 5 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[05;36;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[05;36;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[05;36;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[05;36;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[05;36;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[05;36;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[05;36;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[05;36;47m*\033[0m"
                fi
			elif [ $lst -eq 6 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[05;37;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[05;37;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[05;37;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[05;37;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[05;37;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[05;37;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[05;37;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[05;37;47m*\033[0m"
                fi
            fi
		elif [ $est -eq 6 ] ; then
			if [ $lst -eq 0 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[06;31;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[06;31;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[06;31;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[06;31;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[06;31;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[06;31;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[06;31;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[06;31;47m*\033[0m"
                fi
			elif [ $lst -eq 1 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[06;32;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[06;32;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[06;32;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[06;32;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[06;32;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[06;32;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[06;32;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[06;32;47m*\033[0m"
                fi
			elif [ $lst -eq 2 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[06;33;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[06;33;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[06;33;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[06;33;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[06;33;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[06;33;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[06;33;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[06;33;47m*\033[0m"
                fi
			elif [ $lst -eq 3 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[06;34;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[06;34;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[06;34;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[06;34;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[06;34;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[06;34;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[06;34;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[06;34;47m*\033[0m"
                fi
			elif [ $lst -eq 4 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[06;35;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[06;35;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[06;35;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[06;35;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[06;35;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[06;35;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[06;35;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[06;35;47m*\033[0m"
                fi
			elif [ $lst -eq 5 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[06;36;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[06;36;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[06;36;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[06;36;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[06;36;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[06;36;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[06;36;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[06;36;47m*\033[0m"
                fi
			elif [ $lst -eq 6 ] ; then
				if [ $fut -eq 0 ] ; then
				echo -en "\033[06;37;40m*\033[0m"
				elif [ $fut -eq 1 ] ; then
				echo -en "\033[06;37;41m*\033[0m"
				elif [ $fut -eq 2 ] ; then
				echo -en "\033[06;37;42m*\033[0m"
				elif [ $fut -eq 3 ] ; then
				echo -en "\033[06;37;43m*\033[0m"
				elif [ $fut -eq 4 ] ; then
				echo -en "\033[06;37;44m*\033[0m"
				elif [ $fut -eq 5 ] ; then
				echo -en "\033[06;37;45m*\033[0m"
				elif [ $fut -eq 6 ] ; then
				echo -en "\033[06;37;46m*\033[0m"
				elif [ $fut -eq 7 ] ; then
				echo -en "\033[06;37;47m*\033[0m"
                fi
            fi
		fi
echo"]"
		#progress_bar 10
        else 
		if [ $conti -eq 0 ] ; then 
		echo "$line" > invalido.txt
		fi
		echo "$line" >> invalido.txt
		(( conti++ ))
	fi
done < "$input"

##daqui pra baixo ainda eh trabalho em progresso. juntar os validos e invalidos no resultado.txt - carvalho
## aparentemente tem um bug em que alguns endereços sao repetidos e imprimidos duas vezes. importante checar - carvalho

valido=valido.txt
invalido=invalido.txt

echo ' ' 
echo ENDERECOS ATIVOS > resultado.txt

while IFS= read -r line
do
	if [[ $line =~ $ipativo ]] ; then 
		echo $line >> resultado.txt
	fi
done < "$valido"

echo ENDERECOS INATIVOS >> resultado.txt 

while IFS= read -r line
do
	if [[ $line =~ $ipinativo ]] ; then 
		echo $line >> resultado.txt
	fi
done < "$valido"

echo INVALIDOS >> resultado.txt 

while IFS= read -r line
do
	echo $line >> resultado.txt
done < "$invalido"

cat resultado.txt

echo Fim de arquivo
echo "deseja inserir um novo arquivo[s/n]?"
read resp
test "$resp" = "n" && exit
sleep 1
clear
done




