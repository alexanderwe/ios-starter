//
//  Localization.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        let loca = NSLocalizedString(self, comment: "")
        if loca.isEmpty || loca == self {
            return self
        }
        return loca
    }
}