class openstack_upgrade::release_ocata {
  package { 'centos-release-openstack-ocata':
    ensure => "installed"
  }
}

class { 'openstack_upgrade::release_ocata': }
