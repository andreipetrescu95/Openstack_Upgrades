class openstack_upgrade::cinder_api_newton {
  package { 'python2-os-brick':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-cinder':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  file { "/etc/cinder/cinder.conf":
    mode => "0640",
    owner => 'cinder',
    group => 'cinder',
    content => epp('openstack_upgrade/configs/cinder/newton/cinder.conf.epp')
  }

  file { "/usr/lib/python2.7/site-packages/cinder/db/sqlalchemy/api.py":
    mode => "644",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/openstack_upgrade/configs/cinder/misc/api.py'
  }

  exec { 'cinder_newton_db':
    command => "/bin/cinder-manage db sync",
    user => "cinder"
  }
}

class { 'openstack_upgrade::cinder_api_newton': }
