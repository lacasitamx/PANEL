#!/bin/bash

echo -e '\e[44m \e[30m##############################################################\e[0m'
echo -e '\e[44m \e[30m#                DEVELOPER STAFFNET                          #\e[0m'
echo -e '\e[44m \e[30m# Install panel server    inet                               #\e[0m'
echo -e '\e[44m \e[30m# Intro:  https://telegram.com/staffnet                      #\e[0m'
echo -e '\e[44m \e[30m# Author:          <@staffnet>                               #\e[0m'
echo -e '\e[44m \e[30m##############################################################\e[0m'
echo ""
read -n 1 -s -p "Este script instalara administrador webssh precione una tecla para continuar"
echo ""
read -n 1 -s -p "no me hago responsable de daños provocados por el script precione una tecla "
echo ""
read -n 1 -s -p "puerto NECESARIO 80 sistema requerido UBUNTO 14  sistema limpio sin mysql"
echo ""
echo -e '\e[1;32m Enter para continuar la instalacion #:\e[0m'
read -p ""
if [[ -e /etc/panels ]]; then
echo -e "	\e[1;93mAbriendo panel"
echo ""
sleep 1s
clear
else
#if [[ -z $password ]]
#then
   # tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "ha digitado un serial basio!" ; echo "" ; tput sgr0
    #exit 1
#else
   # sizepass=$(echo ${#password})
   # if [[ $sizepass -lt 9 ]]
  #  then
      #  tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "ha digitado un serial muy corto!" ; echo "verfique su serial con el administrador del scrit" ; echo "ingrese una combinacion correcta!" ; echo "" ; tput sgr0
        #exit 1
 #   else
#        echo""
#    fi  
#fi
apt-get install curl -y  1> /dev/null 2> /dev/stdout
#curl -b -w -uitercds:Vpninet --silent http://itercds.systems/serial/datas --stderr - | grep  $password
#curl -L -b -w --silent https://www.dropbox.com/s/ovyanfkorfurxcd/datas.txt?dl=0 --stderr - | grep $password
#if [[ $? > 0 ]]
#then
   # echo -e '\e[0;31m Serial invalido\e[0m'
    #exit
#else
    # echo -e '\e[1;34m Puede continuar\e[0m'
#fi
sleep 1
dato2="2"
dato1="1"
echo -e '\e[40m \e[1;32m ESTE SCRIPT INSTALAR TODO COMPLENTOS NECESARIOS PARA EL PANEL \e[0m'
echo -e '\e[40m \e[1;32m INSTALAR EL PANEL WEB \e[0m#(1)'
echo -e '\e[40m \e[1;32m DESINTALAR PANEL      \e[0m#(2)'
echo -e '\e[40m \e[1;33m QUE DESEA HACER       \e[0m#(?)'
read -p 'RESPUESTA ingrese un valor#(?)' valor
if test "$valor" = "$dato2"
then
    echo -e '\e[1;31miniciando desintalacion'
            apt-get purge nginx -y  1> /dev/null 2> /dev/stdout
            if [[ $? > 0 ]]
            then
            echo "No se encontro servidor NGINX, exiting.#1"
            exit
            else
            echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
            fi
            apt-get autoremove nginx -y 1> /dev/null 2> /dev/stdout
            rm -R /usr/share/nginx/html 1> /dev/null 2> /dev/stdout
            mkdir /usr/share/nginx/html 1> /dev/null 2> /dev/stdout          
            if [[ $? > 0 ]]
            then
            echo "error de desintalacion, exiting.#2"
            exit
            else 
            echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
            fi
            #sudo apt purge php7.0-mysql php7.0-curl php7.0-json php7.0-cgi  php7.0 libapache2-mod-php7.0 
            #service mysql stop
            #sudo apt-get remove apache2 mysql-server libapache2-mod-auth-mysql php5-mysql php5 libapache2-mod-php5 php5-mcrypt 
            apt-get purge php5* -y 1> /dev/null 2> /dev/stdout
            if [[ $? > 0 ]]
            then
            echo "no se encontro php5, exiting.#3"
            exit
            else
            echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
            fi
            sudo apt-get remove --purge mysql-server mysql-client mysql-common -y 1> /dev/null 2> /dev/stdout
            rm startserver.sh
            if [[ $? > 0 ]]
            then
            echo "no se encontro mysql, exiting.#4"
            exit
            else
            echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
            fi
            sudo rm -rf /etc/mysql/  1> /dev/null 2> /dev/stdout
            if [[ $? > 0 ]]
            then
            echo "The command failed, exiting.#5"
            exit
            else
            echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
            fi
            deluser --remove-home mysql 1> /dev/null 2> /dev/stdout
            if [[ $? > 0 ]]
            then
            echo "The command failed, exiting.#6"
            exit
            else
            echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
            fi
            apt-get purge libssh2-php -y 1> /dev/null 2> /dev/stdout
            if [[ $? > 0 ]]
            then
            echo "no se encontro libssh2-php, exiting.#7"
            exit
            else
            echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
            fi
            rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysqld 1> /dev/null 2> /dev/stdout
            updatedb
            apt-get purge zip -y 1> /dev/null 2> /dev/stdout
            apt-get autoremove -y 1> /dev/null 2> /dev/stdout
            rm /etc/panels
    echo -e '\e[1;32mdesintalacion finalizada \e[0m'
    exit
elif test "$valor" = "$dato1"
then
     echo -e '\e[1;32mContinuamos con la instalacion '
     sleep 2
else
           echo -e '\e[1;31mRespuesta incorrecta \e[0m' 
exit
fi
read -n 1 -s -p "Tenga mucho cuidado ingrese user y pass root"
echo ""
read -p "Nombre de usuário: " USER
read -p "contraseña: " PASSWORD
read -p "ingrese su ip " ip
echo -ne '#                    (10%)\r'
sleep 1
echo -ne '##                   (15%)\r'
sleep 2
apt-get update 1> /dev/null 2> /dev/stdout  && apt-get upgrade -y 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "actualizacion fallo, exiting.#10"
    exit
else
    echo "Actualisando, continuing with script." 
fi
echo -ne '###                  (20%)\r'
sleep 1
apt-get install curl -y 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "instalacion curl fallo, exiting.#11"
    exit
else
    echo "Instalando CURL, continuing with script."
fi
echo -ne '####                 (25%)\r'
sleep 1
sudo apt-get install nginx -y  1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "instalacion nginx fallo, exiting.#12"
    exit
else
    echo "Instalando NGINX, continuing with script."
fi
echo -ne '#####                (30%)\r'
sleep 1
rm -R /etc/nginx/sites-available/ 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#13"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '######               (35%)\r'
sleep 2
mkdir -p /etc/nginx/sites-available/ 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#14"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '#######               (40%)\r'
sleep 1
cd /etc/nginx/sites-available/ 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#15"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '########              (45%)\r'
sleep 1
wget https://www.dropbox.com/s/oebkky5y00gnlok/default  1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "link caidos, exiting.#16"
    exit
else
    echo "Configurando NGINX, continuing with script."
fi
echo -ne '############          (50%)\r'
sleep 1
#sudo add-apt-repository ppa:ondrej/php
#if [[ $? > 0 ]]
#then
#    echo "The command failed, exiting.#14"
#    exit
#else
#    echo "The command ran succesfuly, continuing with script."
#fi
#sudo apt-get update 
#if [[ $? > 0 ]]
#then
#    echo "The command failed, exiting.#15"
#    exit
#else
#    echo "The command ran succesfuly, continuing with script."
#fi
#sudo apt search php7 
#if [[ $? > 0 ]]
#then
#    echo "The command failed, exiting.#16"
#    exit
#else
#    echo "The command ran succesfuly, continuing with script."
#fi
#sudo apt install  php7.1-curl php7.1-json php7.1-cgi php7.1-zip php7.1-xml php7.1-curl php7.1-gd php7.1-mbstring php7.1-bcmath -y 
#if [[ $? > 0 ]]
#then
#    echo "The command failed, exiting.#17"
#    exit
#else
#    echo "The command ran succesfuly, continuing with script."
#fi
#sudo apt-get install mcrypt php7.0-mcrypt
#if [[ $? > 0 ]]
#then
#    echo "The command failed, exiting.#27"
#    exit
#else
#    echo "The command ran succesfuly, continuing with script."
#fi
#sudo apt-get install php7.0-ssh2
echo -ne '###########          (55%)\r'
sleep 1
apt-get install libssh2-php -y  1> /dev/null 2> /dev/stdout && service nginx restart  1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "fallo instalacion libssh2-php, exiting.#17"
    exit
else
    echo "instalando libssh2-php, continuing with script."
fi
echo -ne '############         (56%)\r'
sleep 1
apt-get install libssh2-1-dev libssh2-php -y 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "fallo libssh2-php, exiting.#18"
    exit
else
    echo "configurando libssh2-php, continuing with script." 
fi

if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#19"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '#############        (57%)\r'
sleep 1
sudo apt-get install php5-fpm php5-mysql -y 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "fallo la instalacion  php5, exiting.#20"
    exit
else
    echo "Instalando PHP, continuing with script."
fi
echo -ne '##############       (58%)\r'
sleep 1
service nginx restart 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "fallo al reiniciar NGINX, exiting.#21"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -e '\e[44m \e[30m# INGRESA TU PASSWD ROOT#\e[0m'
echo -ne '###############       (60%)\r'
sleep 2
apt-get install mysql-server -y 
if [[ $? > 0 ]]
then
    echo "fallo la instalacion mysql, exiting.#22"
    exit
else
    echo "Instalando mysql, continuing with script."
fi
echo -ne '###############     (61%)\r'
sleep 2
clear
mysql_install_db
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#23" 1> /dev/null 2> /dev/stdout
    exit
else 
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '###############       (62%)\r'
sleep 1
mysql -u root -p <<-EOF
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF
clear
if [[ $? > 0 ]]
then
    echo "fallo la configucion de mysql, exiting.#24"
    exit
else
    echo "Configurando mysql, continuing with script."
fi
echo -ne '###############      (70%)\r'
sleep 1
service nginx restart 1> /dev/null 2> /dev/stdout 
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#25" 1> /dev/null 2> /dev/stdout
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
mysql -h localhost -u$USER -p$PASSWORD -e "CREATE DATABASE ssh" 1> /dev/null 2> /dev/stdout
clear
echo -e '\e[1;32m Base de datos Creada #: \e[0m'
echo -ne '##################     (75%)\r'
sleep 1
wget -q --no-check-certificate https://www.dropbox.com/s/4855lu57atwx6tm/ssh.sql -O /tmp/ssh.sql 1> /dev/null 2> /dev/stdout
mysql -u$USER -p$PASSWORD --default-character-set=utf8 ssh </tmp/ssh.sql 1> /dev/null 2> /dev/stdout
rm /tmp/ssh.sql 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "link caidos, exiting.#26" 
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '##################     (75%)\r'
sudo apt-get update 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#27" 1> /dev/null 2> /dev/stdout
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
apt-get install php5-cli -y 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#php5-cli" 
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
php -m |grep ssh2 1> /dev/null 2> /dev/stdout
#if [[ $? > 0 ]]
#then
#    echo "The command failed, exiting."
#    exit
#else
#    echo "The command ran succesfuly, continuing with script."
#fi
echo -ne '##################     (75%)\r'
sleep 1
apt-get install php5-curl -y 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#28" 
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '##################     (75%)\r'
sleep 1
service nginx restart 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#29"
    exit
else
    echo "verificando Archivos, continuing with script."
fi
echo -ne '##################     (75%)\r'
sleep 1
rm -R /usr/share/nginx/html
mkdir /usr/share/nginx/html
cd /usr/share/nginx/html 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#30"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '####################   (80%)\r'
wget -q --no-check-certificate https://www.dropbox.com/s/3zo7666w2j4c728/panelv5.zip 1> /dev/null 2> /dev/stdout && apt-get install zip -y   1> /dev/null 2> /dev/stdout && unzip panelv5.zip 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "link caido, exiting.#31"
    exit
else
    echo "Descargando webssh, continuing with script."
fi
echo -ne '####################   (80%)\r'
sleep 1
echo "America/Chicago" > /etc/timezone 1> /dev/null 2> /dev/stdout
dpkg-reconfigure -f noninteractive tzdata 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "fallo al configurar la hora , exiting.#32"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '###################### (85%)\r'
sleep 1
service nginx restart 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#33" 1> /dev/null 2> /dev/stdout
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '###################### (85%)\r'
sleep 1
cd /usr/share/nginx/html 1> /dev/null 2> /dev/stdout
chmod -R 777 scripts
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#34"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
cd /usr/share/nginx/html/admin/pages 1> /dev/null 2> /dev/stdout
echo -ne '###################### (85%)\r'
sleep 1
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#35"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '######################  (85%)\r'
sleep 1
chmod 777 bandeiras
chmod 777 download
chmod 777 index.html
chmod -R 777 servidor
chmod -R 777 usuario
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#36"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo -ne '###################### (90%)\r'
sleep 1
cd /usr/share/nginx/html/pages 1> /dev/null 2> /dev/stdout
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#37"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
rm /usr/share/nginx/html/pages/system/pass.php
echo -e "<?php \$pass = '$PASSWORD';?>" >> /usr/share/nginx/html/pages/system/pass.php
chmod -R 777 servidor
chmod -R 777 system
chmod -R 777 usuario
echo -ne '###################### (100%)\r'
sleep 1
crontab <<-EOF
@reboot sshlimiter.sh
* * * * * /usr/bin/php /usr/share/nginx/html/pages/system/cron.php
* * * * * /usr/bin/php /usr/share/nginx/html/pages/system/cron.ssh.php
* * * * * /usr/bin/php /usr/share/nginx/html/pages/system/cron.sms.php
* * * * * /usr/bin/php /usr/share/nginx/html/pages/system/cron.online.ssh.php
10 * * * * /usr/bin/php /usr/share/nginx/html/pages/system/cron.servidor.php
*/5 * * * * sudo ./startserver.sh
EOF
if [[ $? > 0 ]]
then
    echo "The command failed, exiting.#38"
    exit
else
    echo "The command ran succesfuly, continuing with script." 1> /dev/null 2> /dev/stdout
fi
echo "verificadno instalacion "
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=100

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    sleep 0.1
    ProgressBar ${number} ${_end}
done
wget https://www.dropbox.com/s/dbeo8uobtfp8d3h/startserver.sh 1> /dev/null 2> /dev/stdout
chmod 777 startserver.sh 1> /dev/null 2> /dev/stdout
printf '\nFinished!\n'
clear 
    echo -e '\e[44m \e[30m##############################################################\e[0m'
    echo -e '\e[44m \e[30m#                DEVELOPER STAFFNET                          #\e[0m'
    echo -e '\e[44m \e[30m# Install panel server    inet                               #\e[0m'
    echo -e '\e[44m \e[30m# Intro:  https://telegram.com/staffnet                      #\e[0m'
    echo -e '\e[44m \e[30m# Author:          <@staffnet>                               #\e[0m'
    echo -e '\e[44m \e[30m##############################################################\e[0m'
    echo -e "
    PANEL INET http://$ip:80
    usuario:\e[0;31m admin\e[0m
    contraseña:\e[0;31m admin\e[0m"
    echo -e '\e[44m \e[30m##############################################################\e[0m'
	touch /etc/panels
	fi