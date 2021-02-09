#!/bin/bash
while :
do
    sleep 1
    chown www-data:www-data /vagrant/site/ -R
done

