# CC-PKG Preset Repository

This is the default curated repository for CC-PKG presets and starter packages.

The repository contains consolidated, useful CC:Tweaked tools. Related commands are grouped into one package instead of creating a separate package for every tiny command.

Current catalog: **60 packages**.

```text
packages/
└── <package>/
    ├── package.json
    └── <package>.lua
```

Each package is indexed as version `1.0.0` and declares the supported CC:Tweaked device types.

The preset repository is automatically configured by CC-PKG as a built-in trusted repository, so users do not need to run `pkg repo add`.

All new tools should be useful, focused, compatible with CC:Tweaked, and tested before being added.
