sudo apt update && sudo apt install open-vm-tools-desktop -y
sudo reboot
sudo su
ldapsearch -x -b "dc=walter2026,dc=ldap"
sudo su
ip a
nano walterldap.sh
cchmod +x walterldap.sh
chmod +x walterldap.sh
./walterldap.sh
clear
./walterldap.sh
apt install phpldapadmin -y
sudo apt install phpldapadmin -y
sudo nano /etc/phpldapadmin/config.php
sudo systemctl restart apache2
ip a
sudo nano /etc/phpldapadmin/config.php
sudo systemctl restart apache2
sudo apt install ldap-account-m
apt update && apt upgrade -y
sudo apt update && apt upgrade -y
sudo su
sudo hostname walter-dc-smb
sudo reboot
nano walterldap.sh
sudo ln -s /usr/share/ldap-account-manager /var/www/html/lam
ls -l /var/www/html/lam
sudo systemctl restart apache2
sudo nano /etc/apache2/conf-available/ldap-account-manager.conf
sudo chown -R www-data:www-data /usr/share/ldap-account-manager
sudo nano /etc/apache2/conf-available/ldap-account-manager.conf
dpkg -L ldap-account-manager | grep apache
sudo apt install ldap-account-manager -y
sudo systemctl stop slapd
sudo systemctl disable slapd
hostanmectl
sudo hostnamectl walter-dc-smb
sudo hostnamectl set-hostname walter-dc-smb
sudo reboot
sudo nano /etc/netplan/50-cloud-init.yaml
sudo netplan apply
sudo nano /etc/netplan/50-cloud-init.yaml
ping 8.8.8.8
hostanamectl -sethostname walterubuserv
hostanamectl -set hostname walterubuserv
hostanamectl set-hostname walterubuserv
hostnamectl set-hostname walterubuserv
sudo hostnamectl set-hostname walterubuserv
