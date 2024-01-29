//
//  WriteUseCaseImplementation.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

final class WriteUseCaseImplementation {
   
    // MARK: - Properties

    private let nfcRepository: NFCRepositoryProtocol

    // MARK: - Initialization

    init(nfcRepository: NFCRepositoryProtocol = NFCRepositoryImplementation.init()) {
        self.nfcRepository = nfcRepository
    }
    
}

// MARK: - Operations

extension WriteUseCaseImplementation: WriteUserCaseProtocol {
    
    func writeWallet(for privateKey: String) async throws {
        
        try await nfcRepository.writeNFCPayload(for: privateKey)

    }
}
