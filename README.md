# wmaker-browser

Managed browser companion for `wmaker-ng`.

`wmaker-browser` packages a boring, compatible browser runtime that agents can
drive through `wmaker-ng`: managed profiles, policy-owned extension install,
native messaging bridge, ad-blocking defaults, and release gates that keep the
runtime reproducible.

The first target is Firefox ESR because it preserves strong WebExtension and
uBlock Origin support while staying compatible with modern logged-in social
sites. Chromium-family support is a planned compatibility lane, not the first
runtime.

## Product Shape

- `wmaker-browser-firefox`: Firefox ESR profile/runtime packaging.
- `wmaker-browser`: launcher that selects a managed profile/runtime.
- `wmaker-browser-extension`: semantic DOM/ARIA adapter for `wmaker-ng`.
- `wmaker-browser-host`: native messaging / local IPC bridge.
- `wmaker-browser-policy`: managed enterprise policies, prefs, and extension
  installation.

## Phases

- **M1: Managed Firefox runtime** - package the Firefox ESR profile, policy,
  uBlock Origin install lane, launcher, and smoke tests.
- **M2: Tacit browser companion** - own the integrated extension/native-host
  workflow, compatibility matrix, packaging, and CI/CD/RO gates.
- **M3: Browser fork fallback** - gated fallback only if managed upstream-based
  runtimes cannot provide required control, performance, or stability.

See [SDD.md](SDD.md), [ROADMAP.md](ROADMAP.md), and
[docs/ticket-standards.md](docs/ticket-standards.md).

## Local Gates

```bash
make pre-commit
make ci-local
```

