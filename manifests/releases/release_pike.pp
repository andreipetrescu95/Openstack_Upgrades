class openstack_upgrade::release_pike {
  package { 'centos-release-openstack-pike':
    ensure => "installed"
  }
}

class { 'openstack_upgrade::release_pike': }
