cd ../config

chmod +x ssh/Xwrapper.config
mv ssh/sshd_config /etc/X11/
mv ssh/Xwrapper.config /etc/ssh/

cd ../