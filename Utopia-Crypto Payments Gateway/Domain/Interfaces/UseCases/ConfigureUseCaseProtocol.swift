//
//  ConfigureUseCaseProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

protocol ConfigureUseCaseProtocol: AnyObject {
    /// Save wallet address to storage manager
    /// - Parameter walletAddress
    /// This function could throw an error
    func setWalletAddress(_ walletAddress: String) throws
}
