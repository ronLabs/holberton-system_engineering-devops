<<<<<<< HEAD
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
=======
# This manifest configures an nginx server

$defaultconfig = "# Default server configuration
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;
	index index.html index.htm;

	location /redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}

	error_page 404 /404.html;
	location =/404.html {
		root /var/www/html;
		internal;
	}
}
"

package { 'nginx':
  ensure  => 'installed',
}

file { 'Create default index.html':
  ensure  => 'present',
  name    => 'index.html',
  path    => '/var/www/html/index.html',
  content => "Hello World!\n"
}

file { 'Create default 404.html':
  ensure  => 'present',
  name    => '404.html',
  path    => '/var/www/html/404.html',
  content => "Ceci n'est pas une page\n"
}

file { 'Create nginx configuration file':
  ensure  => 'present',
  name    => 'default',
  path    => '/etc/nginx/sites-available/default',
  content => $defaultconfig
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx']
>>>>>>> be4699dc4ebed6aa04d91449ac1406031fd524cb
}
