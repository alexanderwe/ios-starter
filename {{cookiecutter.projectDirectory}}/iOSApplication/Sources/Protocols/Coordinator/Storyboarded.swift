//
//  Storyboarded.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(from storyboard: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: String = "Main") -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        
        // swiftlint:disable force_cast
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        // swiftlint:enable force_cast
    }
}
