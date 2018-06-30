class Openstack_Upgrades::nova_api_queens {
  package { 'openstack-nova-api':
    ensure => "latest"
  }

  package { 'openstack-nova-conductor':
    ensure => "latest"
  }

  package { 'openstack-nova-console':
    ensure => "latest"
  }

  package { 'openstack-nova-novncproxy':
    ensure => "latest"
  }

  package { 'openstack-nova-scheduler':
    ensure => "latest"
  }

  package { 'openstack-nova-placement-api':
    ensure => "latest"
  }

  package { 'python-novaclient':
    ensure => "latest"
  }

  file { "/etc/nova/nova.conf":
    mode => "0640",
    owner => 'nova',
    group => 'nova',
    content => epp('Openstack_Upgrades/configs/nova/queens/controller/nova.conf.epp')
  }

  exec { 'nova_queens_api_db':
    command => "/bin/nova-manage api_db sync",
    user => "nova"
  }

  exec { 'nova_queens_db':
    command => "/bin/nova-manage db sync",
    user => "nova"
  }
}

class { 'Openstack_Upgrades::nova_api_queens': }
