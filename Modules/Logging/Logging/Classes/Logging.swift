//
//  Logging.swift
//  Logging
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import Foundation
import CocoaLumberjack
import CocoaLumberjackSwift

public enum Logging {
    public static func setupLogging() {
        DDLog.add(DDTTYLogger.sharedInstance)
//        DDLog.add(DDASLLogger.sharedInstance)
        
        let fileLogger: DDFileLogger = DDFileLogger()
        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24) // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
    }
    
    case warn(String)
    case verbose(String)
    case info(String)
    case debug(String)
    case error(String)
    
    public static func log(_ type: Logging) {
        switch type {
        case let .verbose(message):
            DDLogVerbose(message)
        case let .warn(message):
            DDLogWarn(message)
        case let .info(message):
            DDLogInfo(message)
        case let .debug(message):
            DDLogDebug(message)
        case let .error(message):
            DDLogError(message)
        }
    }
}
