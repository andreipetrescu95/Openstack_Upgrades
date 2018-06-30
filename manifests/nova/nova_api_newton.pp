class openstack_upgrade::nova_api_newton {
  package { 'openstack-nova-api':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-nova-conductor':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-nova-console':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-nova-novncproxy':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-nova-scheduler':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'python-novaclient':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  file { "/etc/nova/nova.conf":
    mode => "0640",
    owner => 'nova',
    group => 'nova',
    content => epp('openstack_upgrade/configs/nova/newton/nova.conf.epp')
  }

  exec { 'nova_newton_api_db':
    command => "/bin/nova-manage api_db sync",
    user => "nova"
  }

  exec { 'nova_newton_db':
    command => "/bin/nova-manage db sync",
    user => "nova"
  }

  exec { 'nova_newton_db_migration':
    command => "/bin/nova-manage db online_data_migrations",
    user => "nova"
  }
}

class { 'openstack_upgrade::nova_api_newton': }
