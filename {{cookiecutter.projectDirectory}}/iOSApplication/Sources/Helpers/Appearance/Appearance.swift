//
//  Appearence.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import UIKit

struct Appearence {
    
    struct Fonts {
  
///        Custom dynamic adjustable font
///        static let customFont: UIFont = {
///            let font = UIFont(name: "", size: 17)
///            let fontMetrics = UIFontMetrics(forTextStyle: .body)
///            return fontMetrics.scaledFont(for: font!)
///        }()
        
        static let title = UIFont.preferredFont(forTextStyle: .title1)
        static let heading = UIFont.preferredFont(forTextStyle: .headline)
        static let subheading = UIFont.preferredFont(forTextStyle: .subheadline)
        static let body = UIFont.preferredFont(forTextStyle: .body)
        static let small = UIFont.preferredFont(forTextStyle: .title2)
    }

    struct Colors {
        static let title = UIColor.blue
        static let heading = UIColor.black
        static let background = UIColor.white
    }

    struct Icons { }
}
