# Barrier w3

Reusable placed barrier runtime.

Visible boards and repair prompts restore `view_range:0.5f` directly; hidden states retain zero. This respects the shared display cap without requiring repeated maintenance reads.

## Authoring ownership

Feature-specific editor functions and Build Manager handlers live inside the owning gameplay feature's `build_kit/` folder. The shared Build Manager only owns tool input, pending selection, and routing; each feature preserves its own dialog context and cleanup order.
