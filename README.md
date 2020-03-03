# Packer template for Windows Server 2019 Vagrant box

Minimalist [packer](https://packer.io/) template for running 
[Windows Server 2019 standard](https://www.microsoft.com/en-us/cloud-platform/windows-server-pricing) 
in a [vagrant](https://www.vagrantup.com/) box with [VirtualBox](https://www.virtualbox.org/) provider.

Based on excellent work by [Dr. Gusztáv Varga](https://github.com/gusztavvargadr/packer/) - 
refactored for minimalism and being able to run in a Linux environment without chef.

## Features

* User/pass: vagrant/vagrant
* Auto login for user vagrant
* WinRM set up for insecure (HTTP) unattended access (do not use in production)
* OpenSSH instlled and set up for unattended access
* Chocolatey installed
* Remote desktop enabled
* VirtualBox guest additions installed
  * OS configuration steps:
  * Windows updates disabled
  * Windows Defender disabled
  * Maintenance disabled
  * UAC disabled
  * StorageSense disabled

Note: Windows Server license is not provided (of course), system is running in 180 day evaluation mode

## Usage

### Build instructions

1. Install dependencies:
  * [packer](https://packer.io/)
  * [VirtualBox](https://www.virtualbox.org/)
  * [Vagrant](https://www.vagrantup.com/) (optional)
2. ```git clone https://github.com/mcree/vagrant-windows-server-2019.git```
3. ```cd vagrant-windows-server-2019```
4. ```packer build .```
5. ```vagrant box add --name win2019 win2019-*.box``` (optional)

### Vagrantfile for simple usage

```ruby
Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
     config.vm.box = "win2019"
     vb.gui = true
     vb.memory = 4096
     vb.cpus = 1
  end
end
```
