//
//  StorageManagementProtocol.swift
//  Utilities
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

public protocol StorageManagement {
    /// Initialization instance with default user defaults instance
    /// - Parameter userDefaults
    init(userDefaults: UserDefaults)
    /// Get value from storage manager
    /// - Parameter valueKey: Required key for read from storage
    /// - Returns: Required value
    func getValue<T>(forKey valueKey: String) throws -> T
    
    /// Set value into storage manager
    /// - Parameters:
    ///   - value: required value to save
    ///   - valueKey: the key of value that will be save into
    func setValue<T>(value: T, forKey valueKey: String)
    
    /// Check if the key is exists in storage manager
    /// - Parameter valueKey: Required key for check from storage
    /// - Returns: true or false
    func isKeyExist(forKey valueKey: String) -> Bool
    
    /// Delete a value from storage manager
    /// - Parameter forKey: value key
    func deleteValue(forKey: String)
    
}
