import ProjectDescription
//import ProjectDescriptionHelpers

let project = Project.init(
    name: "{{cookiecutter.projectName}}",
    organizationName: "{{cookiecutter.teamName}}",
    packages: [
        .package(url: "https://github.com/alexanderwe/LoggingKit", .exact("3.0.0")),
    ],
    targets: [
        .init(name: "{{cookiecutter.projectName}} (iOS)",
              platform: .iOS,
              product: .app,
              productName: "{{cookiecutter.projectName|replace(' ', '_')}}",
              bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
              infoPlist: .extendingDefault(with: [
                "CFBundleShortVersionString": .string("0.0.1"),
                "CFBundleVersion": .string("1"),
                "CFBundleIdentifier": .string("$(PRODUCT_BUNDLE_IDENTIFIER)"),
                "CFBundleDisplayName": .string("{{cookiecutter.projectName}}$(SERVER_ENVIRONMENT_SUFFIX)"),
                "UIApplicationSceneManifest" : .dictionary([
                    "UIApplicationSupportsMultipleScenes": .boolean(true),
                    "UISceneConfigurations": .dictionary([
                        "UIWindowSceneSessionRoleApplication": .array([
                            .dictionary([
                                "UISceneConfigurationName": "Default Configuration",
                                "UISceneDelegateClassName":"$(PRODUCT_MODULE_NAME).SceneDelegate"
                            ])
                        ])
                    ])
                ]),
                "UIApplicationSupportsIndirectInputEvents": .boolean(true),
                "UILaunchScreen": .dictionary([:]),
                "_ServerEnvironment": .string("$(SERVER_ENVIRONMENT)")
              ]),
              sources: [
                "Targets/iOS/Sources/**"
              ], resources: [
                "Targets/iOS/Resources/**",
                "Targets/iOS/SupportingFiles/**"
              ],
              actions: [
                TargetAction.pre(path: "Scripts/SwiftFormatRunScript.sh",
                                 arguments: "",
                                 name: "Swiftformat (LintMode)")
              ],
              dependencies: [
                .target(name: "{{cookiecutter.projectName}}Kit")
              ],
              settings: Settings(
                debug: Configuration(xcconfig: "Targets/iOS/SupportingFiles/Config/Configuration.xcconfig"),
                release: Configuration(xcconfig: "Targets/iOS/SupportingFiles/Config/Configuration.xcconfig")
              )
        ),
        .init(name: "Tests iOS",
              platform: .iOS,
              product: .unitTests,
              productName: "Tests_iOS",
              bundleId: "{{cookiecutter.bundleIdentifier}}-ios-tests",
              infoPlist: .default,
              sources: [
                "Targets/iOS/Tests/UnitTests/**"
              ],
              dependencies: [
                .target(name: "{{cookiecutter.projectName}} (iOS)")
              ]
        ),
        .init(name: "UI Tests iOS",
              platform: .iOS,
              product: .uiTests,
              productName: "UI_Tests_iOS",
              bundleId: "{{cookiecutter.bundleIdentifier}}-ios-ui-tests",
              infoPlist: .default,
              sources: [
                "Targets/iOS/Tests/UITests/**"
              ],
              dependencies: [
                .target(name: "{{cookiecutter.projectName}} (iOS)")
              ]
        ),
        .init(name: "{{cookiecutter.projectName}}Kit",
              platform: .iOS,
              product: .framework,
              productName: "{{cookiecutter.projectName|replace(' ', '_')}}Kit",
              bundleId: "{{cookiecutter.bundleIdentifier}}kit",
              infoPlist: .default,
              sources: [
                "Targets/{{cookiecutter.projectName}}Kit/Sources/**"
              ],
              dependencies: [
                .package(product: "LoggingKit")
              ]
        ),
        .init(name: "{{cookiecutter.projectName}}Kit Tests",
              platform: .iOS,
              product: .unitTests,
              productName: "Tests_{{cookiecutter.projectName|replace(' ', '_')}}Kit",
              bundleId: "{{cookiecutter.bundleIdentifier}}kit-tests",
              infoPlist: .default,
              sources: [
                "Targets/{{cookiecutter.projectName}}Kit/Tests/**"
              ],
              dependencies: [
                .target(name: "{{cookiecutter.projectName}} (iOS)")
              ]
        ),
    ],
    schemes: [
        .init(name: "{{cookiecutter.projectName}} (iOS) Development",
              shared: true,
              buildAction: BuildAction(targets: ["{{cookiecutter.projectName}} (iOS)"],
                                       preActions: [
                                        .init(scriptText: "cp -f \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Development.xcconfig\" \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Configuration.xcconfig\"",
                                              target: "{{cookiecutter.projectName}} (iOS)"
                                       )]
              ),
              testAction: TestAction(targets: ["Tests iOS", "UI Tests iOS"]),
              runAction: RunAction(executable: "{{cookiecutter.projectName}} (iOS)")
        ),
         .init(name: "{{cookiecutter.projectName}} (iOS) Staging",
              shared: true,
              buildAction: BuildAction(targets: ["{{cookiecutter.projectName}} (iOS)"],
                                       preActions: [
                                        .init(scriptText: "cp -f \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Staging.xcconfig\" \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Configuration.xcconfig\"",
                                              target: "{{cookiecutter.projectName}} (iOS)"
                                        )]
              ),
              testAction: TestAction(targets: ["Tests iOS", "UI Tests iOS"]),
              runAction: RunAction(executable: "{{cookiecutter.projectName}} (iOS)")
        ),
        .init(name: "{{cookiecutter.projectName}} (iOS) Production",
              shared: true,
              buildAction: BuildAction(targets: ["{{cookiecutter.projectName}} (iOS)"],
                                       preActions: [
                                        .init(scriptText: "cp -f \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Production.xcconfig\" \"${PROJECT_DIR}/Targets/iOS/SupportingFiles/Config/Configuration.xcconfig\"",
                                              target: "{{cookiecutter.projectName}} (iOS)"
                                        )]
              ),
              testAction: TestAction(targets: ["Tests iOS", "UI Tests iOS"]),
              runAction: RunAction(executable: "{{cookiecutter.projectName}} (iOS)")
        ),
        .init(name: "{{cookiecutter.projectName}}Kit",
              shared: true,
              testAction: TestAction(targets: ["{{cookiecutter.projectName}}Kit Tests"])
        ),
    ]
)
