class Openstack_Upgrades::cinder_api_ocata {
  package { 'openstack-cinder':
    ensure => "latest"
  }

  file { "/etc/cinder/cinder.conf":
    mode => "0640",
    owner => 'cinder',
    group => 'cinder',
    content => epp('Openstack_Upgrades/configs/cinder/ocata/cinder.conf.epp')
  }

  exec { 'cinder_ocata_db':
    command => "/bin/cinder-manage db sync",
    user => "cinder"
  }
}

class { 'Openstack_Upgrades::cinder_api_ocata': }
