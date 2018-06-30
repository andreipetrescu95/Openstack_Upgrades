class Openstack_Upgrades::keystone_queens {
  exec { 'keystone_queens_endpoints': 
    command => "/bin/endpoint_set /etc/keystone/admin-openrc.sh keystone \"http://openstack:5000/v3\" \"http://openstack:5000/v3\" \"http://openstack:5000/v3\""
  }

  package { 'openstack-keystone':
    ensure => "latest"
  }

  package { 'httpd':
    ensure => "latest"
  }

  package { 'mod_wsgi':
    ensure => "latest"
  }

  file { "/etc/keystone/keystone.conf":
    mode => "0640",
    owner => 'keystone',
    group => 'keystone',
    source => 'puppet:///modules/Openstack_Upgrades/configs/keystone/queens/keystone.conf'
  }

  exec { 'keystone_queens_db':
    command => "/bin/keystone-manage db_sync",
    user => "keystone"
  }

  exec { 'keystone_chown':
    command => "/bin/chown keystone:keystone /usr/bin/keystone-wsgi-admin /usr/bin/keystone-wsgi-public"
  }
}

class { 'Openstack_Upgrades::keystone_queens': }
