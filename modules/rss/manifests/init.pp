class rss (
  $ensure = $rss::params::ensure,
) inherits rss::params {
  include network::apache

  # ensure
  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  if $ensure == 'present' {
    class { 'rss::package': } ->
    class { 'rss::install': }
  } else {
    class { 'rss::package': }
  }
}
