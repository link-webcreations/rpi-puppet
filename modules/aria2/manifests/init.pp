class aria2 (
  $ensure = $aria2::params::ensure,
) inherits aria2::params {
  include network::apache

  # ensure
  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  if $ensure == 'present' {
    class { 'aria2::package': } ->
    class { 'aria2::install': }
    service { 'aria2c':
      ensure     => true,
      hasstatus  => false,
      hasrestart => false,
      require    => Package['aria2'],
    }
  } else {
    class { 'aria2::package': }
  }
}
