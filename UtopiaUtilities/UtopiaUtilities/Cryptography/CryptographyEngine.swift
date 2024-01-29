//
//  CryptographyEngine.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 22/01/2024.
//

import Foundation
import CryptoKit
import CryptoSwift

public final class CryptographyEngine: RSACryptographyEngine, AESCryptographyEngine {
    
    // MARK: - Enums
    
    private enum EngineErrorCodes: Error {
        case aesEncryptionFailed
        case aesDecryptionFailed
        case rsaEncryptionFailed
        case rsaDecryptionFailed
    }
    
    public init() {}
    
}

// MARK: - RSA Operations

public extension CryptographyEngine {
    
    func generateRSAKeys() throws -> (publicKey: String, privateKey: String) {
        
        let rsaEngine = try RSA.init(keySize: 512) // 2048 size is better for secure encryption, but nfc tag has low capacity, so let's make it small
        
        let base64PublicKey = try rsaEngine.publicKeyExternalRepresentation().base64EncodedString()
        let base64PrivateKey = try rsaEngine.externalRepresentation().base64EncodedString()
        
        return (publicKey: base64PublicKey, privateKey: base64PrivateKey)
        
    }

    func encryptRSA(plainText: String, publicKey: String) throws -> Data {
        
        guard let dataBuffer = plainText.data(using: .ascii) else {
            throw EngineErrorCodes.rsaEncryptionFailed
        }

        return try encryptRSA(plainData: dataBuffer, publicKey: publicKey)

    }
    
    func encryptRSA(plainData: Data, publicKey: String) throws -> Data {
        
        guard let rawPublicKey = Data.init(base64Encoded: publicKey) else {
            throw EngineErrorCodes.rsaEncryptionFailed
        }
        
        let rsaEngine = try RSA.init(rawRepresentation: rawPublicKey)
        let cipherData = try rsaEngine.encrypt(plainData.bytes)

        return Data.init(cipherData)
    }
    
    func decryptRSA(chiperData: Data, privateKey: String) throws -> Data {
        
        guard let rawPrivateKey = Data.init(base64Encoded: privateKey) else {
            throw EngineErrorCodes.rsaDecryptionFailed
        }

        let rsaEngine = try RSA.init(rawRepresentation: rawPrivateKey)
        let plainData = try rsaEngine.decrypt(chiperData.bytes)
        
        return Data.init(plainData)
    }

}

// MARK: - AES Operations

public extension CryptographyEngine {
    
    func generateAESRandomKey() -> Data {
        
        let randomAesKey = SymmetricKey(size: .bits256)
        let randomKeyData = randomAesKey.withUnsafeBytes { Data.init(Array.init($0)) }
        
        return randomKeyData
    }

    func encryptAES(plainText: String, withKey aesKey: Data) throws -> Data {
        
        guard let dataBuffer = plainText.data(using: .ascii) else {
            throw EngineErrorCodes.aesEncryptionFailed
        }
        
        return try encryptAES(data: dataBuffer, withKey: aesKey)
    }
    
    func encryptAES(data: Data, withKey aesKey: Data) throws -> Data {
        
        let aesKey = SymmetricKey(data: aesKey)
        let aesSealBox = try AES.GCM.seal(data, using: aesKey)

        guard let cipherData = aesSealBox.combined else {
            throw EngineErrorCodes.aesEncryptionFailed
        }
        
        return cipherData
    }

    func decryptAES(cipherData: String, withKey aesKey: Data) throws -> Data {
        
        guard let cipherData = cipherData.data(using: .ascii) else {
            throw EngineErrorCodes.aesDecryptionFailed
        }
        
        return try decryptAES(cipherData: cipherData, withKey: aesKey)
        
    }

    func decryptAES(cipherData: Data, withKey aesKey: Data) throws -> Data {

        let aesKey = SymmetricKey(data: aesKey)
        let aesSealBox = try AES.GCM.SealedBox(combined: cipherData)
        
        return try AES.GCM.open(aesSealBox, using: aesKey)
    }

}
