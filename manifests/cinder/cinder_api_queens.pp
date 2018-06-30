class Openstack_Upgrades::cinder_api_queens {
  exec { 'cinder_queens_endpoints': 
    command => "/bin/endpoint_set /etc/keystone/admin-openrc.sh volumev2 \"http://openstack:8776/v2/%(project_id)s\" \"http://openstack:8776/v2/%(project_id)s\" \"http://openstack:8776/v2/%(project_id)s\""
  }

  exec { 'cinder_volume3_endpoints':
    command => "/bin/create_volumev3_endpoints /etc/keystone/admin-openrc.sh RegionOne openstack"
  }

  package { 'pyparsing':
    ensure => "latest"
  }

  package { 'openstack-cinder':
    ensure => "latest"
  }

  file { "/etc/cinder/cinder.conf":
    mode => "0640",
    owner => 'cinder',
    group => 'cinder',
    content => epp('Openstack_Upgrades/configs/cinder/queens/controller/cinder.conf.epp')
  }

  exec { 'cinder_queens_db':
    command => "/bin/cinder-manage db sync",
    user => "cinder"
  }
}

class { 'Openstack_Upgrades::cinder_api_queens': }
