require 'libvirt'

GUEST_DISK = '/var/lib/libvirt/images/example.qcow2'
`rm -f #{GUEST_DISK} ; qemu-img create -f qcow2 #{GUEST_DISK} 5G`

UUID = "93a5c045-6457-2c09-e5ff-927cdf34e17b"
