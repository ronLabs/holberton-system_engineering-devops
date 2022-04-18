# puppet manifest to install puppt-lint package.

package { 'puppet-lint':
  ensure   => '2.5.0',
  provider => 'gem',
}
