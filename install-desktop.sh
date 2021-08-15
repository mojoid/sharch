#!/usr/bin/env bash
#
#
#



set_kde() { 
	echo 'install kde'
	install_kde
	#systemctl enable sddm
}

install_kde() {
	local packages=''	
	#plasma
	packages+=' sddm sddm-kcm plasma-desktop plasma-nm plasma-pa kdeplasma-addons kde-system-meta breeze breeze-grub'
	#tools
	packages+=' bluedevil gst-libav dolphin dolphin-plugins discover appstream appstream-qt packagekit packagekit-qt5 kdialog'
	#apps
	packages+=' konsole yakuake kfind kdeconnect ark spectacle vlc gwenview kinfocenter khelpcenter plasma-systemmonitor'
	sudo pacman -S $packages
}

set_xfce() {
	echo 'install xfce'
	local packages=''
	packages+='
	lightdm
	xfce4
	xfce4-goodies'
	#systemctl enable lightdm
	sudo pacman -S $packages
}

set_i3() {
	echo -e 'sebelum melanjutkan kamu terlebih dahulu membutuhkan paket: \n	polybar-git\n	networkmanager-dmenu-git\n	picom-git'
	read -p 'untuk melanjutkan tekan y/n : ' apa
	

if [ $apa == y ]; then
	install_iDesktop
elif [ $apa == n ]; then
	echo 'Thanks..'
fi

}

install_iDesktop() {
	echo 'install packages dependensi iDesktop..' 
	set_dependensi
	
	echo 'setup iDesktop..'
	set_iDesktop
}

set_dependensi() {
local packages+=''
	# iDesktop dependensi
        packages+='
	alsa-utils
	brightnessctl
	dialog
	dunst
	feh
	i3-gaps
	i3lock
	imagemagick
	jq
	gsimplecal
	lxappearance
	lxsession
	mpd
	mpv
	ncmpcpp
	neofetch
	papirus-icon-theme
	parcellite
	pavucontrol
	pulseaudio
	pulseaudio-alsa
	rofi
	rxvt-unicode
	scrot
	thunar
	thunar-archive-plugin
	thunar-media-tags-plugin
	thunar-volman
	ttf-dejavu
	tumbler
	viewnior
	w3m
	wireless_tools
	wpa_supplicant
	xautolock
	xclip
	xfce4-power-manager
	xorg
	xorg-server
	xorg-xinit
	xsettingsd'	
sudo pacman -S $packages
}

set_iDesktop() {
	sudo pacman -S git;
	git clone https://github.com/mojoid/iDesktop $HOME
	echo "plis wait.."
	echo "importing files iDesktop.."
	cd $HOME/iDesktop && cp -rf {.*,*} ~/ 
	cd ~/.icons
	echo "Installing icons.."
	tar -Jxvf ilight.tar.xz 
	tar -Jxvf idark.tar.xz
	echo "installing fonts.."
	fc-cache rv
	$HOME/.config/i3/switch.sh &> /dev/null
	echo "apllying iDesktop.."
	sleep 5
	cd $HOME && i3-msg "restart"
	killall picom; sleep 2; picom -b &
	rm -r $HOME/.icons/{*.tar.xz}
	rm -rf $HOME/{README.md,Other,.git,install,iDesktop.txt}
	echo "For Firs Time.. Plis, Hit Super+Shift+R To Refresh Theme."
	echo "Hit Super+Shift+M to switch dark/light theme"
	echo "Done."
}
echo -e 'enter numbers to install desktop or wm\n1 kde\n2 xfce\n3 i3'
read -p 'choose: ' de
if [ $de == 1 ]; then
	set_kde
elif [ $de ]; then
	if [ $de == 2 ]; then
		set_xfce
	elif [ $de == 3 ]; then
		set_i3
	fi
fi
