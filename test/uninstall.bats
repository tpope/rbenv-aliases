#!/usr/bin/env bats

load test_helper

@test "running rbenv-uninstall auto removes the alias" {
  create_versions 1.9.3-p123
  create_alias 1.9.3 1.9.3-p123

  run rbenv-uninstall 1.9.3-p123

  assert_success
  assert_line 'Uninstalled fake version 1.9.3-p123'
  assert_line_starts_with 'Removing invalid link from 1.9.3'
  assert [ ! -L "$RBENV_ROOT/versions/1.9.3" ]
}

@test "running rbenv-uninstall auto updates the alias to highest remaining version" {
  create_versions 1.9.3-p123 1.9.3-p456
  create_alias 1.9.3 1.9.3-p456

  run rbenv-uninstall 1.9.3-p456

  assert_success
  assert_line 'Uninstalled fake version 1.9.3-p456'
  assert_line_starts_with 'Removing invalid link from 1.9.3'
  assert_line '1.9.3 => 1.9.3-p123'
  assert_alias_version 1.9.3 1.9.3-p123
}

@test "running rbenv-uninstall auto updates the alias to highest remaining version, handling multi-segment patches" {
  create_versions 1.9.3-p123 1.9.3-p456-perf
  create_alias 1.9.3 1.9.3-p456-perf
  create_alias 1.9.3-p456 1.9.3-p456-perf

  run rbenv-uninstall 1.9.3-p456-perf

  assert_success
  assert_line 'Uninstalled fake version 1.9.3-p456-perf'
  assert_line_starts_with 'Removing invalid link from 1.9.3 '
  assert_line_starts_with 'Removing invalid link from 1.9.3-p456'
  assert_line '1.9.3 => 1.9.3-p123'
  assert_alias_version 1.9.3 1.9.3-p123
}
