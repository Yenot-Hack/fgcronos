#!/bin/bash

#var_color's
RED="$(printf '\033[31m')"          GREEN="$(printf '\033[32m')"        ORANGE="$(printf '\033[33m')"       BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"      CYAN="$(printf '\033[36m')"         WHITE="$(printf '\033[37m')"        BLACK="$(printf '\033[30m')"        RESET="$(printf '\033[0m')"
end="$(printf '\033[0m')"


function dependencies() {
    clear
    pack_apt () {
    if [[ $(command -v curl) == "" ]]
    then
    	apt install curl -y > /dev/null 2>&1
    fi
    

    if [[ $(command -v nmap) == "" ]]
    then
    	apt install nmap -y > /dev/null 2>&1
    fi

    if [[ $(command -v php) == "" ]]
    then
    	apt install php -y > /dev/null 2>&1
    fi


    }
    pack_apt
    install_ngrok(){
            if [[ -e ngrok ]];then
                  cp ngrok /usr/bin
            else
                        if [[ -e ngrok-stable-linux-386.zip ]]; then
                        unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
                        chmod +x ngrok
                        rm ngrok-stable-linux-386.zip
                        cp $PWD/ngrok /usr/bin
                  else
                        wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
                        unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
                        chmod +x ngrok
                        rm ngrok-stable-linux-386.zip
                        cp $PWD/ngrok /usr/bin
                  fi
            fi
      }
      install_ngrok

      check_bin()
      {
            if [[ ! -e /usr/bin/fgcronos ]]; then
                  rm -rf /usr/bin/fgcronos
                  cp $PWD/fgcronos /usr/bin
            else
                  cp $PWD/fgcronos /usr/bin
            fi
      }
      check_bin
      cd ..
      rm -r fgcronos
      cd
}
clear
dependencies
echo "Installing and configuring..."
sleep 1
clear
echo "Done ✅ "
echo -e "\nTo use run command: fgcronos "
