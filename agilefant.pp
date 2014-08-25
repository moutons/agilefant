node 'default' {  
#class { 'java':
#    distribution => 'jre',
#  }
  service { 'iptables':
    ensure => 'stopped',
  }
  include '::mysql::client'
  include '::mysql::server'
  mysql::db { 'mydb':
    user     => 'agilefant',
    password => 'agilefant',
    host     => 'localhost',
    grant    => ['ALL'],
  }
  class { 'apache':
    default_mods        => false,
    default_confd_files => false,
  }
  apache::vhost { 'agilefant.fqdn':
    docroot    => '/var/www/html',
    proxy_pass => [
      { 'path' =>  '/agilefant', 'url' => 'http://localhost:8080/agilefant' },
    ],
  }
  include tomcat
  tomcat::instance { 'agilefant':
    ensure    => present,
    http_port => '8080',
  }
}
