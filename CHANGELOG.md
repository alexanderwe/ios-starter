# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2020-12-06

### Added

* `tuist` - Offers to configure your project in Swift which is pretty nice. Therefore this template uses `tuist` now 
* `swiftformat` - Rationale explained in "Removed" section

### Removed
* `R.swift` - After thinking about it, adding a library that generates type safe assets was too opinionated for a template project, therefore I removed it 
* `SwiftLint` - `SwiftLint` was removed in favour of `swiftformat` as it offers pretty much the same functionality than `SwiftLint` but it could potentially also format source code

## [0.5.1] - 2020-05-12

### Fixed

- Fixed import issue on LoggingKit and log category keypaths

## [0.5.0] - 2020-05-06

This release removes several files which were a little bit too opinionated. So for example I removed the protocols which were tailored to use the coordinator pattern. I think it's better to keep a template open for every kind of architectural pattern.
Additionally I removed third party dependencies which I personally don't use anymore and I also think they were too opinionated as well.

### Added

- Separate test target for the `Kit` module
- [LoggingKit](https://github.com/alexanderwe/LoggingKit) micro framework

### Changed

- More detailed README
- Updated dependencies

### Removed

- Several external libraries
  - PromiseKit
  - SwiftDate
  - IQKeyboardManager
- Protocols
- Label views

## [0.4.0] - 2019-11-16

### Added

- Add Fastlane
- Add Mint for build tool dependencies

### Changed:

- Switch to Swift Package Manager and therefore Xcode 11
- Add support for SceneDelegate on iOS 13 and additionally SwiftUI
- Different build configurations

## [0.0.1] - 2019-08-16

### Added

- External libraries
  - SwiftLint
  - R.Swift
  - SwiftDate
  - IQKeyboardManager
  - PromiseKit
- Internals
  - Utilities
  - Logging
  - Localisation
  - UserDefaults

### Fixed

- Errors in `project.yml` which lead to incorrect configured Xcode projects

[unreleased]: https://github.com/alexanderwe/ios-starter/compare/v1.0.0...HEAD
[0.0.1]: https://github.com/alexanderwe/ios-starter/releases/tag/v0.0.1
[0.5.0]: https://github.com/alexanderwe/ios-starter/releases/tag/v0.5.0
[0.5.1]: https://github.com/alexanderwe/ios-starter/releases/tag/v0.5.1
[1.0.0]: https://github.com/alexanderwe/ios-starter/releases/tag/v1.0.0

<!-- keywords to be used


### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

-->
