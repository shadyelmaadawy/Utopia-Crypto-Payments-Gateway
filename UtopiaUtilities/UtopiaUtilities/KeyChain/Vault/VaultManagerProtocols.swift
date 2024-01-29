//
//  VaultManagerProtocols.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

public protocol VaultReadProtocol {
    /// Get wallet address that saved into storage manager
    /// - Returns: wallet address or throw an error
    func getCryptographyKey() throws -> String
}

public protocol VaultWriteProtocol {
    /// Save wallet address to storage manager
    /// - Parameter walletAddress
    /// This function could throw an error
    func saveCryptographyKey(_ valueKey: String) throws
}

public typealias VaultManagerProtocol = VaultReadProtocol & VaultWriteProtocol
