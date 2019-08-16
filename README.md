# iOS-Starter

![version](https://img.shields.io/badge/version-v0.0.1-green)

This is a template project for bootstrapping iOS applications.

> When Xcode 11 is released, this template will convert from CocoaPods to Swift Package Manager

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
  - other details
- `cookiecutter` will create all necessary files
- `XcodeGen` runs and automatically creates a `.xcodeproj` file
- Afterwards `pod install` will run to download all necessary dependencies
- Finally `Xcode` will launch your new project
- Happy Coding ! 🤓

## Included external libraries

- Handle asynchronous code
  - [PromiseKit](https://github.com/mxcl/PromiseKit) - Avoid the Callback Hell
- Code Style
  - [SwiftLint](https://www.github.com/realm/SwiftLint) - Common linting rules
- Helpers
  - [Rswift](https://github.com/mac-cain13/R.swift) - Type safe access to string resources
  - [SwiftDate](https://github.com/malcommac/SwiftDate) - Work with Dates is a breeze
  - [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager) - Handle common keyboard issues on iOS

## Structure

The structure of the template project tries to follow the idea in [this article](https://theswiftdev.com/2016/07/06/conventions-for-xcode/) from `The.Swift.Dev`

## Git Hooks

This template comes with a `.githooks` directory. Inside you can find and create hooks which will run in the local `.git` repository.

Available hooks:

- commit-msg (run before committing):
  - Verifies that the commit message follows the standard [Conventional Commits](https://www.conventionalcommits.org) specification (+ one additional commit type `ci`)
