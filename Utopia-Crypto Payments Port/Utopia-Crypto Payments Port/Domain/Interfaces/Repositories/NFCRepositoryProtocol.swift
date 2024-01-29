//
//  NFCRepositoryProtocol.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

protocol NFCRepositoryProtocol: AnyObject {
    /// Write nfc payload to repository
    /// - Parameters:
    ///   - walletPrivateKey: chiperd wallet key
    ///   - aesKey: chiperd aes Key
    func writeNFCPayload(for privateKey: String) async throws
}
