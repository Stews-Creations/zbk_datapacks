# Jump Pad

Owns reusable linked jump pads, purchases, movement arcs, runtime vehicles, and reset behavior. Persistent markers store the link and purchase configuration.

## Responsibility folders

| Folder | Responsibility |
| --- | --- |
| `movement/` | Arc positions, movement, and teleport steps |
| `lifecycle/` | Start, completion, expiry, vehicle cleanup, and reset |
| `display/` | Pad lamp state |
| `purchasing/`, `spawning/` | Purchase flow and marker placement |
| `build_kit/` | Settings, link-ID tools, dialogs, and Build Manager dispatch |
| `audio/`, `events/` | Callouts, purchase requests, and cue dispatch |

Keep movement and completion calls in their existing execution context. The purchase request can be blocked before payment and activation; marker settings remain authoritative when runtime state is rebuilt.
