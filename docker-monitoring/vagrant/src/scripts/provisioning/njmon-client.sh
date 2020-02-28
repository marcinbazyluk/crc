#!/bin/bash
echo "--------------------------------------------------"
echo "Install neccessary python modules:"
echo "--------------------------------------------------"
sudo yum -y update
sudo yum install -y lsof wget git ksh
echo "--------------------------------------------------"
echo "Clone onlu njmon directory:"
echo "--------------------------------------------------"
mkdir /home/vagrant/repo
cd /home/vagrant/repo
git init
git remote add origin https://jankujawa:8f959a15d4e19e57a2b4356d489390f140e79b7c@github.ibm.com/CRC/docker-monitoring.git
git config core.sparseCheckout true
echo "vagrant/src/njmon" >> .git/info/sparse-checkout
git pull origin master
echo "--------------------------------------------------"
echo "Copy njmon client binary to proper path:"
echo "--------------------------------------------------"
sudo cp /home/vagrant/repo/vagrant/src/njmon/njmon_linux_x86_rhel75_v22 /usr/local/bin/njmon
sudo chmod 755 /usr/local/bin/njmon
echo "--------------------------------------------------"
echo "Install cron for njmon data pumping:"
echo "--------------------------------------------------"
sudo cp /home/vagrant/repo/vagrant/src/njmon/custom/root.cron /var/spool/cron/root
sudo chown root.root /var/spool/cron/root
