class Openstack_Upgrades::release_mitaka {
  exec { 'mitaka_repo':
    command => "/bin/yum-config-manager --add-repo http://distro.ctinetworks.com/distro/mirror/centos/7.3.1611/cloud/x86_64/openstack-mitaka/"
  }
}

class { 'Openstack_Upgrades::release_mitaka': }
