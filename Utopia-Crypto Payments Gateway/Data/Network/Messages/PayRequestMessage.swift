//
//  PayRequestMessage.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

protocol PayMessageRequestProtocol {
    var rpcURLAddress: RPCEndPoints { get }
    var requestPayMessage: InputPayMessageProtocol { get }
}

struct PayMessageRequest: PayMessageRequestProtocol {
    
    // MARK: - Configure
    
    var rpcURLAddress: RPCEndPoints {
        return .baseURL
    }
    
    var requestPayMessage: InputPayMessageProtocol {
        return InputPayMessage.init(
            walletPrivateKey: self.walletPrivateKey,
            receivingWalletAddress: self.receivingWalletAddress,
            sendQuantity: self.sendQuantity
        )
    }
    
    
    // MARK: - Properties
        
    private let walletPrivateKey: Data
    private let receivingWalletAddress: String
    private let sendQuantity: Double

    // MARK: - Initialization
    
    init(walletPrivateKey: Data, receivingWalletAddress: String, sendQuantity: Double) {
        self.walletPrivateKey = walletPrivateKey
        self.receivingWalletAddress = receivingWalletAddress
        self.sendQuantity = sendQuantity
    }
    
}
