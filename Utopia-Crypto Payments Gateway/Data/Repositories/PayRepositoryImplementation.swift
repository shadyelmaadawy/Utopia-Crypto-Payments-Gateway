//
//  PayRepositoryImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 22/01/2024.
//

import Combine
import Foundation

final class PayRepositoryImplementation {
    
    // MARK: - Properties
    
    private let payService: PayEngineServiceProtocol
    
    // MARK: - Initialization
    
    init(payService: PayEngineServiceProtocol = Web3EngineService.init()) {
        self.payService = payService
    }

}

// MARK: - Operations

extension PayRepositoryImplementation: PayRepositoryProtocol {
    
    func pay(
        amount ethAmount: Double,
        from walletPrivateKey: Data,
        to receivingWalletAddress: String
    ) async throws -> AnyPublisher<OutputPayMessageProtocol, Error> {
     
        let payMessageRequest = PayMessageRequest(
            walletPrivateKey: walletPrivateKey,
            receivingWalletAddress: receivingWalletAddress,
            sendQuantity: ethAmount
        )
        
        return payService.pay(with: payMessageRequest)
            .tryMap({ OutputPayMessage.init(transactionHash: $0) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()

    }
    
}
