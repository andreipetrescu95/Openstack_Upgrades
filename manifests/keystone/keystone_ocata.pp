class openstack_upgrade::keystone_ocata {
  exec { 'keystone_ocata_endpoints': 
    command => "/bin/endpoint_set /etc/keystone/admin-openrc.sh keystone \"http://openstack:35357/v3\" \"http://openstack:5000/v3\" \"http://openstack:5000/v3\""
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

  package { 'python2-oslo-middleware':
    ensure => "latest"
  }

  file { "/etc/keystone/keystone.conf":
    mode => "0640",
    owner => 'keystone',
    group => 'keystone',
    source => 'puppet:///modules/openstack_upgrade/configs/keystone/ocata/keystone.conf'
  }

  exec { 'keystone_ocata_db':
    command => "/bin/keystone-manage db_sync",
    user => "keystone"
  }

  exec { 'fernet_setup':
    command => "/bin/keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone"
  }

  exec { 'credential_setup':
    command => "/bin/keystone-manage credential_setup --keystone-user keystone --keystone-group keystone"
  }

  exec { 'create_wsgi_symlink':
    command => "/bin/rm  -f /etc/httpd/conf.d/wsgi-keystone.conf && \
                /bin/ln -s /usr/share/keystone/wsgi-keystone.conf /etc/httpd/conf.d/"
  }

  exec { 'keystone_chown':
    command => "/bin/chown keystone:keystone /usr/bin/keystone-wsgi-admin /usr/bin/keystone-wsgi-public"
  }
}

class { 'openstack_upgrade::keystone_ocata': }
