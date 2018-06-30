class openstack_upgrade::release_mitaka {
  exec { 'mitaka_repo':
    command => "/bin/yum-config-manager --add-repo http://distro.ctinetworks.com/distro/mirror/centos/7.3.1611/cloud/x86_64/openstack-mitaka/"
  }
}

class { 'openstack_upgrade::release_mitaka': }
