sudo mkdir /root/.ssh
sudo cp /home/vagrant/.ssh/authorized_keys /root/.ssh/
sudo chown -R root.root /root/.ssh/
sudo echo "root:crc2019" | chpasswd

sudo bash -c 'cat > /root/.ssh/config' << EOF
# Ignore ssh fingerprints
UserKnownHostsFile=/dev/null
StrictHostKeyChecking=no
LogLevel QUIET
EOF
