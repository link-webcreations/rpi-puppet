class monitor (
  $ensure   = $monitor::params::ensure,
  $version  = $monitor::params::version,
  $deb_path = $monitor::params::deb_path,
  $deb_name = $monitor::params::deb_name,
  $debpkg   = $monitor::params::debpkg,
) inherits monitor::params {

  # ensure
  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  file { $deb_path:
    ensure => directory
  }

  if $ensure == 'present' {
    class { 'monitor::package': } ->
    class { 'monitor::install': }
    service { 'rpimonitor':
      ensure     => true,
      hasstatus  => true,
      hasrestart => true,
      require    => Package['rpimonitor'],
    }
  } else {
    class { 'monitor::package': }
  }
}
