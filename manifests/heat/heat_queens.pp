class openstack_upgrade::heat_queens {
  package { 'openstack-heat-api':
    ensure => "latest"
  }

  package { 'openstack-heat-api-cfn':
    ensure => "latest"
  }

  package { 'openstack-heat-engine':
    ensure => "latest"
  }

  file { "/etc/heat/heat.conf":
    mode => "0640",
    owner => 'heat',
    group => 'heat',
    source => 'puppet:///modules/openstack_upgrade/configs/heat/queens/heat.conf'
  }

  exec { 'heat_queens_db':
    command => "/bin/heat-manage db_sync",
    user => "heat"
  }
}

class { 'openstack_upgrade::heat_queens': }
