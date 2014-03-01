#!/usr/bin/env bats

load test_helper

@test "rbenv-alias 1.8.7 --auto" {
  create_versions 1.8.7-p371
  create_versions 1.8.7-p99
  create_versions 1.8.7-p100

  run rbenv-alias 1.8.7 --auto
  assert_success
  assert_alias_version 1.8.7 1.8.7-p371
}

@test "rbenv-alias name 1.8.7-p100" {
  create_versions 1.8.7-p371
  create_versions 1.8.7-p99
  create_versions 1.8.7-p100

  run rbenv-alias name 1.8.7-p100
  assert_success
  assert_alias_version name 1.8.7-p100
}

@test "rbenv-alias --auto" {
  create_versions 1.8.7-p371
  create_versions 1.8.7-p99
  create_versions 1.8.7-p100

  create_versions 1.2.3-p99-perf
  create_versions 1.2.3-p234-beta
  create_versions 1.2.3-p1-perf

  run rbenv-alias --auto
  assert_success
  assert_alias_version 1.8.7 1.8.7-p371
  assert_alias_version 1.2.3 1.2.3-p234-beta

}

@test "rbenv-alias 2.1 --auto for 2.1.0" {
  create_versions 2.1.0

  run rbenv-alias 2.1 --auto
  assert_success
  assert_alias_version 2.1 2.1.0
}

@test "rbenv-alias 2.1 --auto for 2.1.0 and 2.1.0-p2" {
  create_versions 2.1.0
  create_versions 2.1.0-p2

  run rbenv-alias 2.1 --auto
  assert_success
  assert_alias_version 2.1 2.1.0-p2
}

@test "rbenv-alias 2.2 --auto" {
  create_versions 2.2.3-p123

  run rbenv-alias 2.2 --auto
  assert_success
  assert_alias_version 2.2 2.2.3-p123
}

@test "rbenv-alias --auto for 2.1.N versions" {
  create_versions 2.1.0
  create_versions 2.1.2
  create_versions 2.1.10
  create_versions 2.2.1-p123

  run rbenv-alias --auto
  assert_success
  assert_alias_version 2.1 2.1.10
  assert_alias_version 2.2 2.2.1-p123
  assert_alias_version 2.2.1 2.2.1-p123
}
