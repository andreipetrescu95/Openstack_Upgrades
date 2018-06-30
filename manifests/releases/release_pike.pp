class Openstack_Upgrades::release_pike {
  package { 'centos-release-openstack-pike':
    ensure => "installed"
  }
}

class { 'Openstack_Upgrades::release_pike': }
