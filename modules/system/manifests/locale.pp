class system::locale {
  package { 'locales':
    ensure  => present,
  }
  file { '/etc/default/locale':
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('system/locale.erb'),
    require => Package['locales'],
  }
}
