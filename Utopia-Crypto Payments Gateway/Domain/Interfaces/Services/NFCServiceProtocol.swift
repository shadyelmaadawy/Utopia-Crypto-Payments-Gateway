//
//  NFCServiceProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

typealias NFCPayloadMessage = (walletPrivateKey: Data, aesKey: Data)

protocol NFCServiceProtocol: AnyObject {
    /// Get nfc payload that have private key and aes key
    /// - Returns: Required information or error
    func readNFCPayload() async throws -> NFCPayloadMessage
}
