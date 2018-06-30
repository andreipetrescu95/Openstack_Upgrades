class openstack_upgrade::horizon_queens {
  package { 'openstack-dashboard':
    ensure => "latest"
  }

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
    source => 'puppet:///modules/openstack_upgrade/configs/horizon/queens/local_settings'
  }
}

class { 'openstack_upgrade::horizon_queens': }
