#!/bin/bash

# Scripts for Linux - setup_LAMP.sh
# Copyright (C) 2019 - 2020 Alejandro López

bold="\e[7m"
marcado="\e[32;47m"
normal="\e[27m"
normal2="\e[m"

function main() {
    
    clear
    # Check permissions
    if [[ "$EUID" -ne 0 ]]; then
        echo "Please run as root"
        exit
    else
        # Display menu
        echo -e $marcado"0.$normal2 Exit script"
        echo -e $marcado"1.$normal2 Install Apche + Mysql + Php"
        echo -e $marcado"2.$normal2 Add user administrator to mysql"
        read -p "Type a option (0-1): " opt
        return $opt
    fi
}

function controller(){

    # EXIT
    if [[ $opt -eq 0 ]]; then

        exit
    fi

    # INSTALL
    if [[ $opt -eq 1 ]]; then
        
        clear
        echo $bold"Updates completed. Starting installation, this will take a few minutes..."$normal
        echo "#######################################################"
        apt install -y apache2 php libapache2-mod-php mysql-server php-mysql
        
        clear
        echo -e "\e[7mInstallation completed successfully.\e[27m"
        sleep 5
        clear
        main;
    fi

    # ADD USER
    if [[ $opt -eq 2 ]]; then

        clear
        STRING="CREATE USER 'admin' IDENTIFIED BY 'toor';"
        STRING2="GRANT ALL ON *.* TO admin@'localhost' IDENTIFIED BY 'toor' WITH GRANT OPTION;"
        mysql -e "$STRING"
        mysql -e "$STRING2"
        clear
        echo -e $bold"User: admin, Password: toor, access: localhost"$normal
        echo "#######################################################"
    fi

}

main;
controller;
