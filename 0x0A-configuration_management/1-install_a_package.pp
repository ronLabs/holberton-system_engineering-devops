<<<<<<< HEAD
# puppet manifest to install puppt-lint package.

exec { 'apt-get update':
  command   => '/usr/bin/apt-get update'
}

package { 'puppet-lint':
  ensure   => '2.5.0',
  provider => 'gem',
=======
# Using Puppet, install Flask from pip3.

exec { 'flask_install':
  command => 'pip3 install Flask==2.1.0',
  path    => '/usr/bin',
>>>>>>> be4699dc4ebed6aa04d91449ac1406031fd524cb
}
