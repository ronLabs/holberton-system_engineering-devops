<<<<<<< HEAD
# ssh Client configuration file
file_line { 'ssh identity':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'IdentityFile ~/.ssh/holberton',
  multiple => false,
}
file_line { 'ssh PassAuth':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'PasswordAuthentication no',
  multiple => false,
}
file_line { 'ssh BatchMode':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'BatchMode no',
  multiple => false,
=======
# This manifests adds 2 lines to ssh_config file to configure a private key and deny password auth

file_line { 'Declare identity file':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '  IdentityFile ~/.ssh/school'
}

file_line { 'Turn off passwd auth':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '  PasswordAuthentication no'
>>>>>>> be4699dc4ebed6aa04d91449ac1406031fd524cb
}
