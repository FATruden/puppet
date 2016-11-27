# define docker::run resource
# TODO
# - loging
# - not rm
define docker::run (
  $ensure = 'present',
  $image = undef,
  $depends_on = [],
  $volumes = [],
  $environment = [],
  $ports = [],
  $network_mode = undef,
  $extra_hosts = [],
  $extra_params = [],
  $command = undef,
  ) {
  include docker::params
  $service_prefix = $docker::params::service_prefix
  $docker_command = $docker::params::docker_command
  $default_flags  = $docker::params::default_flags

  if $image {}
  else {
    notify {'Image must be specified!': loglevel => err}
    fail('Image must be specified!')
  }

  if $network_mode {
    $run_network_mode = "--network=${network_mode}"
  }
  else {
    $run_network_mode = '--network=default'
  }

  if $command {
    $set_command = true
  }

  if ! empty($volumes) {
    $join_volumes = join($volumes, ' -v ')
    $run_volumes = "-v ${join_volumes}"
  }

  if ! empty($environment) {
    $join_environment = join($environment, ' -e ')
    $run_environment = "-e ${join_environment}"
  }

  if ! empty($ports) {
    $join_ports = join($ports, ' -p ')
    $run_ports = "-p ${join_ports}"
  }

  if ! empty($extra_hosts) {
    $join_extra_hosts = join($extra_hosts, ' --add-host ')
    $run_extra_hosts = "--add-host ${join_extra_hosts}"
  }

  if ! empty($extra_params) {
    $run_extra_params = $extra_params
  }

  if ! empty($depends_on) {
    $run_depends_on = prefix($depends_on, "${service_prefix}-")
  }

  $all_flags = concat($default_flags, $run_network_mode, $run_volumes, $run_environment, $run_ports, $run_extra_hosts, $run_extra_params)
  $all_flags_without_empty = delete($all_flags, '')
  $docker_run_flags = join($all_flags_without_empty, ' ')

  if ! empty($run_depends_on) {
    $service_require = [Service[$run_depends_on], Class['docker::systemd_daemon_reload']]
  }
  else {
    $service_require = Class['docker::systemd_daemon_reload']
  }

  case $ensure {
    'present': {
      $ensure_unit = 'present'
      $ensure_service = 'running'

      file { "/etc/systemd/system/${service_prefix}-${title}.service":
        ensure  => $ensure_unit,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('docker/etc/systemd/system/docker-run.erb'),
        notify  => [Class['docker::systemd_daemon_reload'], Service["${service_prefix}-${title}"]]
      }
      # TODO:
      # - enable for services to params
      service { "${service_prefix}-${title}":
        ensure  => $ensure_service,
        enable  => false,
        require => $service_require,
      }
    }
    'absent': {
      $ensure_unit = 'absent'
      $ensure_service = 'stopped'

      service { "${service_prefix}-${title}":
        ensure => $ensure_service,
        enable => false,
        notify => File["/etc/systemd/system/${service_prefix}-${title}.service"]
      }

      file { "/etc/systemd/system/${service_prefix}-${title}.service":
        ensure => $ensure_unit,
        notify => Class['docker::systemd_daemon_reload'],
      }
    }
    default: {
      fail("isn't correct 'ensure' flag!")
    }
  }
}
