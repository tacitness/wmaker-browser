# AGENTS.md - wmaker-browser

This repository owns the managed browser companion for `wmaker-ng`: browser
profile/runtime packaging, policy control, ad-blocking defaults, semantic
extension integration, native messaging host installation, and CI/CD/RO gates.

## Operating Rules

- **Stay upstream-based first.** Prefer managed Firefox ESR and Chromium-family
  runtimes with policy/profile/extension injection. Do not fork a browser engine
  unless the M3 fallback criteria are explicitly met.
- **Compatibility is a product requirement.** LinkedIn, Facebook/Meta, X, Gmail,
  and other modern logged-in sites must remain usable. Avoid over-hardening that
  creates suspicious browser surfaces or breaks storage, workers, WebGL, WASM,
  cookies, IndexedDB, or localStorage.
- **Control belongs in owned layers.** Put `wmaker` behavior in policies,
  profile generation, launcher code, extension code, and native messaging
  hosts. Browser-source patches are last resort.
- **No secrets.** Profiles may contain templates and defaults, never live human
  sessions, cookies, OAuth tokens, API keys, or production credentials.
- **Reproducible by default.** Generated profiles and packages must be rebuildable
  from source-controlled templates and pinned upstream artifacts.
- **Gates before ready.** Run local gates before committing and before marking a
  PR ready.
- **Issue titles use milestone/epic notation.** New planning issues follow:
  `[M#][E#][category] short description`. Milestone epics may use `[M#][E#]`.
- **Labels and milestones are dispatch metadata.** Keep labels, milestones, and
  issue titles aligned with
  [docs/tsctl-label-milestone-standards.md](docs/tsctl-label-milestone-standards.md)
  so `tsctl` and human reviewers see the same work shape.

## Quality Gate

```bash
make pre-commit   # docs validation and repo hygiene checks
make pre-push     # currently aliases ci-local
make ci-local     # local parity with validate.yml
```

The gate starts small while this repo is scaffold-only. As code lands, expand it
to include shellcheck, Node tests for the extension, Rust or Go tests for native
host components if used, package dry-runs, and smoke tests against disposable
browser profiles. Third-party GitHub Actions must be pinned by commit SHA with a
version comment.

## Release Operations

Follow the repo pattern documented in [RELEASING.md](RELEASING.md):

- versions live in git tags
- CI/CD/RO uses build, test, package, release, and rollout gates
- signing/publish secrets come from infra-owned runtime sources, not repo files
- release readiness requires disposable profile smoke coverage
