echo ""
echo "[INFO] - Using online package installing ?"
echo "[WARN] - Require working networking and packages repositories !"
read -p "[INFO] - Answer: Y - N | " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	apk add alpine-conf xf86-video-nouveau xf86-video-nv xf86-video-vesa xf86-video-fbdev bspwm sxhkd vim sudo neofetch htop acpi pm-utils picom polybar feh xrandr bluez git make gcc g++ glfw glfw-dev openal-soft openal-soft-dev libx11-dev libxft-dev libxinerama-dev ncurses dbus-x11 x11vnc font-tewi ttf-font-awesome adwaita-gtk2-theme adwaita-icon-theme nerd-fonts alsa-utils alsa-lib alsaconf linux-headers
else
	echo ""
	echo "[INFO] - Using offline package installing ?"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo ""	
		echo "[INFO] - Upgrading offline installation packages ?"
		echo "[WARN] - Require working networking and package repositories !"
		read -p "[INFO] - Answer: Y - N | " -n 1 -r
		echo ""
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			cd ../packages
			apk fetch --recursive --force-broken-world --force-old-apk --force-overwrite --force-refresh alpine-conf xf86-video-nouveau xf86-video-nv xf86-video-vesa xf86-video-fbdev bspwm sxhkd vim sudo neofetch htop acpi pm-utils picom polybar feh xrandr bluez git make gcc g++ glfw glfw-dev openal-soft openal-soft-dev libx11-dev libxft-dev libxinerama-dev ncurses dbus-x11 x11vnc font-tewi ttf-font-awesome adwaita-gtk2-theme adwaita-icon-theme nerd-fonts alsa-utils alsa-lib alsaconf linux-headers
			apk fetch alpine-conf xf86-video-nouveau xf86-video-nv xf86-video-vesa xf86-video-fbdev alpine-conf bspwm sxhkd vim sudo neofetch htop acpi pm-utils picom polybar feh xrandr bluez git make gcc g++ glfw glfw-dev openal-soft openal-soft-dev libx11-dev libxft-dev libxinerama-dev ncurses dbus-x11 x11vnc font-tewi ttf-font-awesome adwaita-gtk2-theme adwaita-icon-theme nerd-fonts alsa-utils alsa-lib alsaconf linux-headers
			cd ../
		fi
		apk add --allow-untrusted ../packages/*.apk
	fi
fi
