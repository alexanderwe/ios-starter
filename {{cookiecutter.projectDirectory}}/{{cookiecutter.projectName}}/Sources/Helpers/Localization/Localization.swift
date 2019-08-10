//
//  Loca.swift
//  PTV
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        let loca = NSLocalizedString(self, comment: "")
        if loca == "" || loca == self {
            return self
        }
        return loca
    }
}