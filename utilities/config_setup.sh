cd ../config

echo ""
echo "[INFO] - Using picom ?"
read -p "[INFO] - Answer: Y - N | " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then	
	sed -i '1ipicom -b' xinitrc
fi

echo ""
echo "[INFO] - Use Random wallpapers ?"
read -p "[INFO] - Answer: Y - N | " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then	

	sed -i '1ifeh --randomize --bg-fill .config/wallpapers/*.jpg' xinitrc

else
	echo ""
	echo "[INFO] - Using wallpaper 1 ?"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sed -i '1ifeh --bg-fill .config/wallpapers/wallpaper-1.jpg' xinitrc
	else
		echo ""
		echo "[INFO] - Using wallpaper 2 ?"
		read -p "[INFO] - Answer: Y - N | " -n 1 -r
		echo ""
		if [[ $REPLY =~ ^[Yy]$ ]]
		then	
			sed -i '1ifeh --bg-fill .config/wallpapers/wallpaper-2.jpg' xinitrc
		else
			echo ""
			echo "[INFO] - Using wallpaper 3 ?"
			read -p "[INFO] - Answer: Y - N | " -n 1 -r
			echo ""
			if [[ $REPLY =~ ^[Yy]$ ]]
			then
				sed -i '1ifeh --bg-fill .config/wallpapers/wallpaper-3.jpg' xinitrc
			else
				echo ""
				echo "[INFO] - Using wallpaper 4 ?"
				read -p "[INFO] - Answer: Y - N | " -n 1 -r
				echo ""
				if [[ $REPLY =~ ^[Yy]$ ]]
				then	
					sed -i '1ifeh --bg-fill .config/wallpapers/wallpaper-4.jpg' xinitrc
				else
					echo ""
					echo "[INFO] - Using wallpaper 5 ?"
					read -p "[INFO] - Answer: Y - N | " -n 1 -r
					echo ""
					if [[ $REPLY =~ ^[Yy]$ ]]
					then	
						sed -i '1ifeh --bg-fill .config/wallpapers/wallpaper-5.jpg' xinitrc
					else
						echo ""
						echo "[INFO] - Using wallpaper 6 ?"
						read -p "[INFO] - Answer: Y - N | " -n 1 -r
						echo ""
						if [[ $REPLY =~ ^[Yy]$ ]]
						then
							sed -i '1ifeh --bg-fill .config/wallpapers/wallpaper-6.jpg' xinitrc
						else
							echo ""
							echo "[INFO] - Using wallpaper 7 ?"
							read -p "[INFO] - Answer: Y - N | " -n 1 -r
							echo ""
							if [[ $REPLY =~ ^[Yy]$ ]]
							then	
								sed -i '1ifeh --bg-fill .config/wallpapers/wallpaper-7.jpg' xinitrc
							fi
						fi
					fi
				fi
			fi
		fi
	fi	
fi

mv config /home/user/.config

echo ""
echo "[INFO] - Using vim config ?"
read -p "[INFO] - Answer: Y - N | " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then	
	mv vim /home/user/.vim
fi

mv profile /home/user/.profile
mv xinitrc /home/user/.xinitrc

chmod +x /home/user/.config/bspwm/bspwmrc
chmod +x /home/user/.config/sxhkd/sxhkdrc

chown -R user /home/user

cd st && make clean install
cd ../

cd dmenu && make clean install
cd ../
