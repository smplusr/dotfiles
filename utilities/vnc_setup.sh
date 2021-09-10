cd ../config

apk add x11vnc
rc-update add local default
mv x11vnc/vnc.start /etc/local.d/
chmod +x /etc/local.d/vnc.start

echo "x11vnc" >> /home/user/.xinitrc

cd ../
