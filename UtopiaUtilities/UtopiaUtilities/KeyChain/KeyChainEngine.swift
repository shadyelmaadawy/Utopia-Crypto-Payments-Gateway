//
//  KeyChainEngine.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation
import Security

public final class KeyChainEngine: KeyChainManagementProtocol {
    
    // MARK: - Enums
    
    private enum KeyChainErrorCodes: Error {
        case cannotEncodeBuffer
        case cannotSaveBuffer
        case cannotExtractData
        case invalidDictionary
        case invalidData
        case cannotDecodeBuffer
    }
    
    // MARK: - Initialization
    
    public init() {}

}

public extension KeyChainEngine {
    
    func getValue(forKey valueKey: String) throws -> String {

        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: valueKey,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true,
        ]
        
        var keyChainItem: CFTypeRef?
        guard SecItemCopyMatching(keychainQuery as CFDictionary, &keyChainItem) == noErr else {
            throw KeyChainErrorCodes.cannotExtractData
        }
        guard let keyChainDictionary = keyChainItem as? [String: Any] else {
            throw KeyChainErrorCodes.invalidDictionary
        }
        
        
        guard let secretBuffer = keyChainDictionary[kSecValueData as String] as? Data else {
            throw KeyChainErrorCodes.invalidData
        }
        guard let secretValue = String.init(data: secretBuffer, encoding: .utf8) else {
            throw KeyChainErrorCodes.cannotDecodeBuffer
        }
        return secretValue
    }
    
    func isExists(forKey valueKey: String) -> Bool {

        guard (try? self.getValue(forKey: valueKey)) == nil else {
            return true
        }
        return false

    }
    

    
    func saveValue(value: String, forKey valueKey: String) throws {
        
        if isExists(forKey: value) {
            return
        }
        guard let valueBuffer = value.data(using: .utf8) else {
            throw KeyChainErrorCodes.cannotEncodeBuffer
        }
        
        let keyChainValueAttributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: valueKey,
            kSecValueData as String: valueBuffer,
        ]
        guard SecItemAdd(keyChainValueAttributes as CFDictionary, nil) == noErr else {
            throw KeyChainErrorCodes.cannotSaveBuffer
        }
        

    }
    

}

