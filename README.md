# iOS-Starter

This is a template project for boostrapping iOS applications.

## Prequisites

Install [cookiecutter](https://cookiecutter.readthedocs.io/en/latest/index.html) and [XcodeGen](https://github.com/yonaskolb/XcodeGen) in order to create a new project from this template:

```sh
brew install cookiecutter
brew install xcodegen
```

## Steps

- Run `cookiecutter https://github.com/alexanderwe/ios-starter.git`
- `cookiecutter` will prompt you for:
  - The project name
  - Apple Developer Team details
  - etc.
- `cookiecutter` will create all necessary files
- `XcodeGen` will now run automatically creating a `.xcodeproj` file
- Afterwards `pod install` will run to download all necessary dependencies
- Finally `Xcode` will launch your new project
- Happy Coding ! 🤓

## Included libraries

- [SwfitLint](https://www.github.com/realm/SwiftLint) - Common linting rules
- [Rswft](https://github.com/mac-cain13/R.swift) - Type safe access to string resources
