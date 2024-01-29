//
//  InputNFCPayload.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

protocol InputWriteMessageProtocol: AnyObject {
    /// Encrypted with AES key
    var walletPrivateKey: Data { get }
    /// Encrypted with RSA public key
    var aesKey: Data { get }
}

final class InputNFCPayload: InputWriteMessageProtocol {
    
    // MARK: - Properties
    
    let walletPrivateKey: Data
    let aesKey: Data

    // MARK: - Initialization
    
    init(walletPrivateKey: Data, aesKey: Data) {
        self.walletPrivateKey = walletPrivateKey
        self.aesKey = aesKey
    }
}

