# puppet manifest to install a package

exec { 'flask install':
  command  => 'pip3 install Flask==2.1.0',
  provider => 'shell',
}
