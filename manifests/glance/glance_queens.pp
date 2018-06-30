class openstack_upgrade::glance_queens {
  package { 'openstack-glance':
    ensure => "latest"
  }

  file { "/etc/glance/glance-api.conf":
    mode => "0640",
    owner => 'glance',
    group => 'glance',
    source => 'puppet:///modules/openstack_upgrade/configs/glance/queens/glance-api.conf'
  }

  file { "/etc/glance/glance-registry.conf":
    mode => "0640",
    owner => 'glance',
    group => 'glance',
    source => 'puppet:///modules/openstack_upgrade/configs/glance/queens/glance-registry.conf'
  }

  exec { 'glance_queens_db':
    command => "/bin/glance-manage db_sync",
    user => "glance"
  }
}

class { 'openstack_upgrade::glance_queens': }
