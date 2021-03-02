#!/bin/bash
loading() {
	local i sp n 
	sp='/-\|' 
	n=${#sp} 
	printf ' ' 
	while sleep 0.1; do 
		printf "%s\b" "${sp:i++%n:1}" 
	done
}

clearProccess() {
	sleep 5
	kill "$!"
	clear
}

site="lfts.isw811.xyz"
directory="/home/vagrant/backups/"$site"/"
datatime=$(date +"%Y%m%d_%H%M%S")
database="laravel"
username="laravel"
password="laravel"

echo "Reenombrando backup"
loading & clearProccess
echo
if [ ! -z "$1"]: then
	filename="$site"_"$1.sql"
else
	filename="$site"_"$datatime.sql"
fi
echo "Creando directorio"

loading & clearProccess
mkdir -p $directory

echo "Creando backup"

loading & clearProccess
 mysqldump $database > "$directory""$filname" -u $username --password=$password

echo "Comprimiendo backup"

loading & clearProccess

cd $directory

tar cvfz "$filname".tar.gz "$filename"

echo "Eliminando backup temporal"

loading & clearProccess

rm $filename

echo "Registrando la ejecución del script"

loading & clearProccess

echo $filename $(date + %d/%m/%Y %H:%M:%S") >> backup_$site.log

echo "Respaldo finalizado"
echo
