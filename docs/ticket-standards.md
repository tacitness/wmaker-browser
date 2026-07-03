# Ticket Standards

`wmaker-browser` uses milestone/epic notation in issue titles:

```text
[M#][E#][category] short description
```

Examples:

```text
[M1][E1][sdd] Managed browser runtime charter
[M1][E2][firefox] Generate managed Firefox ESR profile
[M2][E5][ci-cd-ro] Add package and release gates
```

## Rules

- `M#` maps to the GitHub milestone number in this repo.
- `E#` maps to a planning epic within the milestone.
- `category` is short, lowercase, and useful for scanning.
- Epics use the same format and carry the `epic` label.
- Child issues link back to their epic in the body.
- Phase 3 issues stay as stubs until fallback criteria are met.

This convention is intentionally repo-local first. Org-wide adoption belongs in
`tacitness/dagobah-infra`.

