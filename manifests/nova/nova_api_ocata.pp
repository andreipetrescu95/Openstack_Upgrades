class openstack_upgrade::nova_api_ocata {
  exec { 'create_cell0':
    command => "/bin/create_cell0 root root nova"
  }

  exec { 'nova_ocata_endpoints':
    command => "/bin/endpoint_set /etc/keystone/admin-openrc.sh nova \"http://openstack:8774/v2.1\" \"http://openstack:8774/v2.1\" \"http://openstack:8774/v2.1\""
  }

  exec { 'nova_placement':
    command => "/bin/create_placement_endpoints /etc/keystone/admin-openrc.sh RegionOne openstack"
  }

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

  package { 'python2-oslo-middleware':
    ensure => "latest"
  }

  package { 'python-novaclient':
    ensure => "latest"
  }

  file { "/etc/nova/nova.conf":
    mode => "0640",
    owner => 'nova',
    group => 'nova',
    content => epp('openstack_upgrade/configs/nova/ocata/nova.conf.epp')
  }

  file { "/etc/httpd/conf.d/00-nova-placement-api.conf":
    mode => "0640",
    source => 'puppet:///modules/openstack_upgrade/configs/nova/misc/00-nova-placement-api.conf'
  }

  file { "/usr/lib/python2.7/site-packages/nova/db/sqlalchemy/api.py":
    mode => "644",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/openstack_upgrade/configs/nova/misc/api.py'
  }

  exec { 'nova_ocata_map_cell0':
    command => "/bin/nova-manage cell_v2 map_cell0",
    user => "nova"
  }

  exec { 'nova_ocata_create_cell1':
    command => "/bin/nova-manage cell_v2 create_cell --name=cell1 --verbose",
    user => "nova"
  }

  exec { 'nova_ocata_api_db':
    command => "/bin/nova-manage api_db sync",
    user => "nova" 
  }

  exec { 'nova_ocata_db':
    command => "/bin/nova-manage db sync",
    user => "nova"
  }
}

class { 'openstack_upgrade::nova_api_ocata': }
