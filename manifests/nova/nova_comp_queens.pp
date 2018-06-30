class Openstack_Upgrades::nova_comp_queens {
  package { 'openstack-nova-compute':
    ensure => "latest"
  }

  file { "/etc/nova/nova.conf":
    mode => "0640",
    owner => 'nova',
    group => 'nova',
    content => epp('Openstack_Upgrades/configs/nova/queens/compute/nova.conf.epp')
  }
}

class { 'Openstack_Upgrades::nova_comp_queens': }
