class openstack_upgrade::nova_api_mitaka {
  exec { 'nova_mitaka_endpoints': 
    command => "/bin/endpoint_set /etc/keystone/admin-openrc.sh nova \"http://openstack:8774/v2.1/%(tenant_id)s\" \"http://openstack:8774/v2.1/%(tenant_id)s\" \"http://openstack:8774/v2.1/%(tenant_id)s\""
  }

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
    content => epp('openstack_upgrade/configs/nova/mitaka/controller/nova.conf.epp')
  }

  exec { 'nova_mitaka_api_db':
    command => "/bin/nova-manage api_db sync",
    user => "nova"
  }

  exec { 'nova_mitaka_db':
    command => "/bin/nova-manage db sync",
    user => "nova"
  }
}

class { 'openstack_upgrade::nova_api_mitaka': }
