# ZBK Datapacks

Implementation is not available yet.

## Responsibility

This repository will own the reusable Minecraft datapack runtime for Zombies Build Kit, including shared gameplay systems, common map lifecycle orchestration, and datapack installation output. Map-specific content such as Nacht and DE is outside this core-only foundation.

## Dependencies

The core datapack requires a matching ZBK base resource pack. Any structure dependencies remain to be audited during migration. It must load and run without map-specific add-ons, Manager, or the optional VR mod.

## Source and outputs

Hand-authored functions, configuration, maintained validation tools, and required generated runtime functions belong in source control. Packaged release archives, generated intermediates, and local tooling state are excluded. Blockbench authoring projects are excluded; required exported runtime models and animations may be retained after dependency review.
