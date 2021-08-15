#!/usr/bin/env bash
# iDesktop adalah i3wm yg telah di kustomisasi tampilannya
# for info: 
# https://github.com/mojoid/iDesktop
#
#
read -p "sebelum melanjutkan kamu terlebih dahulu membutuhkan paket polybar-git, networkmanager-dmenu-git, picom-git. tekan y/n :" apa

install="$apa"

install() {
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

	sudo pacman -S --noconfirm $packages
}

set_iDesktop() {
	sudo pacman -S git;
	git clone https://github.com/mojoid/iDesktop $HOME
	echo "plis wait.."
	echo "importing files iDesktop.."
	cd $HOME/iDesktop && cp -rf {.*,*} ~/ 
	cd ~/.icons
	echo "Installing icons.."
	tar -Jxvf oomox-aesthetic-light.tar.xz 
	tar -Jxvf oomox-aesthetic-dark.tar.xz
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
	
if [ "$install" == "y" ] 
then
	install
elif [ "$install == n" ]
then
	echo 'Thanks..'
fi
