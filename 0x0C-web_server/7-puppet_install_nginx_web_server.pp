# Install Nginx web server with puppet instead of bash
# There are 2 options for this task
# First can be a exec Puppet like this:
#
# exec { 'installNginx':
#   command  =>  'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Holberton School" > /var/www/html/index.nginx-debian.html ;  sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4 permanent;/" /etc/nginx/sites-available/default ; sudo service nginx start',
#   provider =>  shell,
# }
#
# or can be like this method:
package { 'nginx':
  ensure  => installed,
  name    => 'nginx',
}

file { '/var/www/html/index.html':
  path    => '/var/www/html/index.html',
  content => 'Holberton School',
}

file_line { 'title':
  ensure   => present,
  path     => '/etc/nginx/sites-available/default',
  after    => 'server_name _;',
  line     => 'rewrite ^/redirect_me https://www.holbertonschool.co permanent;',
  multiple => true
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
