//
//  ValidateEthereumWalletUseCaseProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

protocol ValidateEthereumWalletUseCaseProtocol: AnyObject {
    /// Check if wallet is valid or not
    /// - Parameter walletAddress: wallet address to check
    /// - Returns: true if is valid false if is not
    func isValidWallet(_ walletAddress: String) -> Bool
}
