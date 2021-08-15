#!/usr/bin/env bash 
# output pacman -Qqe
# aur packages:
#
# yay
# networkmanager-dmenu
# picom-git
# polybar
# qt5-styleplugins
# chrome

read -p "tekan y/n :" apa

install="$apa"


install() {
	echo 'install arch post..'
	set_install_post
	
	echo 'install yay aur helper..'
	set_yay
	
	echo 'Install done. Thanks'
}

set_install_post() {
    local packages=''

	# audio
		packages+=' 
	pulseaudio
	pulseaudio-alsa
	pulseaudio-bluetooth
	alsa-utils
	bluez
	bluez-utils'
	
    # tools media & office
		packages+='
	atril
	galculator
	geany
	git
	htop
	nano
	neofetch
	p7zip
	ranger
	vim
	vlc
	xarchiver'

	sudo pacman -S --noconfirm $packages
}
set_yay() {
	git clone https://aur.archlinux.org/yay.git $HOME
	cd $HOME && makepkg -si		
} 

if [ "$install" == "y" ] 
then
	install
elif [ "$install == n" ]
then
	echo 'Thanks..'
fi

