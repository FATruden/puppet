define common::test (
  $test = 'test'
) {
  notify{"${name} - ${test}":}
}
