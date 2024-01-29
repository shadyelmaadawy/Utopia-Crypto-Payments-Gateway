//
//  NFCRepositoryProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

protocol NFCRepositoryProtocol: AnyObject {
    /// Get nfc payload from device
    /// - Returns: nfc output messagfe
    func getNFCPayload() async throws -> OutputNFCWalletMessageProtocol
}

