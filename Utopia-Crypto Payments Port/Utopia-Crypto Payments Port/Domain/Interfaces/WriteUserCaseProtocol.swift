//
//  WriteUserCaseProtocol.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Foundation

protocol WriteUserCaseProtocol {
    /// Write and encrypt private key into nfc tag
    /// - Parameter privateKey: wallet private key
    func writeWallet(for privateKey: String) async throws
}

