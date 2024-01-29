//
//  DecryptionServiceImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation
import UtopiaUtilities

final class DecryptionServiceImplementation {
    
    // MARK: - Enums
        
    private enum DecryptionErrorCodes: Error {
        case decryptFailed
    }
    
    // MARK: - Properties
    
    private let cryptographyEngine: CryptographyOperationsEngine
    private let vaultEngine: VaultReadProtocol
    
    // MARK: - Initialization
    
    init(cryptographyEngine: CryptographyOperationsEngine = CryptographyEngine(), vaultEngine: VaultReadProtocol = UtopiaVaultManager.shared) {
        self.cryptographyEngine = cryptographyEngine
        self.vaultEngine = vaultEngine
        
    }

}

extension DecryptionServiceImplementation: DecryptionServiceProtocol {
    
    func decryptWallet(cipheredWallet: Data, cipheredAESKey: Data) throws -> Data {
        
        let rsaPrivateKey = try vaultEngine.getCryptographyKey()
        let decryptedAESKey = try cryptographyEngine.decryptRSA(
            chiperData: cipheredAESKey, privateKey: rsaPrivateKey
        )
        
        let decryptedWalletAddress = try cryptographyEngine.decryptAES(
            cipherData: cipheredWallet, withKey: decryptedAESKey
        )
        return decryptedWalletAddress

    }
}
