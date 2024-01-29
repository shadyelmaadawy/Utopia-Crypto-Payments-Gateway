//
//  Jotunheimr+Ext.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation
import CoreNFC
import Jotunheimr

extension Jotunheimr {
    
    /// Create nfc payload
    /// - Parameter dataBuffer: data
    /// - Returns: created payload
    static func createPayload(_ dataBuffer: Data) -> NFCNDEFPayload {
        
        return NFCNDEFPayload.init(
            format: .nfcWellKnown,
            type: "T".data(using: .ascii)!,
            identifier: Data.init(count: 0),
            payload: dataBuffer
        )
        
    }
}

