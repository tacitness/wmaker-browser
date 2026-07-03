# Roadmap

## M1 - Managed Firefox Runtime

- Create the managed Firefox ESR profile generator.
- Add enterprise policy templates for extension installation and noise
  reduction.
- Package uBlock Origin or a compatible ad-blocking install path.
- Package the `wmaker-ng` browser extension and native messaging manifest.
- Add a launcher for deterministic profile/runtime selection.
- Add disposable smoke tests for profile creation, extension install, native
  host handshake, and representative logged-in-site compatibility.

## M2 - Tacit Browser Companion

- Promote the managed runtime into a first-class installable companion package.
- Add CI/CD/RO release gates and distro packaging.
- Add compatibility matrix coverage for Firefox ESR and a Chromium-family lane.
- Add lifecycle docs for profile creation, backup, rotation, and recovery.
- Add model-facing observability contracts shared with `wmaker-ng`.
- Add rule-management for ad-blocking and DOM cleanup when product needs exceed
  off-the-shelf defaults.

## M3 - Browser Fork Fallback

M3 remains stubbed until one of the fallback criteria in
[docs/phase-3-fallback.md](docs/phase-3-fallback.md) is met.

