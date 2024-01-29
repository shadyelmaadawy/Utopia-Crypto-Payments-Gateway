//
//  EncryptionServiceProtocol.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

typealias EncryptWalletOutput = (cipheredWallet: Data, cipheredAESKey: Data)

protocol EncryptionServiceProtocol: AnyObject {
  /// Encrypt plain wallet private key with RSA + AES
    /// - Parameter plainPrivateKey: plain key
    /// - Returns: thrown an error or ciphered wallet and ciphered aes key
    func encryptWallet(plainPrivateKey: String) throws -> EncryptWalletOutput
}
