//
//  WalletMangerProtocols.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

protocol WalletManagerConfigureProtocol {
    /// Check if the wallet had been configured before
    /// - Returns: if is configured or not
    func isConfigured() -> Bool
}

protocol WalletManagerDeleteProtocol {
    /// Delete wallet from storage manager
    func deleteWallet()
}

protocol WalletManagerReadProtocol {
    /// Get wallet address that saved into storage manager
    /// - Returns: wallet address or throw an error
    func getWalletAddress() throws -> String
}

protocol WalletManagerWriteProtocol {
    /// Save wallet address to storage manager
    /// - Parameter walletAddress
    /// This function could throw an error
    func setWalletAddress(_ walletAddress: String) throws
}

typealias WalletManagerStorage = WalletManagerWriteProtocol & WalletManagerReadProtocol & WalletManagerDeleteProtocol & WalletManagerConfigureProtocol
