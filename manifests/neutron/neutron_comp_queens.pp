class openstack_upgrade::neutron_comp_queens {
  package { 'openstack-neutron-linuxbridge':
    ensure => "latest"
  }

  package { 'ebtables':
    ensure => "latest"
  }

  package { 'python2-pecan':
    ensure => "latest"
  }

  file { "/etc/neutron/neutron.conf":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    source => 'puppet:///modules/openstack_upgrade/configs/neutron/queens/compute/neutron.conf'
  }

  file { "/etc/neutron/plugins/ml2/linuxbridge_agent.ini":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    content => epp('openstack_upgrade/configs/neutron/queens/compute/linuxbridge_agent.ini.epp')
  }
}

class { 'openstack_upgrade::neutron_comp_queens': }
