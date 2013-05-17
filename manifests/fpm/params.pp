#
class php::fpm::params {
  $ensure = 'present'
  $log_level = 'notice'
  $emergency_restart_interval = '0'
  $emergency_restart_threshold = '0'
  $process_control_timeout = '0'
  $log_dir_mode = '0770'
  $log_group = false
  $log_owner = 'root'

  $php_fpm_package = $operatingsystem ? {
       /(?i-mx:ubuntu|debian)/        => 'php5-fpm',
       /(?i-mx:centos|fedora|redhat)/ => 'php-fpm',
     }
  $php_fpm_service = $operatingsystem ? {
       /(?i-mx:ubuntu|debian)/        => 'php5-fpm',
       /(?i-mx:centos|fedora|redhat)/ => 'php-fpm',
     }
  $php_fpm_pools = $operatingsystem ? {
       /(?i-mx:ubuntu|debian)/        => '/etc/php5/fpm/pool.d',
       /(?i-mx:centos|fedora|redhat)/ => '/etc/php-fpm.d',
     }
  $php_fpm_conf = $operatingsystem ? {
       /(?i-mx:ubuntu|debian)/        => '/etc/php5/fpm/php-fpm.conf',
       /(?i-mx:centos|fedora|redhat)/ => '/etc/php-fpm.conf',
     }
  $php_fpm_reload = $operatingsystem ? {
       /(?i-mx:ubuntu|debian)/        => '/usr/sbin/service php5-fpm reload',
       /(?i-mx:centos|fedora|redhat)/ => '/sbin/service php-fpm reload',
     }

}
