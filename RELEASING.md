# Releasing

`wmaker-browser` follows the Tacitness CI/CD/RO house pattern.

## Versioning

Versions live in git tags. Do not store release versions in source templates
unless a downstream package format requires generated metadata at build time.

## Gates

1. **validate** - docs, static checks, extension tests, native-host tests, and
   secret scanning.
2. **package** - profile bundle, browser policy bundle, extension artifact,
   native-host artifact, distro packages, and static archive.
3. **smoke** - disposable profile launch, extension load, native messaging
   handshake, ad-blocking install verification, and compatibility probes.
4. **release** - signed artifacts, checksums, package repository publication,
   and GitHub Release.
5. **rollout** - install smoke against supported targets and rollback notes.

## Secret Handling

No signing keys, browser sessions, profile secrets, or deployment credentials
belong in this repo. CI/CD/RO must retrieve secrets from infra-owned runtime
storage.

## Initial Channels

- Static tarball for early testing.
- Debian/RPM packages once the runtime layout stabilizes.
- Additional channels only after M1 smoke coverage is useful.

