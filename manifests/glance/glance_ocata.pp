class openstack_upgrade::glance_ocata {
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
    source => 'puppet:///modules/openstack_upgrade/configs/glance/ocata/glance-api.conf'
  }

  file { "/etc/glance/glance-registry.conf":
    mode => "0640",
    owner => 'glance',
    group => 'glance',
    source => 'puppet:///modules/openstack_upgrade/configs/glance/ocata/glance-registry.conf'
  }

  exec { 'glance_ocata_db':
    command => "/bin/glance-manage db_sync",
    user => "glance"
  }
}

class { 'openstack_upgrade::glance_ocata': }
