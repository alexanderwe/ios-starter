//
//  {{cookiecutter.projectName}}Kit.swift
//  {{cookiecutter.projectName}}Kit
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import LoggingKit

public struct {{cookiecutter.projectName}}Kit {
    public static func hello() {
        LogService.shared.info("Hello from {{cookiecutter.projectName}}Kit", logCategory: \.default)
    }
}