class aria2::package {
  package {[
    'aria2',
  ]:
    ensure => $aria2::params::ensure,
  }
}
