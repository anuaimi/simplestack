# SimpleStack

details how to create an ubuntu 14.04 guest using libvirt

## INSTALL

```bash
brew install libvirt
bundle install
```

- in the install directory there is a bash script to install the dependancies
- you will need to setup the linux bridge that KVM uses.  most people
  will want to move the IP from eth0 to the bridge but other configurations
  may be required (you have a routed ip block)

## RUNNING

- simplestack is a rails app

## TODO

- use linux bridge rather than openvswitch
- update libvirt xml to set MAC address & IP
- create sinatra app
- add functions to create, list, delete VMs
- package with pkgr
- test
- make compatible with fog
- add extra commands to report amount of RAM, IPs left on machine
- move images to be stored in /var/lib/libvirt/images
