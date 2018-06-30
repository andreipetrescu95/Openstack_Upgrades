class Openstack_Upgrades::glance_ocata {
  package { 'openstack-glance':
    ensure => "latest"
  }

  package { 'python2-osprofiler':
    ensure => "latest"
  }

  package { 'python2-oslo-middleware':
    ensure => "latest"
  }

  file { "/etc/glance/glance-api.conf":
    mode => "0640",
    owner => 'glance',
    group => 'glance',
    source => 'puppet:///modules/Openstack_Upgrades/configs/glance/ocata/glance-api.conf'
  }

  file { "/etc/glance/glance-registry.conf":
    mode => "0640",
    owner => 'glance',
    group => 'glance',
    source => 'puppet:///modules/Openstack_Upgrades/configs/glance/ocata/glance-registry.conf'
  }

  exec { 'glance_ocata_db':
    command => "/bin/glance-manage db_sync",
    user => "glance"
  }
}

class { 'Openstack_Upgrades::glance_ocata': }
