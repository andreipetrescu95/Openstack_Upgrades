class openstack_upgrade::release_queens {
  package { 'centos-release-ceph-jewel':
    ensure => "purged"
  }

  package { 'centos-release-openstack-queens':
    ensure => "installed"
  }
}

class { 'openstack_upgrade::release_queens': }
