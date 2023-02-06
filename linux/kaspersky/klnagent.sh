#!/bin/bash


#начало установки Агента
sudo mkdir ./kaspersky && cd ./kaspersky #создание временной директории
sudo wget URL #последняя версия пакета с официального сайта
sudo dpkg -i klnagent*.deb #установка пакета
#конец установки Агента


#config=/tmp/autoanswers.conf
#export KLAUTOANSWERS=$config /opt/kaspersky/klnagent64/lib/bin/setup/postinstall.pl


#начало постинсталляционной настройки
sudo touch autoanswers.conf #создание файла ответов
sudo echo -e "KLNAGENT_SERVER=IP\nKLNAGENT_PORT=PORT\nKLNAGENT_SSLPORT=PORT\nKLNAGENT_USESSL=Y\nKLNAGENT_GW_MODE=1" > autoanswers.conf #запись ответов в файл
sudo /opt/kaspersky/klnagent64/lib/bin/setup/postinstall.pl #постинсталляционная настройка
#конец постинсталляционной настройки


sudo rm -r ../kaspersky #удаление временной директории
