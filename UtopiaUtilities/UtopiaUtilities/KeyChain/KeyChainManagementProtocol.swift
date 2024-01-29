//
//  KeyChainManagementProtocol.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

public protocol KeyChainManagementInputProtocol {
    /// Get value from keychain, note data will be retrieved with UTF8 Encoding
    /// - Parameter valueKey: Required key for read from storage
    /// - Returns: Required value
    func getValue(forKey valueKey: String) throws -> String
}

public protocol KeyChainManagementQueryProtocol {
    /// Check if the key is exists in keychain
    /// - Parameter valueKey: key name
    /// - Returns: true if exists false if not
    func isExists(forKey valueKey: String) -> Bool
}

public protocol KeyChainManagementOutputProtocol {
    /// Save value into keychain, note: data will be saved with UTF8 Encoding
    /// - Parameters:
    ///   - value: required value to store
    ///   - valueKey: the key of value that will be save into
    func saveValue(value: String, forKey valueKey: String) throws

}

public typealias KeyChainManagementProtocol = KeyChainManagementInputProtocol & KeyChainManagementOutputProtocol & KeyChainManagementQueryProtocol
