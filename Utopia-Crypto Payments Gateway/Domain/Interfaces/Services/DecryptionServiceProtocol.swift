//
//  DecryptionServiceProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

protocol DecryptionServiceProtocol: AnyObject {
    /// Decrypt ciphered wallet depend on ciphered aes key
    /// - Parameters:
    ///   - cipheredWallet: ciphered wallet that will be decrypted
    ///   - cipheredAESKey: ciphered aes used in encryption operation
    /// - Returns: plain wallet or throw an error
    func decryptWallet(cipheredWallet: Data, cipheredAESKey: Data) throws -> Data
}
