# Aliases for rbenv Ruby versions

Invoke `rbenv alias <name> <version>` to make a symbolic link from `<name>` to
`<version>` in the [rbenv][] versions directory, effectively creating an
alias.  The cool part is that if you pass in a point release as the name, you
can give `--auto` to link to the latest installed patch level.  For example,
`rbenv alias 1.8.7 --auto` will automatically create an alias from `1.8.7` to
`1.8.7-p371` (or whatever the most recent version you have installed is).

Plus, if you're using [ruby-build][], `rbenv install A.B.C-pXXX` automatically
invokes `rbenv alias A.B.C --auto`, so you'll always have up to date aliases
for point releases.

From ruby 2.1 onwards `rbenv alias A.B --auto` is also called by install.

Whether it's a good idea to use these aliases in a `.ruby-version` file, I
cannot say.  I created this plugin to find out.  If your only concern is
having to reinstall gems every time you install a new patch release, check out
[rbenv-communal-gems][].

[![Build Status](https://travis-ci.org/ianheggie/rbenv-aliases.png?branch=master)](https://travis-ci.org/ianheggie/rbenv-aliases)

## Usage

    rbenv alias <name> [<version> | --auto | --remove]
    rbenv alias --auto
    rbenv alias [--list]

    Symlink a short name to an exact version.  Passing a second argument of
    --auto selects the latest patch release of the given point version.  Passing
    a first argument of auto does the same for all installed point releases.

    rbenv unalias <alias> [<alias> ...]

    Remove one or more symlinks in the versions directory


## Installation

    mkdir -p ~/.rbenv/plugins
    git clone git://github.com/tpope/rbenv-aliases.git \
      ~/.rbenv/plugins/rbenv-aliases
    rbenv alias --auto

[rbenv]: https://github.com/sstephenson/rbenv
[ruby-build]: https://github.com/sstephenson/ruby-build
[rbenv-communal-gems]: https://github.com/tpope/rbenv-communal-gems
