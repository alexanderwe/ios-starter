//
//  UserDefaults.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation

public let Defaults = UserDefaults.standard

extension UserDefaults {
    struct Key<Value> {
        var name: String
    }

    subscript<T>(key: Key<T>) -> T? {
        get {
            return value(forKey: key.name) as? T
        }
        set {
            setValue(newValue, forKey: key.name)
        }
    }
    
    subscript<T>(
           key: Key<T>,
           default defaultProvider: @autoclosure () -> T
       ) -> T {
           get {
               return value(forKey: key.name) as? T
                   ?? defaultProvider()
           }
           set {
               setValue(newValue, forKey: key.name)
           }
       }
}

// Usage:
// Extend UserDefaults.Key with your desired keys and then use them
// extension UserDefaults.Key {
//     static var bookmarks: UserDefaults.Key<[String]> {
//         return .init(name: "bookmarks")
//     }

//     static var notificationSnoozed: UserDefaults.Key<Bool> {
//         return .init(name: "notificationSnoozed")
//     }
// }

// class SettingsViewModel {
//     private let userDefaults: UserDefaults

//     init(userDefaults: UserDefaults = .standard) {
//         self.userDefaults = userDefaults
//     }

//     func snoozeNotifications() {
//         userDefaults[.bookmarks, default: []].append("name")
//         let snoozed = userDefaults[.notificationSnoozed, default: true]
//     }
// }

@propertyWrapper
struct UserDefault<T> {
   let key: String
   let wrappedValue: T

    var value: T {
       get {
           return UserDefaults.standard.object(forKey: key) as? T ?? wrappedValue
       }
       set {
           UserDefaults.standard.set(newValue, forKey: key)
       }
    }

    init(_ key: String, defaultValue: T) {
       self.key = key
       self.wrappedValue = defaultValue
    }
}
