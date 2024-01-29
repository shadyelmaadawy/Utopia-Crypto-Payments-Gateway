//
//  NFCServiceProtocol.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

protocol NFCServiceProtocol: AnyObject {
    /// write  payload to nfc tag
    /// - Returns: Required information or error
    func writeNFCPayload(_ nfcMessage: NFCWriteRequestMessageProtocol) async throws
}
