# Contributing packages

1. Create a package under `packages/<name>/`.
2. Add package-level `package.json`.
3. Add one or more version directories under `versions/`.
4. Put a `devicedata` file in every version directory.
5. Put the version's `package.json` in that same directory.
6. Add the package and versions to `index.json`.
7. Test with `pkg test <package>` before publishing.

Use exact device identifiers:

- `computer`
- `advanced_computer`
- `pocket_computer`
- `advanced_pocket_computer`
- `noisy_pocket_computer`

Do not publish code that intentionally damages files, bypasses security controls, steals credentials, or abuses network/peripheral access.
