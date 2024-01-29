//
//  InputPayMessage.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 21/01/2024.
//

import Foundation

protocol InputPayMessageProtocol: AnyObject {
    /// Plain private custom wallet key
    var walletPrivateKey: Data { get }
    /// Receiving wallet address
    var receivingWalletAddress: String { get }
    /// Amount to send to receiving wallet address
    var sendQuantity: Double { get }
}

final class InputPayMessage: InputPayMessageProtocol {
    
    // MARK: - Properties
    
    let walletPrivateKey: Data
    let receivingWalletAddress: String
    let sendQuantity: Double
    
    // MARK: - Initialization
    
    init(walletPrivateKey: Data, receivingWalletAddress: String, sendQuantity: Double) {
        self.walletPrivateKey = walletPrivateKey
        self.receivingWalletAddress = receivingWalletAddress
        self.sendQuantity = sendQuantity
        
    }
    
}
