//
//  UtopiaVaultManager.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

public struct UtopiaVaultManager: VaultManagerProtocol {
    
    // MARK: - Enums
    
    private enum VaultKeys: String {
        case encryptionKey = "VaultEncryptionKey"
        case decryptionKey = "VaultDecryptionKey"
    }
    
    // MARK: - Properties

    public static let shared: VaultManagerProtocol = UtopiaVaultManager.init()
    private let keyChainEngine: KeyChainManagementProtocol
    
    // MARK: - Initialization

    private init() {
        self.keyChainEngine = KeyChainEngine.init()
    }

}

public extension UtopiaVaultManager {
    
    func getCryptographyKey() throws -> String {
        return try keyChainEngine.getValue(forKey: VaultKeys.encryptionKey.rawValue)
    }
    
     func saveCryptographyKey(_ value: String) throws {
        try keyChainEngine.saveValue(value: value, forKey: VaultKeys.encryptionKey.rawValue)
    }
    
    
}
