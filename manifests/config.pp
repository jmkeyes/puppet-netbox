# = Class: netbox::config

class netbox::config {
  file { "${::netbox::directory}/netbox/netbox/configuration.py":
    ensure  => 'present',
    content => template("${module_name}/configuration.py.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
