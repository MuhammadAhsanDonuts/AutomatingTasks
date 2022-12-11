yum install curl vim git wget '@Development tools' nmap net-tools

sudo amazon-linux-extras install epel


sudo yum upgrade -y

#This is snapcrapt package manager. This is completely optional, we are doing this because certbot recommends snapcraft, and it's much easier to download certbot with this. 
sudo yum install snapd -y
systemctl enable --now snapd.socket
