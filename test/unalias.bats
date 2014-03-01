#!/usr/bin/env bats

load test_helper

@test "running unalias removes an alias" {

  create_versions 1.8.7-p100
  run rbenv-alias 1.8.7 --auto
  assert_success

  run rbenv-unalias 1.8.7
  assert_success
  assert_alias_missing 1.8.7

}
