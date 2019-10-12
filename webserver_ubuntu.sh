#!/usr/bin/env bash

#############################################################
#                                                           #
# NOME: webserver_ubuntu.sh                                 #
#                                                           #
# AUTOR: Amaury B. Souza (amaurybsouza@gmail.com)           #
#                                                           #
# DESCRIÇÃO: O script faz a instalação da stack LAMP        #
#                                                           #
# USO: ./webserver_ubuntu.sh                                #
#############################################################

function menuprincipal () {
	clear
	echo " "
	echo LAMP Stack Ubuntu $0
	echo " "
	echo "Escolha uma opção abaixo para começar!

		1 - Instalar Apache no sistema
		2 - Instalar o banco de dados MariaDB no sistema
		3 - Instalar o PHP7.2 no sistema
		4 - Instalar a stack LAMP completa no sistema
		0 - Sair do menu de instalação"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
	1)
		function apache () {
		TIME=2
			echo Atualizando seu sistema...
			sleep $TIME
			apt update && apt upgrade -y
			echo Iniciando a instalação do Apache no Ubuntu... 
			sleep $TIME
			#sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
			#sudo ufw allow http
			#sudo chown www-data:www-data /var/www/html/ -R
			apt install -y apache2 apache2-utils
			sudo systemctl start apache2
			sudo systemctl enable apache2	
			echo " "
				if [ $? -eq 0 ] 
				then
					echo O Apache foi instalado no seu sistema.
				else
					echo Ops, ocorreu algum erro, vamos tentar de novo!
				fi
			}
			apache
			read -n 1 -p "<Enter> para menu principal"
			menuprincipal
	;;

	2)
		function maria () {
		TIME=2
			echo Iniciando a instalação do MariaDB...
			sleep $TIME
			sudo apt -y install mariadb-server mariadb-client
			sudo systemctl start mariadb
			sudo systemctl enable mariadb
				if [ $? -eq 0 ]
				then
					echo Agora vamos configurar o banco...
					sleep $TIME
					sudo mysql_secure_installation
					echo " "
					echo Opa, parabéns, o banco foi instalado e configurado!
					sleep $TIME
				else
					echo Ops, vamos resolver isso? Acho que deu errado.
				fi
			}
			maria
			read -n 1 -p "<Enter> para menu principal"
			menuprincipal
	;;

	3)
		function php () {
			echo Iniciando a instalação do PHP...
			sudo apt install -y php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline
			sudo a2enmod php7.2
			sudo systemctl restart apache2	
			echo " "
			echo O PHP 7.2 foi instalado, que legal!
			#Para testar o PHP instalado...
			#sudo vim /var/www/html/info.php <?php phpinfo(); ?>
			}
			php
			read -n 1 -p "<Enter> para menu principal"
			menuprincipal
	;;

	4)
		function lamp () {
		TIME=2	
			#apache
			echo Vamos iniciar a instalação da stack LAMP no seu sistema... 
			sleep $TIME
			echo Instalando o Apache...
			sleep $TIME
			apt install -y apache2 apache2-utils
			sudo systemctl start apache2
			sudo systemctl enable apache2
			echo Instalando o banco de dados...
			sleep $TIME
			#banco de dados
			sudo apt -y install mariadb-server mariadb-client
			sudo systemctl start mariadb
			sudo systemctl enable mariadb
			#PHP
			echo Instalando o PHP...
			sleep $TIME
			sudo apt install -y php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline
			sudo a2enmod php7.2
			sudo systemctl restart apache2
			echo Instalação concluída com êxito!
			sleep $TIME
		}
			lamp
			read -n 1 -p "<Enter> para menu principal"
			menuprincipal
	;;

	0)
		function sair () {
			TIME=2
			echo " "
			echo Saindo do sistema...
			sleep $TIME
			exit 0
		}
		sair
	;;

esac
}
menuprincipal
