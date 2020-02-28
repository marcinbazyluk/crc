# Laboratorium Vagrant

## Wymagania

+ Wymagane paczki:
  - vagrant 2.x
  - python 2.7 lub nowszy
  - git 1.8 lub nowszy
  - VirtualBox 5.0 lub nowszy

## Elementy

+ Lista maszyn:
  - vm-grafana
  - vm-influxdb
  - vm-njmon
  - vm-nmon
  - vm-prometheus
  - vm1-os
  - vm2-os
  - vm3-os
  - vm4-os
  - vm5-os
  - vm6-os

+ Lista hostów (adresy IP):
  - 192.168.150.2 vm-grafana
  - 192.168.150.3 vm-influxdb
  - 192.168.150.4 vm-njmon
  - 192.168.150.5 vm-nmon
  - 192.168.150.6 vm-prometheus
  - 192.168.150.10 vm1-os
  - 192.168.150.11 vm2-os
  - 192.168.150.12 vm3-os
  - 192.168.150.13 vm4-os
  - 192.168.150.14 vm5-os
  - 192.168.150.15 vm6-os

## Jak przygotować laboratorium

Jeżeli nie masz wymaganych pakietów? Trzeba je zainstalować. W tym celu:

```
sudo wget -q http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo -P /etc/yum.repos.d/
sudo yum -y install epel-release
sudo yum -y install gcc make patch  dkms qt libgomp
sudo yum -y install kernel-headers kernel-devel fontforge binutils glibc-headers glibc-devel
sudo yum -y install VirtualBox-6.0
sudo yum -y install https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.rpm
```


Sklonuj fragment repozytorium (tylko katalog vagrant!).
```
mkdir ~/part-repo-vagrant
cd ~/part-repo-vagrant
git init
git remote add origin https://jankujawa:8f959a15d4e19e57a2b4356d489390f140e79b7c@github.ibm.com/CRC/docker-monitoring.git
git config core.sparseCheckout true
echo "vagrant" >> .git/info/sparse-checkout
git pull origin master
```

Wchodzimy do sklonowanego repozytorium:

```
cd ~/part-repo-vagrant/vagrant
vagrant up
```

Ta operacja może zająć chwilę proszę o cierpliwość.

```
Bringing machine 'vm-grafana' up with 'virtualbox' provider...
Bringing machine 'vm-influxdb' up with 'virtualbox' provider...
Bringing machine 'vm-njmon' up with 'virtualbox' provider...
Bringing machine 'vm-nmon' up with 'virtualbox' provider...
Bringing machine 'vm-prometheus' up with 'virtualbox' provider...
Bringing machine 'vm1-os' up with 'virtualbox' provider...
Bringing machine 'vm2-os' up with 'virtualbox' provider...
Bringing machine 'vm3-os' up with 'virtualbox' provider...
Bringing machine 'vm4-os' up with 'virtualbox' provider...
Bringing machine 'vm5-os' up with 'virtualbox' provider...
Bringing machine 'vm6-os' up with 'virtualbox' provider...
==> vm-grafana: Importing base box 'centos/7'...
==> vm-grafana: Matching MAC address for NAT networking...
==> vm-grafana: Checking if box 'centos/7' version '1902.01' is up to date...
==> vm-grafana: Setting the name of the VM: vm-grafana
.
..
...
vm6-os: Created symlink from /etc/systemd/system/multi-user.target.wants/node_exporter.service to /usr/lib/systemd/system/node_exporter.service.
   vm6-os: --------------------------------------------------
   vm6-os: Start service:
   vm6-os: --------------------------------------------------
   vm6-os: Check status:
   vm6-os: ● node_exporter.service - Prometheus exporter for machine metrics, written in Go with pluggable metric collectors.
   vm6-os:    Loaded: loaded (/usr/lib/systemd/system/node_exporter.service; enabled; vendor preset: disabled)
   vm6-os:    Active: active (running) since Fri 2019-04-12 00:02:45 CEST; 68ms ago
   vm6-os:      Docs: https://github.com/prometheus/node_exporter
   vm6-os:  Main PID: 5754 (node_exporter)
   vm6-os:    CGroup: /system.slice/node_exporter.service
   vm6-os:            └─5754 /usr/bin/node_exporter
   vm6-os:
   vm6-os: Apr 12 00:02:45 vm6-os systemd[1]: Started Prometheus exporter for machine metrics, written in Go with pluggable metric collectors..
```

Powinno wystartować 9 wirtualnych maszyn.

## Weryfikacja laboratorium:
```
vagrant status
Current machine states:

vm-grafana                running (virtualbox)
vm-influxdb               running (virtualbox)
vm-njmon                  running (virtualbox)
vm-nmon                   running (virtualbox)
vm-prometheus             running (virtualbox)
vm1-os                    running (virtualbox)
vm2-os                    running (virtualbox)
vm3-os                    running (virtualbox)
vm4-os                    running (virtualbox)
vm5-os                    running (virtualbox)
vm6-os                    running (virtualbox)


This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

## Jak łączyć się do maszyn:
Z katalogu głównego sklonowanego repozytorium (tam gdzie jest Vagrantfile):

```
vagrant ssh vm-grafana
[vagrant@vm-grafana ~]$ sudo su -
[root@vm-grafana ~]# id
uid=0(root) gid=0(root) groups=0(root) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```
