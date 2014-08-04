class rss::install {
  # Defaults
  Exec {
    path      => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin',
    user      => 'root',
    group     => 'root',
    logoutput => 'on_failure',
  }

  # Clone the repository
  exec { "Clone miniflux repository":
    creates => "${rss::params::installdir}",
    command => "git clone ${rss::params::repository} ${rss::params::installdir}",
  }

  # Setup Apache Miniflux site
  network::apache::mod { 'headers': ensure => present }
  network::apache::mod { 'rewrite': ensure => present }
  network::apache::install_site { "miniflux":
    ensure  => $rss::params::ensure,
    target  => "miniflux",
    source  => "rss/apache2/miniflux.conf",
  }

  # Setup cron job
  file { '/etc/cron.d/miniflux':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/rss/cron/miniflux',
    require => Exec['Clone miniflux repository'],
  }
}
