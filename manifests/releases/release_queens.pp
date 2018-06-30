class Openstack_Upgrades::release_queens {
  package { 'centos-release-ceph-jewel':
    ensure => "purged"
  }

  package { 'centos-release-openstack-queens':
    ensure => "installed"
  }
}

class { 'Openstack_Upgrades::release_queens': }
