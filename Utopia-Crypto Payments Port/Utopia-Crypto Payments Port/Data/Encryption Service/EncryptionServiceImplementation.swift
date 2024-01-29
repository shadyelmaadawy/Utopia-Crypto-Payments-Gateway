//
//  EncryptionServiceImplementation.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation
import UtopiaUtilities

final class EncryptionServiceImplementation {
    
    // MARK: - Properties
    
    private let cryptographyEngine: CryptographyOperationsEngine
    private let vaultEngine: VaultReadProtocol
    private let ethereumModule: EthereumModuleBufferProtocol
    // MARK: - Initialization
    
    init(cryptographyEngine: CryptographyOperationsEngine = CryptographyEngine(),
         vaultEngine: VaultReadProtocol = UtopiaVaultManager.shared,
         ethereumModule: EthereumModuleBufferProtocol = EthereumModule.init()) {
        self.cryptographyEngine = cryptographyEngine
        self.vaultEngine = vaultEngine
        self.ethereumModule = ethereumModule
    }
    
}

extension EncryptionServiceImplementation: EncryptionServiceProtocol {
    
    func encryptWallet(plainPrivateKey: String) throws -> EncryptWalletOutput {
        
        let rsaPublicKey = try vaultEngine.getCryptographyKey()

        let privateKeyBuffer = try ethereumModule.getKeyBuffer(for: plainPrivateKey)
        let randomAESKey = cryptographyEngine.generateAESRandomKey()
        
        let encryptedWalletKey = try cryptographyEngine.encryptAES(
            data: privateKeyBuffer, withKey: randomAESKey
        )
        let encryptedAESKey = try cryptographyEngine.encryptRSA(
            plainData: randomAESKey, publicKey: rsaPublicKey
        )
        
        return (cipheredWallet: encryptedWalletKey, cipheredAESKey: encryptedAESKey)

    }

}

