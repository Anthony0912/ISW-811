# Bash Scripting data base

1. Para crear un nuevo archivo si estamos en windows usuaremos el git bash para mayor comodidad. Para ello digitamos el siguiente comando:

```bash
nano backup.sh
```

2. Cuando nos encontramos dentro del editor escribiremos un comentario indicando el interprete que usuaremos:

```bash
#!/bin/bash
```

3. Aqui colocaremos lo que ira dentro de nuestro script:

-Creamos los siguientes metodos, estos lo que hacen es una animación de cargando cuando se ejecuta cada commando:

```bash
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
```

- Ingresamos el siguiente código para configuración del backup de nuestra base de datos:

```bash
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

echo $filename $(date +"%d/%m/%Y %H:%M:%S") >> backup_$site.log

echo "Respaldo finalizado"
echo
```

- Le damos permisos de ejecución al archivo que creamos

```bash
chmod +x backup.sh
```

- Para que el script se ejecute automaticamente deberemos hacer uso del crontab:

```bash
crontab -e
* * 2 * * /home/vagrant/backups/lfts.isw811.xyz/backup.sh
#opcional
* * * * 0 /home/vagrant/backups/lfts.isw811.xyz/backup.sh domingo
```

-Nota: este es un ejemplo del formato

```bash
 +---------------- minute (0 - 59)
 |  +------------- hour (0 - 23)
 |  |  +---------- day of month (1 - 31)
 |  |  |  +------- month (1 - 12)
 |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7)
 |  |  |  |  |
 *  *  *  *  *  command to be executed
```
