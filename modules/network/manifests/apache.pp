class network::apache {
  $apache_confd = '/etc/apache2/conf.d'
  $mods         = '/etc/apache2/mods-available'

  File {
    owner => 'root',
    group => 'root',
  }

  package {
    'apache2': ensure => present;
    'libapache2-mod-wsgi': ensure => present;
    'libapache2-mod-php5': ensure => present;
  }

  file { '/var/www':
		ensure  => directory,
    require => Package['apache2'],
	}

  service { 'apache2':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['apache2'],
  }
}
