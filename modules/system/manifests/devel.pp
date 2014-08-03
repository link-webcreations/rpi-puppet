class system::devel {
  package {[
    'debconf-utils',
    'dh-make',
    'fakeroot',
    'packaging-dev',
    'pristine-tar',
  ]:
    ensure => present,
  }
}
