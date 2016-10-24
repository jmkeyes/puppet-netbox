# = Class: netbox::database

class netbox::database {
  class { '::postgresql::globals':
    manage_package_repo => true,
    version             => '9.4'
  }

  class { '::postgresql::server': }
  class { '::postgresql::lib::devel': }
  class { '::postgresql::lib::python': }

  postgresql::server::db { $netbox::db_database:
    password => postgresql_password($::netbox::db_username, $::netbox::db_password),
    user     => $::netbox::db_username,
    grant    => 'all',
  }

}
