define system::sudo::conf (
  $dest = $title,
  $ensure,
  $source,
) {
  require system::sudo
  
  $sudoers_dir = $system::sudo::sudoers_dir

  case $ensure {
    "present": {
      file { "${sudoers_dir}/${dest}":
        owner   => "root",
        group   => "root",
        mode    => 0440,
        source  => $source,
      }
    }
    "absent": {
      file { "${sudoers_dir}/${dest}":
        ensure => absent,
      }
    }
    default: {
      fail "Ensure value must be \"present\" or \"absent\" !"
    }
  }
}
