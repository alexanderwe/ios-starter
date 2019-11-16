//
//  TitleLabel.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import UIKit

class TitleLabel: Label {
    
    override func initialize() {
        super.initialize()
        
        self.font = Appearence.Fonts.title
        self.textColor = Appearence.Colors.title
    }
}
