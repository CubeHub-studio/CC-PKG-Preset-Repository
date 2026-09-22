# Contributing to CC-PKG Preset Repository

Thank you for helping improve the project! 🛠️

## Before contributing

Please:

1. Read the [Lunar Cubes License](LICENSE).
2. Read the [Code of Conduct](CODE_OF_CONDUCT.md).
3. Check existing issues and packages before creating something new.
4. Keep packages focused and useful.
5. Avoid duplicating functionality that already belongs in an existing package.

## Adding or modifying packages

Packages should:

- Have a clear purpose.
- Use the repository's package structure.
- Include a valid `package.json`.
- Use correct source paths such as `packages/<package>/<package>.lua`.
- Declare supported devices accurately.
- Avoid unnecessary dependencies.
- Fail gracefully when required peripherals, APIs, or device types are unavailable.
- Include useful help output where appropriate.

If functionality belongs to an existing tool category, prefer improving the existing package instead of creating another package with substantially overlapping functionality.

## Testing

Before submitting a change:

- Test the package in CC:Tweaked when possible.
- Test the normal command path and help output.
- Test expected missing-device or missing-peripheral cases.
- Verify that the package manifest and repository index agree.
- Check that source paths point to files that actually exist.

## Credits

If your contribution becomes part of the project, contributors should be credited appropriately.

The Lunar Cubes License requires published modified versions of the software to retain credits for known contributors who helped create, develop, improve, test, or maintain the software, as well as credit to Cubes Studio for creating the original version.

## Pull requests

Pull requests should explain:

- What changed.
- Why the change was made.
- Which packages were affected.
- How the change was tested.

Keep pull requests focused where practical so changes can be reviewed easily.

## Issues

When reporting a problem, include:

- The package or component involved.
- The CC:Tweaked and Minecraft version, when relevant.
- The command or steps that reproduce the problem.
- The error message or relevant output.
- Any relevant device or peripheral information.

Do not include private credentials, tokens, passwords, or other sensitive information.

## Code of Conduct

All contributions must follow the project's [Code of Conduct](CODE_OF_CONDUCT.md).
