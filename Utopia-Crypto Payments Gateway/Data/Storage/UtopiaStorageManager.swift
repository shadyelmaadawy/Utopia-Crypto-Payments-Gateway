//
//  UtopiaStorageManager.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation
import UtopiaUtilities

struct UtopiaStorageManager {
    
    // MARK: - Enums
    
    private enum StorageKeys: String {
        case walletAddress = "Wallet"
    }
    
    // MARK: - Properties

    static let shared: WalletManagerStorage = UtopiaStorageManager.init()
    private let dataManager: StorageManagement

    // MARK: - Initialization

    private init() {
        self.dataManager = UserDefaultsEngine.init()
    }
    
}

// MARK: - Operations

extension UtopiaStorageManager: WalletManagerStorage {
    
    func isConfigured() -> Bool {
        return dataManager.isKeyExist(forKey: StorageKeys.walletAddress.rawValue)
    }
    
    func deleteWallet() {
        dataManager.deleteValue(forKey: StorageKeys.walletAddress.rawValue)
    }
    
    func setWalletAddress(_ walletAddress: String) throws {
        dataManager.setValue(value: walletAddress, forKey: StorageKeys.walletAddress.rawValue)
    }
    
    func getWalletAddress() throws -> String {
        return try dataManager.getValue(forKey: StorageKeys.walletAddress.rawValue)
    }
}
