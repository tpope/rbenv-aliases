#!/usr/bin/env bats

load test_helper

@test "running rbenv-install auto installs an alias as 1.N.N" {

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

@test "running rbenv-install doesnt install 2.0 alias" {
  v=2.0.0
  run rbenv-install $v
  assert_success
  assert_line "Installed fake version $v"
  assert_alias_version $v $v
  assert_alias_missing 2.0
}

@test "running rbenv-install auto installs an alias for 2.1 from 2.1.1" {
  v=2.1.1
  run rbenv-install $v
  assert_success
  assert_line "Installed fake version $v"
  assert_alias_version 2.1 $v
}

@test "running rbenv-install auto installs an alias for 2.10 from 2.10.99" {
  v=2.10.99
  run rbenv-install $v
  assert_success
  assert_line "Installed fake version $v"
  assert_alias_version 2.10 $v
}

@test "running rbenv-install auto installs an alias for 2.99 and 2.99.99 from 2.99.99-p999" {
  v=2.99.99-p999
  run rbenv-install $v
  assert_success
  assert_line "Installed fake version $v"
  assert_alias_version 2.99 $v
  assert_alias_version 2.99.99 $v
}

