class Openstack_Upgrades::glance_queens {
  package { 'openstack-glance':
    ensure => "latest"
  }

  file { "/etc/glance/glance-api.conf":
    mode => "0640",
    owner => 'glance',
    group => 'glance',
    source => 'puppet:///modules/Openstack_Upgrades/configs/glance/queens/glance-api.conf'
  }

  file { "/etc/glance/glance-registry.conf":
    mode => "0640",
    owner => 'glance',
    group => 'glance',
    source => 'puppet:///modules/Openstack_Upgrades/configs/glance/queens/glance-registry.conf'
  }

  exec { 'glance_queens_db':
    command => "/bin/glance-manage db_sync",
    user => "glance"
  }
}

class { 'Openstack_Upgrades::glance_queens': }
