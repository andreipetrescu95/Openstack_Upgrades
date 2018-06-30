class openstack_upgrade::nova_comp_mitaka {
  package { 'python2-os-brick':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  package { 'openstack-nova-compute':
    ensure => "latest",
    install_options => "--nogpgcheck"
  }

  file { "/etc/nova/nova.conf":
    mode => "0640",
    owner => 'nova',
    group => 'nova',
    content => epp('openstack_upgrade/configs/nova/mitaka/compute/nova.conf.epp')
  }
}

class { 'openstack_upgrade::nova_comp_mitaka': }
