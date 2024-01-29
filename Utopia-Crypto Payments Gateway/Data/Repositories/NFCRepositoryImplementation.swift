//
//  NFCRepositoryImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

final class NFCRepositoryImplementation {

    // MARK: - Enums
    
    private enum NFCRepositoryErrorCodes: Error {
        case cannotDecryptWallet
    }
    
    // MARK: - Properties

    private let nfcService: NFCServiceProtocol
    private let decryptionService: DecryptionServiceProtocol
   
    // MARK: - Initialization
    
    init(nfcService: NFCServiceProtocol = NFCServiceImplementation.init(), 
         decryptionService: DecryptionServiceProtocol = DecryptionServiceImplementation.init()) {
        self.nfcService = nfcService
        self.decryptionService = decryptionService
    }
    
}

// MARK: - Operations

extension NFCRepositoryImplementation: NFCRepositoryProtocol {
    
    func getNFCPayload() async throws -> OutputNFCWalletMessageProtocol {
        
        let nfcPayloadMessage = try await nfcService.readNFCPayload()
        
        let decryptedCustomerWallet = try? decryptionService.decryptWallet(
            cipheredWallet: nfcPayloadMessage.walletPrivateKey, cipheredAESKey: nfcPayloadMessage.aesKey
        )
        guard let decryptedCustomerWallet = decryptedCustomerWallet else {
            throw NFCRepositoryErrorCodes.cannotDecryptWallet
        }
        
        return OutputNFCWalletMessage.init(
            walletPrivateKey: decryptedCustomerWallet
        )

    }

}

