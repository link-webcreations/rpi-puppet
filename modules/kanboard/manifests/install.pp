class kanboard::install {
  # Defaults
  Exec {
    path      => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin',
    user      => 'root',
    group     => 'root',
    logoutput => 'on_failure',
  }

  # Clone the repository
  exec { "Clone kanboard repository":
    creates => "${kanboard::params::installdir}",
    command => "git clone ${kanboard::params::repository} ${kanboard::params::installdir}",
  }

  # Setup Apache Kanboard site
  network::apache::install_site { "kanboard":
    ensure  => $kanboard::params::ensure,
    target  => "kanboard",
    source  => "kanboard/apache2/kanboard.conf",
  }
}
