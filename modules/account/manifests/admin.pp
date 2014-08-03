class account::admin {
  # System admin
  include account::admin::root

  # Admins
  include account::admin::besancon
  include account::admin::andolfat
}
