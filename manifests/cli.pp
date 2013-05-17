# Class: php::cli
#
# Command Line Interface PHP. Useful for console scripts, cron jobs etc.
# To customize the behavior of the php binary, see php::ini.
#
# Sample Usage:
#  include php::cli
#
class php::cli (
  $php_cli_packgae  = $php::params::php_cli_packgae,
  $inifile          = $php::params::php_ini_file
) inherits php::params {

  package { $php_cli_packgae :
    ensure  => installed,
    require => File[$inifile],
  }

}

