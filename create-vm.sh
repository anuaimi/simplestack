
# take snapshort
sudo qemu-img create -f qcow2 -b /var/lib/libvirt/images/trusty-server-cloudimg-amd64-disk1.img /var/lib/libvirt/images/trusty-server.img

# create user data
sudo cloud-localds /var/lib/libvirt/images/user-data.img cloud-config

