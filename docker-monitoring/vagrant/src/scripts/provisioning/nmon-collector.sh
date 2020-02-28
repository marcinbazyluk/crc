#!/bin/bash
echo "--------------------------------------------------"
echo "Install neccessary packages:"
echo "--------------------------------------------------"
sudo yum -y update
sudo yum install -y lsof wget git ksh vim
echo "--------------------------------------------------"
echo "Clone only njmon directory:"
echo "--------------------------------------------------"
mkdir /home/vagrant/repo
cd /home/vagrant/repo
git init
git remote add origin https://jankujawa:8f959a15d4e19e57a2b4356d489390f140e79b7c@github.ibm.com/CRC/docker-monitoring.git
git config core.sparseCheckout true
echo "vagrant/src/nmon" >> .git/info/sparse-checkout
git pull origin master
echo "--------------------------------------------------"
echo "Copy necessary files into proper paths + setting proper permissions:"
echo "--------------------------------------------------"
sudo mkdir -p /usr/local/nmon-import/{bin,db,logs}
sudo cp /home/vagrant/repo/vagrant/src/nmon/importer/nmon_importer /usr/local/nmon-import/bin
sudo cp /home/vagrant/repo/vagrant/src/nmon/importer/nmon_import_slack.py /usr/local/nmon-import/bin
sudo cp /home/vagrant/repo/vagrant/src/nmon/importer/lab.lst /usr/local/nmon-import
sudo cp /home/vagrant/repo/vagrant/src/nmon/importer/nmon2influxdb /usr/local/bin
sudo chown -R root.root /usr/local/nmon-import
sudo chown root.root /usr/local/bin/nmon2influxdb
echo "-----------------------------"
echo "Install ssh private key root:"
echo "-----------------------------"
sudo cp /home/vagrant/.ssh/id_rsa /root/.ssh/
sudo chown -R root.root /root/.ssh/
echo "--------------------------"
echo "Install cron for importer:"
echo "--------------------------"
sudo cp /home/vagrant/repo/vagrant/src/nmon/custom/root-importer.cron /var/spool/cron/root
sudo chown root.root /var/spool/cron/root
echo "----------------------------------"
echo "Install nmon2influxdb config file:"
echo "----------------------------------"
sudo cp /home/vagrant/repo/vagrant/src/nmon/custom/.nmon2influxdb.cfg /root/
echo "------------------------"
echo "Create /nmons directory:"
echo "------------------------"
sudo mkdir /nmons
