#
# NOT SURE THIS IS NEEDED
# see a number of net postings about using 'interface' rather than 'network'
# just set <interface type='bridge'><soruce bridge='br0'/></interface>

# generate a MAC address
MACADDR="52:54:00:$(dd if=/dev/urandom bs=512 count=1 2>/dev/null | md5sum | sed 's/^\(..\)\(..\)\(..\).*$/\1:\2:\3/')"; echo $MACADDR


# remove default bridge 
virsh net-destroy default

# create network we want

# STANDARD SUBNET OF IPs 

# STATICALLY ROUTED IPs
cat <<EOF >/usr/share/libvirt/networks/default.xml
<network>
  <name>default</name>
  <uuid>2696eec4-286d-4168-958b-42ef0be4ea3d</uuid>
  <bridge name="virbr0" mode="route" />
  <forward/>
  <ip address="10.110.7.1" netmask="255.255.255.192">
    <dhcp>
      <range start="10.110.7.2" end="10.110.7.10" />
    </dhcp>
  </ip>
</network>
EOF


virsh net-define /usr/share/libvirt/network/default.xml

# for routed, need to enable ip_forward & add route
#echo 1 > /proc/sys/net/ipv4/ip_forward
#route add -net 10.110.7.0/26 gw 10.101.1.25

