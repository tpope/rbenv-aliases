#!/usr/bin/env bats

load test_helper

@test "running rbenv-install auto installs an alias" {

  run rbenv-install 1.9.3-p123
  assert_success
  assert_line 'Installed fake version 1.9.3-p123'
  assert_line '1.9.3 => 1.9.3-p123'

  assert_alias_version 1.9.3 1.9.3-p123

  run rbenv-install 1.9.3-p99
  assert_success
  assert_alias_version 1.9.3 1.9.3-p123
  assert_line 'Installed fake version 1.9.3-p99'

  run rbenv-install 1.9.3-p200
  assert_success
  assert_alias_version 1.9.3 1.9.3-p200
  assert_line 'Installed fake version 1.9.3-p200'
  assert_line '1.9.3 => 1.9.3-p200'

}

