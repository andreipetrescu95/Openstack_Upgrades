class Openstack_Upgrades::nova_comp_mitaka {
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
    content => epp('Openstack_Upgrades/configs/nova/mitaka/compute/nova.conf.epp')
  }
}

class { 'Openstack_Upgrades::nova_comp_mitaka': }
