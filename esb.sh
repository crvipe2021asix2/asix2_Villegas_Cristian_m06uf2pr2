#!/bin/bash

clear

case $1 in 
	-e) if (( $# != 3 )) 
		then
			echo "Nombre de paràmetres incorrecte"
			echo "L'opció -e necessita 3 paràmetres"
			echo "La primera opció és -e o -r"
			echo "La segona opció és l'extensió dels fitxer"
			echo "La tercera opció és la carpeta"
			exit 2
		fi
		if [[ ! -d ~/carpeta ]]
		then
			mkdir ~/carpeta
		fi
		if [[ ! -d $3 ]]
		then
			echo "La carpeta no existeix"
		else
			if (( $(ls -A $3/*.$2 2> /dev/null | wc -l) != 0 ))
			
			then
				mv $3/*.$2 ~/carpeta
				echo "Els fitxers amb extensió $2 de la carpeta $3"
			else
				echo "Els fitxers no existeixen"
			fi
		 fi		 
		 ;;	 
	-r) if (( $# != 1 )) 
		then
			echo "Incorrecte"
			echo "La opció -r no necessita mès paràmetres"
			exit 1
		fi
		if [[ ! -d ~/carpeta ]]
		then
			echo "La carpeta no existeix"
		else
			if (( $(ls -A ~/carpeta | wc -l) != 0 ))
			
			then
				rm ~/carpeta/* 
				echo "carpeta buidada"
			else
				echo "La carpeta buida" 
			fi
		fi
		;;	
	*)  
		echo "Primer paràmetre incorrecte"
	    echo "Utilització: "
	    echo "-r per buidar la carpeta"
	    echo "-e per enviar fitxers a la paperera"
	    exit 3
	    ;;
esac
exit 0
