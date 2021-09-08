# dotfiles

Dotfiles for Alpine linux.
Tested for Alpine 1.14.

These dotfiles contains the configs for a fully intergrated window manager and multy language development environment using vim.
To install it, just use the install.sh file in the main directory.

To set install.sh as executable:
'chmod +x install.sh'

INFO:

Config tested on MSI laptop, Lenovo Ideapad S10 and Rapsberry pi Zero W.
Information about the Raspberry pi Zero W in the WARNING section.
A usercfg (that works with the Raspberry pi Zero W) can be found in the misc directory.

WARNING:

The Raspberry pi Zero W can be installed in 'sys' mode (like other desktop computers), but will not boot.
A kernel error will occur if the device tries to boot after a fresh install.
This is due to missing files contained in the boot directory (that should be in the primary partition).
To fix this bootloader issue, it is recommended to directly extract and paste the boot folder from the armhf tar gz file
used to install the selected alpine linux version.
Tested version (with the issue + fixed): alpine-rpi-3.14.0-armhf.tar

To initialize X11 forwaring through ssh (openssh), the following files must be created/edited:
note that the lines for the first two files are most likely to be commented, in this case just uncomment the lines...
/etc/ssh/sshd_config:      X11Forwarding yes  AllowTcpForwarding yes
/etc/ssh/ssh_config:       ForwardX11 yes
/etc/X11/Xwrapper.config:  allowed_users=anybody

package/ folder not uploaded due to it's size. The "install packages offline" shall not be used.
Vim plugin may not work at first, it is recommended to run :PlugInstall or :PlugUpdate once vim is launched for the first time.
Full version (containing the package folder):

https://drive.google.com/drive/folders/13_bdtpZCKX1HQLvhgkuQXzXMLTJX6kX3?usp=sharing
