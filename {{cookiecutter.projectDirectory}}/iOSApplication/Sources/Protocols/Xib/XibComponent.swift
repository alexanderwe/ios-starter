//
//  XibComponent.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import UIKit

/// Protocol for UIViews being loaded from a .xib file
protocol XibComponent where Self: UIView {
    func setup()
}

// MARK: - Loading from .xib
extension XibComponent {
    
    /// Load an UIView from an .xib file. The name of the .xib files
    /// needs to match the name of the custom class
    ///
    /// - Parameters:
    ///   - type: The type of the custom class
    func loadViewFromNib(type: AnyClass) {
        
        let bundle = Bundle(for: type)
        let nib = UINib(nibName: String(describing: type), bundle: bundle)
        let views = nib.instantiate(withOwner: self, options: nil)
        if let view = views.last as? UIView {
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(view)
        }
    }
}