class openstack_upgrade::nova_comp_queens {
  package { 'openstack-nova-compute':
    ensure => "latest"
  }

  file { "/etc/nova/nova.conf":
    mode => "0640",
    owner => 'nova',
    group => 'nova',
    content => epp('openstack_upgrade/configs/nova/queens/compute/nova.conf.epp')
  }
}

class { 'openstack_upgrade::nova_comp_queens': }
