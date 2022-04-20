# puppet manifest to install puppt-lint package.

package { 'puppet-lint':
  ensure   => '2.1.0',
  provider => 'gem',
  source   => 'http://rubygems.org/',
}
