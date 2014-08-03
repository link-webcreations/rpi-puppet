class monitor::package {
  package {[
    'libfile-which-perl',
    'librrds-perl',
    'libhttp-daemon-perl',
    'libjson-perl',
    'libipc-sharelite-perl',
  ]:
    ensure => $monitor::params::ensure,
  }
}
