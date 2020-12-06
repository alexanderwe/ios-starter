//
//  Configuration.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//
import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { throw Error.invalidValue }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

// Usage:
// Define your values inside the Info.plist file
// API_BASE_URL: $(BASE_URL) // BASE_URL is the value defined in the .xcconfig files
//
// enum API {
//     static var baseURL: URL {
//         do {
//             let value = try Configuration.value(for: "API_BASE_URL") as String
//             return URL(string: "https://" + value)!
//         } catch {
//             print(error)
//             return URL(string: "https://google.com")!
//         }
//     }

//     static var key: String {
//         return try! Configuration.value(for: "API_KEY")
//     }
// }
