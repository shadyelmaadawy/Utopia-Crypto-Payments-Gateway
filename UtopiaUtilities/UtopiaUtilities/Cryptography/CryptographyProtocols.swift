//
//  CryptographyProtocols.swift
//  Utilities
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Foundation

public protocol RSACryptographyEngine: AnyObject {
    /// Generate public/private keys for RSA algorithm
    /// Note: this function can take a long time to finish, depend in your CPU/Key size
    /// - Returns: generated keys or throw an error
    func generateRSAKeys() throws -> (publicKey: String, privateKey: String)
    
    /// Encrypt plain text with RSA public key
    /// - Parameters:
    ///   - plainText: plain text that will be encrypted
    ///   - publicKey: RSA public key that will be used in encryption operation
    /// - Returns: Encrypted data or throw an error
    func encryptRSA(plainText: String, publicKey: String) throws -> Data

    /// Encrypt plain data with RSA public key
    /// - Parameters:
    ///   - plainData: plain data that will be encrypted
    ///   - publicKey: RSA public key that will be used in encryption operation
    /// - Returns: Encrypted data or throw an error
    func encryptRSA(plainData: Data, publicKey: String) throws -> Data
    
    /// Decrypt encrypted data with RSA algorithm
    /// - Parameters:
    ///   - chiperData: Data that has been encrypted
    ///   - privateKey: RSA private key that will be used in decryption operation
    /// - Returns: plain data or throw an error
    func decryptRSA(chiperData: Data, privateKey: String) throws -> Data
}

public protocol AESCryptographyEngine: AnyObject {
    /// Generate public key for AES algorithm that will be used to encryption and decryption
    /// - Returns: Generated key
    func generateAESRandomKey() -> Data
    
    /// Encrypt data with AES algorithm
    /// - Parameters:
    ///   - data: plain text that will be encrypted
    ///   - aesKey: AES key that will be used in encryption operation
    /// - Returns: Encrypted data or throw an error
    func encryptAES(plainText: String, withKey aesKey: Data) throws -> Data
    
    /// Encrypt plain data with AES algorithm
    /// - Parameters:
    ///   - data: plain data that will be encrypted
    ///   - aesKey: AES key that will be used in encryption operation
    /// - Returns: Encrypted data or throw an error
    func encryptAES(data: Data, withKey aesKey: Data) throws -> Data
    
    /// Decrypt encrypted data with AES algorithm
    /// - Parameters:
    ///   - cipherData: Data that has been encrypted
    ///   - aesKey: AES key that will be used in decryption operation
    /// - Returns: plain data or throw an error
    func decryptAES(cipherData: String, withKey aesKey: Data) throws -> Data
    
    /// Decrypt encrypted data with AES algorithm
    /// - Parameters:
    ///   - cipherData: Data that has been encrypted
    ///   - aesKey: AES key that will be used in decryption operation
    /// - Returns: plain data or throw an error
    func decryptAES(cipherData: Data, withKey aesKey: Data) throws -> Data
}

public typealias CryptographyOperationsEngine = RSACryptographyEngine & AESCryptographyEngine
