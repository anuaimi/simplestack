require 'ruby-libvirt'

#GUEST_DISK = '/var/lib/libvirt/images/example.qcow2'
#`rm -f #{GUEST_DISK} ; qemu-img create -f qcow2 #{GUEST_DISK} 5G`

#UUID = "93a5c045-6457-2c09-e5ff-927cdf34e17b"


class LibVirtManager 

  def initialize
    @conn =  Libvirt::open("qemu:///system")
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
    @conn.create_domain_linux( File.read( filename))
  end

  def create_domain2( name, options = {}) 
    # general xml
    domain_details = ""
    @conn.create_domain_linux( domain_details) 
  end

end


