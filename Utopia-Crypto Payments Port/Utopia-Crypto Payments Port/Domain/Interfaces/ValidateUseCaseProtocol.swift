//
//  ValidatePrivateKeyUseCaseProtocol.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

protocol ValidatePrivateKeyUseCaseProtocol: AnyObject {
    /// Validate if private key is valid or not
    /// - Parameter key: private key to check
    /// - Returns: true if is valid false if is not
    func isValidPrivateKey(for key: String) -> Bool
}

