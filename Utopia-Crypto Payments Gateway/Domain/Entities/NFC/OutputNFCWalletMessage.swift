//
//  OutputNFCWalletMessage.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 25/01/2024.
//

import Foundation

protocol OutputNFCWalletMessageProtocol: AnyObject {
    /// Plain private wallet key
    var walletPrivateKey: Data { get }
}

final class OutputNFCWalletMessage: OutputNFCWalletMessageProtocol {
    
    // MARK: - Properties
    
    let walletPrivateKey: Data
    
    // MARK: - Initialization

    init(walletPrivateKey: Data) {
        self.walletPrivateKey = walletPrivateKey
    }
    
}
