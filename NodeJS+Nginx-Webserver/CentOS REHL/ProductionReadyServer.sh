#Installing these tools to kickstart your deployment server. 
dnf install curl vim git wget '@Development tools' nmap net-tools 

dnf install epel-release

dnf upgrade -y

#This is snapcrapt package manager. This is completely optional, we are doing this because certbot recommends snapcraft,
#and it's much easier to download certbot with this. For this epel-release is essential. 
dnf install snapd -y
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
echo snap --version

#For automatic updates
dnf install dnf-automatic -y
#Enabling timers for automating updates
systemctl enable --now dnf-automatic.timer

#you can check the timers with the command "systemctl list-timers"
echo "Timer has been updated -> Check with the command <systemctl list-timers>"