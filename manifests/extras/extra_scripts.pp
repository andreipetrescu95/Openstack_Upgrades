class Openstack_Upgrades::extra_scripts {
  file { '/bin/create_cell0':
    mode => "0750",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/Openstack_Upgrades/scripts/create_cell0.sh'
  }

  file { '/bin/create_placement_endpoints':
    mode => "0750",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/Openstack_Upgrades/scripts/create_placement_endpoints.sh'
  }

  file { '/bin/create_volumev3_endpoints':
    mode => "0750",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/Openstack_Upgrades/scripts/create_volumev3_endpoints.sh'
  }

  file { '/bin/endpoint_set':
    mode => "0750",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/Openstack_Upgrades/scripts/endpoint_set.sh'
  }
}

class { 'Openstack_Upgrades::extra_scripts': }
