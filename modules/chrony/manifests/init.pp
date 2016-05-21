class chrony {
  include chrony::install
  include chrony::config
  include chrony::service
}
