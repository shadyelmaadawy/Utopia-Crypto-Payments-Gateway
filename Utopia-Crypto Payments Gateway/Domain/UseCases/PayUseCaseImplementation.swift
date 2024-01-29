//
//  PayUseCaseImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 22/01/2024.
//

import Combine
import Foundation

final class PayUseCaseImplementation {
    
    // MARK: - Enums
    
    private enum PayUseCaseErrorCodes: Error {
        case cannotReadWallet
    }
    // MARK: - Properties

    private let nfcRepository: NFCRepositoryProtocol
    private let payRepository: PayRepositoryProtocol
    private let walletManager: WalletManagerStorage
    
    // MARK: - Initialization

    init(
        nfcRepository: NFCRepositoryProtocol = NFCRepositoryImplementation.init(),
        payRepository: PayRepositoryProtocol = PayRepositoryImplementation.init(),
        walletManager: WalletManagerStorage = UtopiaStorageManager.shared) {
            
            self.nfcRepository = nfcRepository
            self.payRepository = payRepository
            self.walletManager = walletManager
            
        }
}

// MARK: - Operations

extension PayUseCaseImplementation: PayUseCaseProtocol {
    
    func pay(amount ethAmount: Double) async throws -> AnyPublisher<OutputPayMessageProtocol, Error> {

        let customerWalletData = try? await nfcRepository.getNFCPayload()
        guard let customerWalletData = customerWalletData else {
            throw PayUseCaseErrorCodes.cannotReadWallet
        }
        let destinationWallet = try walletManager.getWalletAddress()
        
        return try await payRepository.pay(amount: ethAmount, from: customerWalletData.walletPrivateKey, to: destinationWallet)
    }

    
}
