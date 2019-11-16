//
//  ViewController.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import UIKit
import {{cookiecutter.projectName}}Kit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logger.info("Kit framework integration works!", logCategory: .default)
        logger.info("Current Server environment is \(try? Configuration.value(for: "_ServerEnvironment") as String)", logCategory: .default)
    }
}
