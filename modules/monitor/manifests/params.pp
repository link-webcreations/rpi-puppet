class monitor::params {
  # ensure
  $ensure   = 'present'
  $version  = '2.6-1'
  $deb_path = '/var/lib/raspberry/rpimonitor'
  $deb_name = "rpimonitor_${version}_all.deb"
  $debpkg   = "${deb_path}/${deb_name}"
}
