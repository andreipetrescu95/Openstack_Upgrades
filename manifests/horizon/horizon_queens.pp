class Openstack_Upgrades::horizon_queens {
  package { 'openstack-dashboard':
    ensure => "latest"
  }

  # Little hack as it would not upgrade it.
  exec { 'angular-gettext':
    command => "/bin/yum install -y python2-XStatic-Angular-Gettext"
  }

  package { 'python2-django':
    ensure => "latest"
  }

  file { "/etc/openstack-dashboard/local_settings":
    mode => "0640",
    owner => 'root',
    group => 'apache',
    source => 'puppet:///modules/Openstack_Upgrades/configs/horizon/queens/local_settings'
  }
}

class { 'Openstack_Upgrades::horizon_queens': }
