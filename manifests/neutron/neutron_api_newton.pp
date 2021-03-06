class openstack_upgrade::neutron_api_newton {
  package { 'openstack-neutron':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-neutron-ml2':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-neutron-vpnaas':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-neutron-lbaas':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-neutron-fwaas':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-neutron-metering-agent':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'ebtables':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'python2-pecan':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  file { "/etc/neutron/neutron.conf":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    source => 'puppet:///modules/openstack_upgrade/configs/neutron/newton/neutron.conf'
  }

  file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    source => 'puppet:///modules/openstack_upgrade/configs/neutron/newton/ml2_conf.ini'
  }

  exec { 'neutron_newton_db':
    command => "/bin/neutron-db-manage --config-file /etc/neutron/neutron.conf \
                --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head",
    user => "neutron"
  }
}

class { 'openstack_upgrade::neutron_api_newton': }
