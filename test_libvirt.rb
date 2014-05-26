require 'ruby-libvirt'

#GUEST_DISK = '/var/lib/libvirt/images/example.qcow2'
#`rm -f #{GUEST_DISK} ; qemu-img create -f qcow2 #{GUEST_DISK} 5G`

#UUID = "93a5c045-6457-2c09-e5ff-927cdf34e17b"

# assume master ubuntu image in /var/lib/libvirt/images


class LibVirtManager 

  def initialize
    @conn =  Libvirt::open("qemu:///system")
    # read free IP addresses
    @available_ips = [ "10.0.1.224", "10.0.1.225", "10.0.1.226"]
    # do we need to check which VMs are running/defined?
    @api_keys = [ '3dU51CzpP1' ]
    @logins = { 'admin' => 'admin_password' }
  end

  def read_config
    # read json config file /config/config.json
    # @available_ips = ip addresses assigned to kvm
    # api_key & logins
  end

  def interfaces
    @conn.list_all_interfaces
  end

  def networks
    @conn.list_all_networks
  end

  def domains
    @conn.list_all_domains
  end
 
  def create_domain( filename)
    # need: name for vm, os to use, ram, disk size
    # get: IP address (that is free)

    # need to make a copy of disk
    # create boot CD
    # create xml file
    @conn.create_domain_linux( File.read( filename))
  end

  def create_domain2( name, options = {}) 
    # general xml
    domain_details = ""
    @conn.create_domain_linux( domain_details) 
  end

  def create_MAC
#MACADDR="52:54:00:$(dd if=/dev/urandom bs=512 count=1 2>/dev/null | md5sum | sed 's/^\(..\)\(..\)\(..\).*$/\1:\2:\3/')"; echo $MACADDR
  end
end


