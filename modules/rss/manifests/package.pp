class rss::package {
  package {[
    'php5-curl',
    'php5-sqlite',
    'php5',
  ]:
    ensure => $rss::params::ensure,
  }
}
