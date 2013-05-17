# Class: php::fpm::daemon
#
# Install the PHP FPM daemon. See php::fpm::conf for configuring its pools.
#
# Sample Usage:
#  include php::fpm::daemon
#
class php::fpm::daemon (
  $ensure                       = $php::fpm::params::ensure,
  $log_level                    = $php::fpm::params::log_level,
  $emergency_restart_threshold  = $php::fpm::params::emergency_restart_threshold,
  $emergency_restart_interval   = $php::fpm::params::emergency_restart_interval,
  $process_control_timeout      = $php::fpm::params::process_control_timeout,
  $log_owner                    = $php::fpm::params::log_owner,
  $log_group                    = $php::fpm::params::log_group,
  $log_dir_mode                 = $php::fpm::params::log_dir_mode,
  $php_fpm_package              = $php::fpm::params::php_fpm_package,
  $php_fpm_conf                 = $php::fpm::params::php_fpm_conf,
  $php_fpm_pools                = $php::fpm::params::php_fpm_pools,
  $php_fpm_reload               = $php::fpm::params::php_fpm_reload,
  $fpm_pools                    = []
) inherits php::fpm::params {

  # Hack-ish to default to user for group too
  $log_group_final = $log_group ? {
    false   => $log_owner,
    default => $log_group,
  }

  if ( $ensure == 'absent' ) {

    package { $php_fpm_package : ensure => absent }

  } else {

    package { $php_fpm_package : ensure => installed }

    service { $php_fpm_service :
      ensure    => running,
      enable    => true,
      restart   => $php_fpm_reload,
      hasstatus => true,
      require   => Package[$php_fpm_package],
    }

    file { '/var/run/php-fpm':
      ensure  => directory,
    }

    # When running FastCGI, we don't always use the same user
    file { '/var/log/php-fpm':
      ensure  => directory,
      owner   => $log_owner,
      group   => $log_group_final,
      mode    => $log_dir_mode,
      require => Package[$php_fpm_package],
    }

    file { $php_fpm_conf :
      notify  => Service[$php_fpm_service],
      content => template('php/fpm/php-fpm.conf.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => 0644,
    }

    create_resources(php::fpm::conf,$fpm_pools)

  }

}

