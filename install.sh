chmod +x utilities/broadcom_setup.sh
chmod +x utilities/package_setup.sh
chmod +x utilities/config_setup.sh

echo ""
echo "[INFO] - Required Alpine linux image -> alpine-extended-3.14.0-x86"

if id user >/dev/null 2>&1
then
    echo ""
	echo "[WARN] - User profile already exists !"
	echo "[INFO] - Do you want to delete it ?"
	echo "[WARN] - All files inside /home/user will be deleted !"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		deluser user
		rm -r /home/user
		echo "[WARN] - Please, relaunch the installer !"
	else
		echo "[WARN] - Could not proceed main installation or configuration, please re-run the setup after the deletion of the user 'user' and the removal of it's files !"
	fi
else
	echo ""
	echo "[INFO] - Updating repositories ?"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		mv misc/repositories /etc/apk
	fi

	echo ""
	echo "[INFO] - Upgrading the alpine kernel to edge ?"
	echo "[WARN] - Require working networking !"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then	
		apk -U upgrade -a
	fi

	echo ""
	echo "[INFO] - Installing packages ?"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then	
		cd utilities
		./package_setup.sh
	fi

	echo ""
	echo "[INFO] - Installing Broadcom specific drivers ?"
	echo "[WARN] - May corrupt setup-interfaces !"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		cd utilities
		./broadcom_setup.sh
	fi

	echo ""
	echo "[INFO] - Proceed the main installation ?"
	echo "[WARN] - Require previous package installation !"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		adduser user
		
		setup-xorg-base
		
		addgroup user audio 
		addgroup user video 
		addgroup user input 
		
		rc-service alsa start 
		rc-update add alsa 
		rc-service bluetooth start 
		rc-update add bluetooth

		mv misc/40-libinput.conf /usr/share/X11/xorg.conf.d/

		echo snd-pcm-oss >> /etc/modules
	fi

	echo ""
	echo "[INFO] - Install x11vnc and configs ?"
	echo "[WARN] - Requires network connexion and reboot afterward !"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then	
		cd utilities
		./vnc_setup.sh
	fi
	
	echo ""
	echo "[INFO] - Installing config for user ?"
	read -p "[INFO] - Answer: Y - N | " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then	
		cd utilities
		./config_setup.sh
	fi
fi
