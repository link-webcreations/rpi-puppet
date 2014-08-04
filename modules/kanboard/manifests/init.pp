class kanboard (
  $ensure = $kanboard::params::ensure,
) inherits kanboard::params {
  include network::apache

  # ensure
  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  class { 'kanboard::install': }
}
