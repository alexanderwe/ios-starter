//
//  ViewController.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import UIKit
import LoggingKit

class ViewController: UIViewController {


    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello {{cookiecutter.projectName}}"
        return label

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Do any additional setup after loading the view.
        LogService.shared.info("Welcome to your iOS starter project!", logCategory: \.default)
        LogService.shared.info("Current Server environment is \(try? Configuration.value(for: "_ServerEnvironment") as String)", logCategory: \.default)
    }
}
