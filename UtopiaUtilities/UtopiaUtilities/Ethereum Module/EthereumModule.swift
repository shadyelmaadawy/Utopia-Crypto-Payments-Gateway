//
//  EthereumModule.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

public final class EthereumModule: EthereumModuleProtocol {
    
    // MARK: - Enums

    private enum EthereumErrorCodes: Error {
        case keyMalformed
     }
    
    // MARK: - Initialization

    public init() {}
    
}

// MARK: - EthereumModulePrivateKeyValidateProtocol

public extension EthereumModule {
    
    func isValidKey(_ privateKey: String) -> Bool {
        guard let _ = try? self.getKeyBuffer(for: privateKey) else {
            return false
        }
        return true
    }

}

// MARK: - EthereumModuleWalletValidateProtocol

public extension EthereumModule {
    
    func isValidWallet(_ walletAddress: String) -> Bool {
        
        // Check length
        guard walletAddress.count == 40 || walletAddress.count == 42 else {
            return false
        }

        var hex = walletAddress

        // Check prefix
        if hex.count == 42 {
            let s = hex.index(hex.startIndex, offsetBy: 0)
            let e = hex.index(hex.startIndex, offsetBy: 2)

            guard String(hex[s..<e]) == "0x" else {
                return false
            }

            // Remove prefix
            let hexStart = hex.index(hex.startIndex, offsetBy: 2)
            hex = String(hex[hexStart...])
        }

        // Check hex
        guard hex.rangeOfCharacter(from: CharacterSet.hexadecimals.inverted) == nil else {
            return false
        }

        // Create address bytes
        var addressBytes: [UInt8] = .init()
        for i in stride(from: 0, to: hex.count, by: 2) {
            let s = hex.index(hex.startIndex, offsetBy: i)
            let e = hex.index(hex.startIndex, offsetBy: i + 2)

            guard let b = UInt8(String(hex[s..<e]), radix: 16) else {
                return false
            }
            addressBytes.append(b)
        }
        return true

    }
    
}

// MARK: - EthereumModuleBufferProtocol

public extension EthereumModule {
    
    func getKeyBuffer(for privateKey: String) throws -> Data {
       
        guard privateKey.count == 64 || privateKey.count == 66 else {
            throw EthereumErrorCodes.keyMalformed
        }

        var hexPrivateKey = privateKey

        if hexPrivateKey.count == 66 {
            let s = hexPrivateKey.index(hexPrivateKey.startIndex, offsetBy: 0)
            let e = hexPrivateKey.index(hexPrivateKey.startIndex, offsetBy: 2)
            let prefix = String(hexPrivateKey[s..<e])

            guard prefix == "0x" else {
                throw EthereumErrorCodes.keyMalformed
            }

            // Remove prefix
            hexPrivateKey = String(hexPrivateKey[e...])
        }

        var raw: [UInt8] = .init()
        for i in stride(from: 0, to: hexPrivateKey.count, by: 2) {
            let s = hexPrivateKey.index(hexPrivateKey.startIndex, offsetBy: i)
            let e = hexPrivateKey.index(hexPrivateKey.startIndex, offsetBy: i + 2)

            guard let b = UInt8(String(hexPrivateKey[s..<e]), radix: 16) else {
                throw EthereumErrorCodes.keyMalformed
            }
            raw.append(b)
        }

        let rawData = raw.withUnsafeBytes { Data.init(Array.init($0)) }
        return rawData

    }

}
