class system::motd {
  file { '/etc/motd.tail':
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content => template('system/motd.tail.erb'),
  }
}
