#!/bin/bash
echo "--------------------------------------------------"
echo "Install basic packages:"
sudo yum install -y wget
echo "--------------------------------------------------"
echo "Install and configure Prometheus repository:"
sudo curl -s https://packagecloud.io/install/repositories/prometheus-rpm/release/script.rpm.sh | sudo bash
echo "--------------------------------------------------"
echo "Install latest prometheus server:"
sudo yum install -y prometheus
echo "--------------------------------------------------"
echo "Startup modification:"
sudo systemctl enable prometheus
echo "--------------------------------------------------"
echo "Start service:"
sudo systemctl start prometheus
echo "--------------------------------------------------"
echo "Check status:"
sudo systemctl status prometheus
echo "--------------------------------------------------"
