# RPi-Puppet

**NOTE** All the credit is for [bigbrozer](https://github.com/bigbrozer)

## Prerequisites

Having a raspberry pi woring and connected to the WAN

Remember:

    sudo rpi-update
    sudo reboot
    sudo apt-get update && sudo apt-get dist-upgrade -V
    sudo apt-get install dkms git
    sudo reboot

## Install Puppet

Step 1, get puppet repo:

    wget https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
    sudo dpkg -i puppetlabs-release-wheezy.deb
    sudo apt-get update
    mkdir temp && cd temp

Step 2, build dep and get sources:   

    for pkg in facter hiera ruby-rgen
    do
        sudo apt-get -y build-dep $pkg
        sudo apt-get -b source $pkg
    done
    
Step 3, intall requirements:

    sudo apt-get install virt-what ruby-json
    sudo dpkg -i facter_*.deb hiera_*.deb ruby-rgen_*.deb
    
Step4, install puppet:

    sudo apt-get -y build-dep puppet
    sudo apt-get -b source puppet
    sudo apt-get install augeas-lenses libaugeas0 libaugeas-ruby ruby-shadow
    sudo dpkg -i puppet-common_*.deb puppet_*.deb
    
Step5, clean:

    cd .. && sudo rm -rf temp

Sources and details, see http://stdout.no/puppet-on-raspberry-pi/ (thanks to **Runar Balstad Jensen**)

## Apply this puppet configuration on your Pi

    sudo su -
    mkdir /tmp/rpi-puppet
    git clone https://github.com/link-webcreations/rpi-puppet.git /tmp/rpi-puppet
    puppet apply --modulepath=/tmp/rpi-puppet/modules /tmp/rpi-puppet/manifests/site.pp
    
**Done :)**
