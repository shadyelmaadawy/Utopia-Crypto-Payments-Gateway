//
//  PayRepositoryProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 22/01/2024.
//

import Combine
import Foundation

protocol PayRepositoryProtocol: AnyObject {
    /// Execute pay request in ethereum network
    /// - Parameters:
    ///   - ethAmount: amount of ethereum
    ///   - walletPrivateKey: customer private key
    ///   - receivingWalletAddress: wallet that will receive ethereum
    /// - Returns: in case of failed error, in case of success output pay message
    func pay(
        amount ethAmount: Double,
        from walletPrivateKey: Data,
        to receivingWalletAddress: String
    ) async throws -> AnyPublisher<OutputPayMessageProtocol, Error>
}
