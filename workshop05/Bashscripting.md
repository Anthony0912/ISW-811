# Bash Scripting

1. Para crear un nuevo archivo si estamos en windows usuaremos el git bash para mayor comodidad. Para ello digitamos el siguiente comando:

```bash
nano conectar.sh
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

- Condicionamos para que el usuario digite el puerto que desea conecta:

```bash
port=2222
if [ ! -z "$1"]; then
	port=$1
fi
```

- Aqui nos dirigimos a nuestra carpeta vagrant

```bash
clear
echo "Buscando el directorio de Buster"
loading & clearProccess
echo
cd d:/Documents/ISW811/Buster
```

- Conectamos con agente ssh

```bash
echo
echo "Conectando el agente ssh"
echo
loading & clearProccess
echo
eval $(ssh-agent)
```

- Conectamos la privada que nos brinda vagrant

```bash
echo
echo "Conectando la llave privada"
echo
loading & clearProccess
echo
ssh-add .vagrant/machines/default/virtualbox/private_key
```

- Levantamos el servidor

```bash
echo
echo "Conectando al servidor de vagrant"
echo
loading & clearProccess
echo
vagrant up
```

- Iniciamos session por el puerto reeviado que nos ofrece vagrant

```bash
echo
echo "Iniciando session hacia el servidor vagrant por el puerto ${port}"
echo
loading & clearProccess
echo
ssh -p $port vagrant@localhost
echo
```

- Le damos permisos de ejecución al archivo que creamos

```bash
chmod +x conectar.sh
```

- Ejecutamos el archivo que recien creamos con un:

```bash
./conectar.sh
```
