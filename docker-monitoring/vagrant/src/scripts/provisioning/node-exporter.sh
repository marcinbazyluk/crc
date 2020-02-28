#!/bin/bash
echo "--------------------------------------------------"
echo "Install basic packages:"
sudo yum install -y wget
echo "--------------------------------------------------"
echo "Install and configure Prometheus repository:"
sudo curl -s https://packagecloud.io/install/repositories/prometheus-rpm/release/script.rpm.sh | sudo bash
echo "--------------------------------------------------"
echo "Install latest prometheus server:"
sudo yum install -y node_exporter
echo "--------------------------------------------------"
echo "Startup modification:"
sudo systemctl enable node_exporter
echo "--------------------------------------------------"
echo "Start service:"
sudo systemctl start node_exporter
echo "--------------------------------------------------"
echo "Check status:"
sudo systemctl status node_exporter
echo "--------------------------------------------------"
