//
//  Logging.swift
//  {{cookiecutter.projectName}}
//
//  Created by Automated on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.companyName}}. All rights reserved.
//

import Foundation
import os.log

extension OSLogType: CustomStringConvertible {
    public var description: String {
        switch self {
        case OSLogType.info:
            return "ℹ️(info)"
        case OSLogType.debug:
            return "🐛(debug)"
        case OSLogType.error:
            return "‼️(error)"
        case OSLogType.fault:
            return "🧨(fault)"
        default:
            return "DEFAULT"
        }
    }
}

private let subsystem = Bundle.main.bundleIdentifier ?? "com.default.logger"

/// Simple Logger which uses Apple's Unified Logging System via `os_log`
///
/// - seeAlso:
///   - [Apple Logging Documentation](https://developer.apple.com/documentation/os/logging#1682416)
///   - [Github](https://github.com/mono0926/mono-kit/blob/master/Lib/Logger.swift)
public struct Logger {
    
    fileprivate init() {}
    
    /// Logs an info message
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    public func info(_ message: @autoclosure () ->  Any?,
                     logCategory: LogCategory = .default,
                     functionName: StaticString = #function,
                     fileName: StaticString = #file,
                     lineNumber: Int = #line) {
        
        doLog(message(),
              logType: .info,
              logCategory: logCategory,
              functionName: functionName,
              fileName: fileName,
              lineNumber: lineNumber
        )
    }
    
    /// Logs a debug message
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    public func debug(_ message: @autoclosure () ->  Any?,
                      logCategory: LogCategory = .default,
                      functionName: StaticString = #function,
                      fileName: StaticString = #file,
                      lineNumber: Int = #line) {
        
        doLog(message(),
              logType: .debug,
              logCategory: logCategory,
              functionName: functionName,
              fileName: fileName,
              lineNumber: lineNumber
        )
    }
    
    /// Logs an error message
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    public func error(_ message: @autoclosure () ->  Any?,
                      logCategory: LogCategory = .default,
                      functionName: StaticString = #function,
                      fileName: StaticString = #file,
                      lineNumber: Int = #line) {
        
        doLog(message(),
              logType: .error,
              logCategory: logCategory,
              functionName: functionName,
              fileName: fileName,
              lineNumber: lineNumber)
    }
    
    /// Logs an fault message
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    public func fault(_ message: @autoclosure () ->  Any?,
                      logCategory: LogCategory = .default,
                      functionName: StaticString = #function,
                      fileName: StaticString = #file,
                      lineNumber: Int = #line) {
        
        doLog(message(),
              logType: .fault,
              logCategory: logCategory,
              functionName: functionName,
              fileName: fileName,
              lineNumber: lineNumber)
    }
    
    /// Logs a default message
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    public func `default`(_ message: @autoclosure () ->  Any?,
                          logCategory: LogCategory = .default,
                          functionName: StaticString = #function,
                          fileName: StaticString = #file,
                          lineNumber: Int = #line) {
        doLog(message(),
              logType: .default,
              logCategory: logCategory,
              functionName: functionName,
              fileName: fileName,
              lineNumber: lineNumber)
    }
    
    /// Acutally loggs the message using `os_log`
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    private func doLog(_ message: @autoclosure () ->  Any?,
                       logType: OSLogType,
                       logCategory: LogCategory = .default,
                       functionName: StaticString,
                       fileName: StaticString,
                       lineNumber: Int) {
        
        let staticSelf = type(of: self)
        let log = logCategory.logger
        guard log.isEnabled(type: logType) else { return }
        guard let output = staticSelf.buildOutput(message(),
                                                  logType: logType,
                                                  functionName: functionName,
                                                  fileName: fileName,
                                                  lineNumber: lineNumber) else { return }
        
        os_log("%@", log: logCategory.logger, type: logType, output)
    }
    
    /// Produces the log output
    ///
    /// - Parameters:
    ///   - message: Message to log
    ///   - logCategory: Category of the log message
    ///   - functionName: Name of the function in which the message is logged
    ///   - fileName: Name of the file in which the message is logged
    ///   - lineNumber: Line number in which the message is logged
    /// - Returns: A formatted log message
    static func buildOutput(_ message: @autoclosure () ->  Any?,
                            logType: OSLogType,
                            functionName: StaticString,
                            fileName: StaticString,
                            lineNumber: Int) -> String? {
        guard let message = message() else { return nil }
        return "[\(logType)] [\(threadName)] [\((String(describing: fileName) as NSString).lastPathComponent):\(lineNumber)] \(functionName) > \(message)"
    }
    
    /// Extracts the current thread name
    private static var threadName: String {
        if Thread.isMainThread {
            return "main"
        }
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        }
        if let queueName = DispatchQueue.currentQueueLabel, !queueName.isEmpty {
            return queueName
        }
        return String(format: "[%p] ", Thread.current)
    }
}

extension DispatchQueue {
    public static var currentQueueLabel: String? {
        return String(validatingUTF8: __dispatch_queue_get_label(nil))
    }
}

public enum LogCategory {
    case `default`
    case networking
    case database
    
    var logger: OSLog {
        switch self {
        case .default:
            return OSLog(subsystem: subsystem, category: "default")
        case .networking:
            return OSLog(subsystem: subsystem, category: "networking")
        case .database:
            return OSLog(subsystem: subsystem, category: "database")
        }
    }
}

public let logger = Logger()
