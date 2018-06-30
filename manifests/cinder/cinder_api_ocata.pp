class openstack_upgrade::cinder_api_ocata {
  package { 'openstack-cinder':
    ensure => "latest"
  }

  file { "/etc/cinder/cinder.conf":
    mode => "0640",
    owner => 'cinder',
    group => 'cinder',
    content => epp('openstack_upgrade/configs/cinder/ocata/cinder.conf.epp')
  }

  exec { 'cinder_ocata_db':
    command => "/bin/cinder-manage db sync",
    user => "cinder",
    unless => "/bin/ls /root/cinder-ocata-finished" 
  }
}

class { 'openstack_upgrade::cinder_api_ocata': }
