#!/usr/bin/env bats

load test_helper

@test "alias is listed in rbenv commands" {
  run rbenv-commands
  assert_success
  assert_line "alias"
}

@test "commands --sh should not list alias" {
  run rbenv-commands --sh
  assert_success
  refute_line "alias"
}

@test "commands --no-sh should list alias" {
  run rbenv-commands --no-sh
  assert_success
  assert_line "alias"
}

@test "unalias is listed in rbenv commands" {
  run rbenv-commands
  assert_success
  assert_line "unalias"
}

@test "commands --sh should not list unalias" {
  run rbenv-commands --sh
  assert_success
  refute_line "unalias"
}

@test "commands --no-sh should list unalias" {
  run rbenv-commands --no-sh
  assert_success
  assert_line "unalias"
}
