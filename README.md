# CC-PKG Preset Repository

This is the default curated repository for CC-PKG presets and starter packages.

The repository follows the CC-PKG multi-package format:

```text
packages/
└── <package>/
    ├── package.json
    └── versions/
        └── <version>/
            ├── devicedata
            └── package.json
```

Packages should be useful, small, documented, and tested on the device types listed in their `devicedata`.

CC-PKG adds this repository automatically as a built-in repository. Users do not need to run `pkg repo add` for it.
