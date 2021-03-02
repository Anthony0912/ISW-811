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

port=2222
if [ ! -z "$1"]; then
	port=$1
fi
clear
echo "Buscando el directorio de Buster" 
loading & clearProccess
echo
cd d:/Documents/ISW811/Buster
echo
echo "Conectando el agente ssh" 
echo
loading & clearProccess
echo
eval $(ssh-agent)
echo
echo "Conectando la llave privada" 
echo
loading & clearProccess
echo
ssh-add .vagrant/machines/default/virtualbox/private_key
echo
echo "Conectando al servidor de vagrant" 
echo
loading & clearProccess
echo
vagrant up
echo
echo "Iniciando session hacia el servidor vagrant ${port}" 
echo
loading & clearProccess
echo
ssh -p $port vagrant@localhost
echo
