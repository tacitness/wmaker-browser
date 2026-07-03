# tsctl Label and Milestone Standards

This repo treats GitHub issue metadata as dispatch metadata. Human planning,
`tsctl` routing, and agent execution should all see the same work shape.

## Milestones

- `M1: Managed Firefox runtime`
- `M2: Tacit browser companion`
- `M3: Browser fork fallback`

Milestone numbers map directly to the issue title prefix:

```text
[M1] -> M1: Managed Firefox runtime
[M2] -> M2: Tacit browser companion
[M3] -> M3: Browser fork fallback
```

## Epics

Epic numbers are local to this repo and appear in the title:

```text
[M1][E2][firefox] Managed Firefox ESR profile and policy epic
```

Child issues reuse their parent epic number:

```text
[M1][E2][firefox] Build profile generator
```

## Required Label Shape

- Phase label: `phase-1`, `phase-2`, or `phase-3`
- Priority label: `p1` or `p2`
- Domain label: one or more of `firefox`, `chromium`, `extension`,
  `native-host`, `adblock`, `compatibility`, `packaging`, `security`,
  `ci-cd-ro`, or `sdd`
- Epic label: `epic` only for parent planning issues

## Dispatch Notes

- M1 issues are implementation-ready unless blocked in the issue body.
- M2 issues are planned default-priority work after M1 proves the runtime.
- M3 issues are stubs and must not be dispatched until fallback criteria are
  met and linked from a concrete M1/M2 blocker.
- Issue bodies should include `Child of #N` for child work.

