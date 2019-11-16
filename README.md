# iOS-Starter

![version](https://img.shields.io/badge/version-v0.4.0-green)

This is a template project for boostrapping iOS applications

## Prequisites

Install [cookiecutter](https://cookiecutter.readthedocs.io/en/latest/index.html),[XcodeGen](https://github.com/yonaskolb/XcodeGen) and [Mint](https://github.com/yonaskolb/Mint) in order to create a new project from this template:

```sh
brew install cookiecutter
brew install xcodegen
brew install mint
```

## Use it


```sh
cookiecutter https://github.com/alexanderwe/ios-starter.git
````

- `cookiecutter` will prompt you for:
  - The project name
  - Apple Developer Team details
  - other details necessary for the project
- `cookiecutter` will create all necessary files
- `XcodeGen` runs and automatically creates a `.xcodeproj` file
- Afterwards `mint bootstratp` will run to download all necessary build tools
- Finally `Xcode` will launch your new project
- All code dependencies are managed with the `Swift Package Manager`
- Happy Coding ! 

## Included external libraries

- Handle asynchronous code
  - [PromiseKit](https://github.com/mxcl/PromiseKit) - Avoid the Callback Hell
- Code Style
  - [SwiftLint](https://www.github.com/realm/SwiftLint) - Common linting rules
- Helpers
  - [Rswift](https://github.com/mac-cain13/R.swift) - Type safe access to string resources
  - [SwiftDate](https://github.com/malcommac/SwiftDate) - Work with Dates is a breeze
  - [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager) - Handle common keyboard use cases on iOS

## Structure

The structure of the template project tries to follow the idea in [this article](https://theswiftdev.com/2016/07/06/conventions-for-xcode/) from `The.Swift.Dev`

External dependencies are managed via `Swift Package Manager`. Therefore it is mandatory to use **Xcode 11**.

### External build tools

External build tools like `swiftlint` and `R.swift` are managed by `Mint` This is necessary because the `Swift Package Manager` is not handling binaries, and therefore `Mint` is doing this job for us.

## Git Hooks

> There is an issue with `GitKraken` not supporting the `config.hooksPath` option. Therefore every hook is copied from the `.githooks` directory to `.git/hooks`. Before that every file that will be changed inside `.git/hooks` is backed up.

This template comes with a `.githooks` directory. Inside you can find and create hooks which will run in the local `.git` repository.

### Available hooks:

- commit-msg (run before committing):
  - Verifies that the commit message follows the standard [Conventional Commits](https://www.conventionalcommits.org) specification

## Fastlane

The template uses [fastlane](https://fastlane.tools) for CI/CD. It comes with a nearly empty `Fastfile` which can be modified as you wish. 

### Included Actions

* `create_changelog`: Use `git-chglog` and your conventional commits to automatically create a `CHANGELOG.md` in the project directory
* `crowdin`: Use the `crowdin` CLI to upload or download your localisation files
