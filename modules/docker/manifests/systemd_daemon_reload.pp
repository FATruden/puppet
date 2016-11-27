# force reload configuration of systemd units
class docker::systemd_daemon_reload {

  exec { 'systemd-daemon-reload':
    command     => 'systemctl daemon-reload',
    path        => ['/usr/bin/'],
    refreshonly => true,
  }
}
