//
//  UserDefaultsEngine.swift
//  Utilities
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

/// Thread-Safe class
public final class UserDefaultsEngine: StorageManagement {
    
    // MARK: - Enums
    
    private enum UserDefaultsErrorCodes: Error {
        case keyNotExist
        case cannotReadKey
    }
    
    // MARK: - Properties
    
    private let threadsLock = NSLock.init()
    private let userDefaults: UserDefaults


    // MARK: - Initialization
    
    public init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
}

// MARK: - Operations

public extension UserDefaultsEngine {
 
    func getValue<T>(forKey valueKey: String) throws -> T {
        
        defer { threadsLock.unlock() }
        return try threadsLock.withLock {
            
            guard let value = userDefaults.value(forKey: valueKey) else {
                throw UserDefaultsErrorCodes.keyNotExist
            }
            
            guard let castValue = value as? T else {
                throw UserDefaultsErrorCodes.cannotReadKey
            }
            return castValue
            
        }
        
    }
    
    func setValue<T>(value: T, forKey valueKey: String) {

        threadsLock.withLock {

            userDefaults.setValue(value, forKey: valueKey)

        }
        threadsLock.unlock()

    }
    
    func isKeyExist(forKey valueKey: String) -> Bool {
        
        defer { threadsLock.unlock() }
        
        return threadsLock.withLock {
            
            guard userDefaults.value(forKey: valueKey) == nil else {
                return true
            }
            
            return false

        }
    }
    
    func deleteValue(forKey: String) {
        
        defer { threadsLock.unlock() }
        
        threadsLock.withLock {
            userDefaults.removeObject(forKey: forKey)
        }
    }
}
