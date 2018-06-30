class openstack_upgrade::neutron_comp_queens {
  package { 'openstack-neutron-openvswitch':
    ensure => "latest"
  }

  package { 'ebtables':
    ensure => "latest"
  }

  package { 'python2-pecan':
    ensure => "latest"
  }

  file { "/etc/neutron/plugins/ml2/openvswitch_agent.ini":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    content => epp('openstack_upgrade/configs/neutron/queens/compute/openvswitch_agent.ini.epp')
  }
}

class { 'openstack_upgrade::neutron_comp_queens': }
