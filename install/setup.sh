# sets needed to setup server

# first setup bridge
# EDIT /etc/network/interfaces


# insert rvm
#sudo apt-get install curl
#\curl -sSL https://get.rvm.io | bash
#source ~/.rvm/scripts/rvm

# install ruby
#rvm requirements
#rvm install 2.1

# check if HW supports virtualization
sudo apt-get install -y cpu-checker
kvm-ok
uname -m

# install kvm/libvirt
sudo apt-get install -y qemu-kvm libvirt-bin bridge-utils
sudo apt-get install -y libvirt-dev
#sudo apt-get install ubuntu-vm-builder
sudo adduser `id -un` libvirtd

sudo apt-get install -y ruby1.9.1-dev
sudo apt-get install -y ruby-ffi
sudo apt-get install -y ruby-libvirt
sudo apt-get install -y cloud-utils
sudo apt-get install -y libxml2-dev libxslt-dev

# install openvswitch
#sudo apt-get install -y openvswitch-switch
#sudo ovs-vsctl -- --may-exist add-br br0
#sudo ovs-vsctl -- --may-exist add-port br0 eth0

# download ubuntu image
wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img
sudo mv trusty-server-cloudimg-amd64-disk1.img /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img.dist
sudo qemu-img convert -O qcow2 /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img.dist /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img
#sudo qemu-img resize /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img +8G 

# install packages needed by rails app
sudo apt-get install -y sqlite

# 
sudo gem install bundler
bundle install
