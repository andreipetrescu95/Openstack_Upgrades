class openstack_upgrade::neutron_net_queens {
  package { 'openstack-neutron':
    ensure => "latest"
  }

  package { 'openstack-neutron-linuxbridge':
    ensure => "latest"
  }

  package { 'ebtables':
    ensure => "latest"
  }

  file { "/etc/neutron/neutron.conf":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    source => 'puppet:///modules/openstack_upgrade/configs/neutron/queens/gateway/neutron.conf'
  }

  file { "/etc/neutron/dhcp_agent.ini":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    source => 'puppet:///modules/openstack_upgrade/configs/neutron/queens/gateway/dhcp_agent.ini'
  }

  file { "/etc/neutron/l3_agent.ini":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    source => 'puppet:///modules/openstack_upgrade/configs/neutron/queens/gateway/l3_agent.ini'
  }

  file { "/etc/neutron/metadata_agent.ini":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    source => 'puppet:///modules/openstack_upgrade/configs/neutron/queens/gateway/metadata_agent.ini'
  }

  file { "/etc/neutron/plugins/ml2/linuxbridge_agent.ini":
    mode => "0640",
    owner => 'neutron',
    group => 'neutron',
    content => epp('openstack_upgrade/configs/neutron/queens/gateway/linuxbridge_agent.ini.epp')
  }
}

class { 'openstack_upgrade::neutron_net_queens': }
