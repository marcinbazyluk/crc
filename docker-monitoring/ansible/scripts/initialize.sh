#!/bin/bash
echo "Download RKE instalator:"
wget -q https://github.com/rancher/rke/releases/download/v0.2.1/rke_linux-amd64 -O /usr/bin/rke
chmod a+x /usr/bin/rke
echo "------------------------------------------"
echo ""

echo "Clone config config file from repo:"
mkdir /home/studentvm/repo-kubernetes
cd /home/studentvm/repo-kubernetes
git init
git remote add origin https://github.com/crc-workshoops/k8s-one-node.git
git config core.sparseCheckout true
echo "config/k8s-lab.yml" >> .git/info/sparse-checkout
git pull origin master
chown -R studentvm.studentvm /home/studentvm/repo-kubernetes
echo "------------------------------------------"
echo ""

echo "Initialize Kubernetes RKE cluster:"
rke up --config /home/studentvm/repo-kubernetes/config/k8s-lab.yml
echo "------------------------------------------"
echo ""

echo "Install kubectl:"
wget -q https://storage.googleapis.com/kubernetes-release/release/v1.12.7/bin/linux/amd64/kubectl -O /usr/bin/kubectl
chmod a+x /usr/bin/kubectl

echo "------------------------------------------"
echo ""

echo "Configure kubectl:"
mkdir /etc/rke/
cp /home/studentvm/repo-kubernetes/config/kube_config_k8s-lab.yml /etc/rke
chmod a+rx /etc/rke
chmod a+r /etc/rke/kube_config_k8s-lab.yml
echo "export KUBECONFIG=/etc/rke/kube_config_k8s-lab.yml" >> /home/studentvm/.bashrc
echo "export KUBECONFIG=/etc/rke/kube_config_k8s-lab.yml" >> /root/.bashrc

echo "------------------------------------------"
echo ""

echo "Download and install Helm:"
curl -s -L https://git.io/get_helm.sh | bash
