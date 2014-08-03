class network::ftp::install {
   package { 'vsftpd': ensure => 'installed' }
}

class network::ftp::configure {
# Vsftpd service
  service { "vsftpd":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    require    => [
      Class['network::ftp::install'],
      File[ftpconf]
    ],
    subscribe => File[ftpconf]
  }

  # Config files for vsftpd
  file { '/etc/vsftpd.conf':
    require => Class['network::ftp::install'],
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source  => 'puppet:///modules/network/etc/vsftpd.conf',
    alias   => ftpconf
  }
}

class network::ftp {
  include network::ftp::install
  include network::ftp::configure
}
