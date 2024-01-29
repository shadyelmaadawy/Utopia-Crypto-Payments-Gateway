//
//  NFCServiceImplementation.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Jotunheimr

final class NFCServiceImplementation {

    // MARK: - Enums
    
    private enum NFCErrorCodes: Error {
        case tagsPayloadsInvalid
    }
    
    // MARK: - Properties
    
    private let jotunheimr: Jotunheimr
    
    // MARK: - Initialization
    
    init(jotunheimr: Jotunheimr = Jotunheimr.shared) {
        self.jotunheimr = jotunheimr
    }
    
}

// MARK: - Operations

extension NFCServiceImplementation: NFCServiceProtocol {
    
    func writeNFCPayload(_ nfcMessage: NFCWriteRequestMessageProtocol) async throws {
        
        let jotunheimrClient = try await jotunheimr.scanForTag(
            scanMessage: "Hello, scan your tag to write the key on it."
        )
        
        let walletPrivateKeyPayload = Jotunheimr.createPayload(nfcMessage.requestWriteMessage.walletPrivateKey)
        let aesKeyPayload = Jotunheimr.createPayload(nfcMessage.requestWriteMessage.aesKey)

        try await jotunheimrClient.writePayload(walletPrivateKeyPayload)
        try await jotunheimrClient.addPayload(aesKeyPayload)
        
    }

}
