//
//  OutputPayMessage.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 22/01/2024.
//

import Foundation

protocol OutputPayMessageProtocol {
    /// Hash of succeed transaction
    var transactionHash: String { get }
}

final class OutputPayMessage: OutputPayMessageProtocol {
    
    // MARK: - Properties
    
    let transactionHash: String
    
    // MARK: - Initialization
    
    init(transactionHash: String) {
        self.transactionHash = transactionHash
    }
    
}
