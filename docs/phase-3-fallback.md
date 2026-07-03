# Phase 3 Fallback Criteria

Phase 3 exists so the repo has a place for browser-fork planning, but it is not
the default path.

A browser fork, Chromium derivative, Gecko patch stack, or Brave-style runtime
should only start after at least one criterion is documented:

- Managed policies cannot provide a required product control.
- WebExtension/native messaging APIs cannot expose required semantics.
- Upstream browser behavior repeatedly breaks `wmaker-ng` automation in a way
  profile or extension layers cannot repair.
- Performance overhead from the managed runtime blocks the product target.
- Required ad-blocking or DOM-cleanup behavior cannot be delivered safely
  through extension/rule layers.
- Security/update cadence can be owned without increasing user risk.

The default answer before those criteria are met is: stay upstream-based.

