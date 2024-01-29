//
//  NFCServiceImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 22/01/2024.
//

import Foundation
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
    
    func readNFCPayload() async throws -> NFCPayloadMessage {
        
        let jotunheimrClient = try await jotunheimr.scanForTag(
            scanMessage: "Hello, scan for customer tag to pay"
        )
        
        let tagPayloads = try await jotunheimrClient.getPayloads()
        
        guard tagPayloads.count == 2 else {
            throw NFCErrorCodes.tagsPayloadsInvalid
        }

        return NFCPayloadMessage(
            walletPrivateKey: tagPayloads[0].payload,
            aesKey: tagPayloads[1].payload
        )
        
    }

}
