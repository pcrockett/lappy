## docker configuration

### garbage collection

as of 2026-06, docker's garbage collection config is an absolute mess:

- official documentation is either outdated or incorrect. examples:
  - ignore everything about `buildkitd.toml`; everything is configured in `daemon.json`
    now
  - documentation represents the `keepDuration` setting as both an array with a
    single string, or just a raw string. sometimes it appears both ways in the same
    [example config file](https://docs.docker.com/build/cache/garbage-collection/#docker-daemon-configuration-file).
- the code quality around GC config also seems to be pretty poor
  - `daemon.json` config has [parsing bugs](https://github.com/moby/moby/issues/46864)
    that make it impossible to represet filters correctly
  - `daemon.json` seems to be ignoring `keepDuration` settings altogether -- regardless
    of whether i use the array or bare string.

after spending WAY too much time (and AI tokens) trying to figure it out, i decided to
go with a very simple blunt GC config that will at least prevent docker from eating up
my entire disk. see [the config template](./daemon.json.template).
