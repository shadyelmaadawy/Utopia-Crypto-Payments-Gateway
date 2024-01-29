//
//  EthereumModuleProtocols.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

public protocol EthereumModulePrivateKeyValidateProtocol {
    /// Check if the private key is valid or not
    /// - Parameter privateKey: required key to check
    /// - Returns: true if valid or false if not
    func isValidKey(_ privateKey: String) -> Bool
}

public protocol EthereumModuleWalletValidateProtocol {
    /// Check if wallet is valid or not
    /// - Parameter walletAddress: required wallet address to check
    /// - Returns: true if valid or false if not
    func isValidWallet(_ walletAddress: String) -> Bool
}

public protocol EthereumModuleBufferProtocol: AnyObject {
    /// Get Key buffer from private key
    /// - Parameter privateKey: required key to get buffer from it
    /// - Returns: true if valid or false if not
    func getKeyBuffer(for privateKey: String) throws -> Data
}

public typealias EthereumModuleProtocol = EthereumModulePrivateKeyValidateProtocol & EthereumModuleWalletValidateProtocol & EthereumModuleBufferProtocol
