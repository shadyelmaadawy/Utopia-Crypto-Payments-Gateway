//
//  NFCRepositoryImplementation.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

final class NFCRepositoryImplementation {
    
    // MARK: - Properties
    
    private let nfcService: NFCServiceProtocol
    private let encryptionService: EncryptionServiceProtocol
    
    // MARK: - Initialization
    
    init(
        nfcService: NFCServiceProtocol = NFCServiceImplementation.init(),
        encryptionService: EncryptionServiceProtocol = EncryptionServiceImplementation.init()) {
        self.nfcService = nfcService
        self.encryptionService = encryptionService
  }
    
}

// MARK: - Operations
    
extension NFCRepositoryImplementation: NFCRepositoryProtocol {
    
    func writeNFCPayload(for privateKey: String) async throws {

        let chiperdData = try encryptionService.encryptWallet(
            plainPrivateKey: privateKey
        )
        let payloadMessage = NFCWriteRequestMessage.init(
            walletPrivateKey: chiperdData.cipheredWallet,
            aesKey: chiperdData.cipheredAESKey
        )
        
        return try await nfcService.writeNFCPayload(payloadMessage)
    }


}

