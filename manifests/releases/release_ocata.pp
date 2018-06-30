class Openstack_Upgrades::release_ocata {
  package { 'centos-release-openstack-ocata':
    ensure => "installed"
  }
}

class { 'Openstack_Upgrades::release_ocata': }
