# System Design Document: wmaker-browser

## Purpose

`wmaker-browser` provides an infra-managed browser runtime for agent-driven web
work. It gives `wmaker-ng` a controlled, observable, logged-in browser surface
without turning the first implementation into a permanent browser-engine fork.

## Goals

- Package a managed Firefox ESR runtime profile that a human can log into and
  `wmaker-ng` can drive.
- Install and manage an ad blocker without depending on fragile manual setup.
- Install the `wmaker-ng` semantic browser extension and native messaging host.
- Preserve ordinary web compatibility for social and productivity sites.
- Provide repeatable CI/CD/RO gates for build, validation, packaging, signing,
  release, and rollout.
- Keep a Chromium-family compatibility lane available after Firefox is useful.

## Non-Goals

- Forking Gecko, Chromium, or Brave in Phase 1 or Phase 2.
- Storing live browser profiles, cookies, tokens, passwords, or human sessions.
- Building a stealth or anti-detection browser.
- Replacing `wmaker-ng`; this repo is a companion runtime.

## Architecture

```text
wmaker-ng / ai-mcp
  |
  | local IPC / native messaging
  v
wmaker-browser-host
  |
  v
wmaker-browser-extension
  |
  v
managed browser runtime
  |
  +-- generated profile
  +-- managed policies
  +-- ad-blocking extension/rules
  +-- compatibility smoke fixtures
```

## Runtime Strategy

Phase 1 uses Firefox ESR because it keeps full WebExtension support and strong
uBlock Origin compatibility. Profiles should look normal enough for mainstream
logged-in sites: storage, cookies, WebGL, WASM, workers, and media stay enabled
unless a ticket proves a narrower setting is safe.

Phase 2 turns the managed runtime into a first-class companion product with
installers, package channels, disposable smoke tests, and a documented operating
model.

Phase 3 is a fallback only. A browser fork is justified when the managed runtime
cannot satisfy a documented requirement such as mandatory extension control,
policy limits, performance ceilings, or an upstream behavior that blocks the
product.

## Security Model

- Generated profile templates are safe to commit.
- Live profiles are local runtime state and must be ignored by git.
- Native messaging host manifests must point to repo-packaged binaries or
  wrappers with owner-controlled permissions.
- Ad-blocking lists and extension artifacts must be pinned or checksummed when
  packaged.
- Release signing keys are retrieved by CI/CD/RO at runtime through infra-owned
  secret storage.

## CI/CD/RO Gate Shape

- `validate`: formatting, static checks, extension tests, native-host tests.
- `package`: build profile bundles, native host, extension artifacts, and OS
  packages.
- `smoke`: launch disposable profile, verify extension/native host handshake,
  verify ad blocker install, run compatibility probes.
- `release`: tag-driven artifacts, signed packages, checksums, GitHub Release.
- `rollout`: repo publication, install smoke on supported distros, rollback
  notes.

