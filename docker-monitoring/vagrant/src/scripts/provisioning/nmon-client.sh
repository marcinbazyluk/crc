#!/bin/bash
echo "--------------------------------------------------"
echo "Install neccessary packages:"
echo "--------------------------------------------------"
sudo yum -y update
sudo yum install -y lsof wget git ksh
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
echo "Copy nmon client binary to proper path:"
echo "--------------------------------------------------"
sudo cp /home/vagrant/repo/vagrant/src/nmon/client/nmon16h_x86_rhel7 /usr/local/bin/nmon
sudo chmod 755 /usr/local/bin/nmon
echo "--------------------------------------------------"
echo "Install cron for nmon and create perf/daily directory:"
echo "--------------------------------------------------"
sudo mkdir -p /etc/perf/daily
sudo cp /home/vagrant/repo/vagrant/src/nmon/custom/root-client.cron /var/spool/cron/root
sudo chown root.root /var/spool/cron/root
echo "-----------------------"
echo "Start nmon on machine:"
echo "----------------------"
#sudo /usr/local/bin/nmon -f -s 30 -c 2880 -T -N -I 0.1 -m /etc/perf/daily/ >/dev/null 2>&1
