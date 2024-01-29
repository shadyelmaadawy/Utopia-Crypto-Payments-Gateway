//
//  NFCWriteRequestMessage.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 25/01/2024.
//

import Foundation

protocol NFCWriteRequestMessageProtocol {
    /// Request write message to nfc, content private and aes key
    var requestWriteMessage: InputWriteMessageProtocol { get }
}

struct NFCWriteRequestMessage: NFCWriteRequestMessageProtocol {
   
    // MARK: - Configure

    var requestWriteMessage: InputWriteMessageProtocol {
        return InputNFCPayload.init(
            walletPrivateKey: self.walletPrivateKey,
            aesKey: self.aesKey
        )
    }
    
    
    // MARK: - Properties
    
    private let walletPrivateKey: Data
    private let aesKey: Data

    // MARK: - Initialization
    
    init(walletPrivateKey: Data, aesKey: Data) {
        self.walletPrivateKey = walletPrivateKey
        self.aesKey = aesKey
    }
}

