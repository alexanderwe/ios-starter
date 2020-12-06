# iOS-Starter

![version](https://img.shields.io/badge/version-v1.0.0-green)

This is a template project for boostrapping iOS applications

## Prequisites

Install [cookiecutter](https://cookiecutter.readthedocs.io/en/latest/index.html),[tuist](https://github.com/tuist/tuist) and [Mint](https://github.com/yonaskolb/Mint) in order to create a new project from this template:

```sh
brew install cookiecutter
bash <(curl -Ls https://install.tuist.io)
brew install mint
```

## Use it

```sh
cookiecutter https://github.com/alexanderwe/ios-starter.git
```

- `cookiecutter` will prompt you for:
  - The project name
  - Apple Developer Team details
  - other details necessary for the project
- `cookiecutter` will create all necessary files
- `tuist` runs and automatically creates a `.xcodeproj` file
- Afterwards `mint bootstratp` will run to download all necessary build tools
- Finally `Xcode` will launch your new project
- All code dependencies are managed with the `Swift Package Manager`
- Happy Coding !

## Included external libraries

- Logging Helper
  - [LoggingKit](https://github.com/alexanderwe/LoggingKit) - A small micro-framework for logging
- Code Style
  - [swiftformat](https://github.com/nicklockwood/SwiftFormat) - Format and lint your source code


## Structure

The structure of the template project tries to follow the idea of having a directory for each of your target. In each of these targets you can find it sources and the corresponding tests. 

External dependencies are managed via `Swift Package Manager`. Therefore it is mandatory to use **Xcode 11**.

### External build tools

External build tools like `swiftformat` are managed by `Mint`.

### Modules

The project is divided into several modules:

- `iOS` - Contains UI code, navigation flows, views if used for SwiftUI or view controllers when UIKit is used
- `Tests iOS` - Unit tests for the iOS application
- `UI Tests iOS` - UI tests for the iOS application
- `<ProjectName>Kit` - Source files for your service layer or generally speaking files that could be reused for example for an macOS or watchOS target
- `<ProjectName>Kit Tests` - Unit test for the `<ProjectName>Kit` target

### Schemes

In general each target has its own scheme but the `iOS` target has three:

- development
- staging
- production

Each scheme is used in combination with the files located in `Targets/iOS/SupportingFiles/Config`. There you can find four different files. Three for each scheme and one which contains the values for the active configuration. Each scheme has a `pre-build` action which copies the content from one of "release type" configs to `Configuration.xcconfig` which is then used when the app is running.

So for example if you are running the `iOS Applcation staging` scheme, the content of the `Staging.xcconfig` file is copied over to `Configuration.xcconfig` and can then be used within the app.

Currently this mechanism is used to change the app identifier and set some environment variable. This can be extended to for example use different backend urls for different schemes.

If you want to access one of the variables you declare inside the `.xcconfig` files you need to make them accessible to the app by putting them into the `Derived/InfoPlists/<Info.plist file for iOS target>` file. As an example you can have a look at the `_ServerEnvironment` variable which is later accessed within the `ViewController`.

#### External configuration files

The mechanism described above can also be used for external configuration files. For example if you have a different `GoogleService-Info.plist` for different builds of your app. Then you can create four different files:

- GoogleService-Info.development.plist
- GoogleService-Info.staging.plist
- GoogleService-Info.production.plist
- GoogleService-Info.plist

Inside the `pre-build` actions for the different schemes you copy the content of the corresponding file to `GoogleService-Info.plist` which is then used by your Google frameworks in the app. Such an `pre-build` command could like like the following.

```sh
cp -f "${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Firebase/GoogleService-Info.development.plist" "${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Firebase/GoogleService-Info.plist"
```

### UIKit or SwiftUI

The projects default UI framework is UIKit. But you can easily opt out and use SwiftUI instead. There is no strict rule to use one or the other.

## Git Hooks

> There is an issue with `GitKraken` not supporting the `config.hooksPath` option. Therefore every hook is copied from the `.githooks` directory to `.git/hooks`. Before that every file that will be changed inside `.git/hooks` is backed up.

This template comes with a `.githooks` directory. Inside you can find and create hooks which will run in the local `.git` repository.

### Available hooks:

- commit-msg (run before committing):
  - Verifies that the commit message follows the standard [Conventional Commits](https://www.conventionalcommits.org) specification

## Fastlane

The template uses [fastlane](https://fastlane.tools) for CI/CD. It comes with a nearly empty `Fastfile` which can be modified as you wish.
Be sure to run `bundle install` first and then execute fastlane through `bundle exec`.

```sh
bundle exec fastlane tests
```

### Included Actions

- `create_changelog`: Use `git-chglog` and your conventional commits to automatically create a `CHANGELOG.md` in the project directory. `git-chglog` uses the template located in `.chglog`
- `crowdin`: Use the `crowdin` CLI to upload or download your localisation files
