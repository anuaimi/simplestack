# sets needed to setup server

# insert rvm
sudo apt-get install curl
\curl -sSL https://get.rvm.io | bash
source ~/.rvm/scripts/rvm

# install ruby
rvm requirements
rvm install 2.1

# check if HW supports virtualization
sudo apt-get install cpu-checker
kvm-ok
uname -m

# install kvm/libvirt
sudo apt-get install qemu-kvm libvirt-bin bridge-utils
sudo apt-get install libvirt-dev
#sudo apt-get install ubuntu-vm-builder
sudo adduser `id -un` libvirtd

# install openvswitch
sudo apt-get install openvswitch-switch
sudo ovs-vsctl -- --may-exist add-br br0
sudo ovs-vsctl -- --may-exist add-port br0 eth0

# download ubuntu image
wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img
sudo mv trusty-server-cloudimg-amd64-disk1.img /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img.dist
sudo qemu-img convert -O qcow2 /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img.dist /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img
sudo qemu-img resize /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img +8G 
sudo apt-get install cloud-utils

# 
sudo apt-get install libxml2-dev libxslt-dev
bundle install
