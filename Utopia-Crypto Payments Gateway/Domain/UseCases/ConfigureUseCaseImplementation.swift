//
//  ConfigureUseCaseImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

final class ConfigureUseCaseImplementation {
 
    // MARK: - Properties

    private let walletManager: WalletManagerWriteProtocol

    // MARK: - Initialization

    init(walletManager: WalletManagerWriteProtocol = UtopiaStorageManager.shared) {
        
        self.walletManager = walletManager
        
    }
    
}

// MARK: - Operations

extension ConfigureUseCaseImplementation: ConfigureUseCaseProtocol {

    func setWalletAddress(_ walletAddress: String) throws {
        try walletManager.setWalletAddress(walletAddress)
    }
    
}
