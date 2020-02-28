#!/bin/bash
echo "--------------------------------------------------"
echo "Install neccessary python modules:"
echo "--------------------------------------------------"
sudo apt-get -y update
sudo apt-get -y install python3-pip git ksh
sudo pip3 install influxdb
echo "--------------------------------------------------"
echo "Clone only njmon directory:"
echo "--------------------------------------------------"
mkdir /home/vagrant/repo
cd /home/vagrant/repo
git init
git remote add origin https://jankujawa:8f959a15d4e19e57a2b4356d489390f140e79b7c@github.ibm.com/CRC/docker-monitoring.git
git config core.sparseCheckout true
echo "vagrant/src/njmon" >> .git/info/sparse-checkout
git pull origin master
echo "--------------------------------------------------"
echo "Copy necessary files into proper paths + setting proper permissions:"
echo "--------------------------------------------------"
sudo cp /home/vagrant/repo/vagrant/src/njmon/njmon_collector_x86_ubuntu1804_v16 /usr/local/bin/njmon_collector
sudo chmod 755 /usr/local/bin/njmon_collector
sudo cp /home/vagrant/repo/vagrant/src/njmon/njmon_to_InfluxDB_injector_15.py /usr/local/bin/injector.py
sudo cp /home/vagrant/repo/vagrant/src/njmon/custom/start-njmon-c.sh /usr/local/bin/start-njmon.sh
sudo cp /home/vagrant/repo/vagrant/src/njmon/custom/stop-njmon-c.sh /usr/local/bin/stop-njmon.sh
sudo cp /home/vagrant/repo/vagrant/src/njmon/custom/njmon-collector.service /etc/systemd/system
sudo chmod 755 /usr/local/bin/start-njmon.sh /usr/local/bin/stop-njmon.sh /usr/local/bin/injector.py
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
echo "--------------------------------------------------"
echo "Enable autostart and start NJMON Collector service:"
echo "--------------------------------------------------"
sudo systemctl enable njmon-collector
sudo systemctl start njmon-collector
