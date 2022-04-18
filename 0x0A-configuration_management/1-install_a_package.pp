# puppet manifest to install puppt-lint package.

exec { 'apt-get update':
  command   => '/usr/bin/apt-get update'
}

package { 'puppet-lint':
  ensure   => '2.5.0',
  provider => 'gem',
}
