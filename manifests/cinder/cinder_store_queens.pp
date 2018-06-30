class Openstack_Upgrades::cinder_store_queens {
  package { 'lvm2':
    ensure => "latest"
  }

  package { 'device-mapper-persistent-data':
    ensure => "latest"
  }

  package { 'openstack-cinder':
    ensure => "latest"
  }

  package { 'targetcli':
    ensure => "latest"
  }

  package { 'python-keystone':
    ensure => "latest"
  }

  file { "/etc/cinder/cinder.conf":
    mode => "0640",
    owner => 'cinder',
    group => 'cinder',
    content => epp('Openstack_Upgrades/configs/cinder/queens/storage/cinder.conf.epp')
  }
}

class { 'Openstack_Upgrades::cinder_store_queens': }
