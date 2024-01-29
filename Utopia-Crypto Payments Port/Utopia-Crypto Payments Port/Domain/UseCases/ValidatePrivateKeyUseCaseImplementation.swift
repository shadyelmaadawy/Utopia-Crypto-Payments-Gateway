//
//  ValidatePrivateKeyUseCaseImplementation.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation
import UtopiaUtilities

final class ValidatePrivateKeyUseCaseImplementation {
   
    // MARK: - Properties
    
    private let ethereumValidator: EthereumModulePrivateKeyValidateProtocol
    
    // MARK: - Initialization
    
    init(ethereumValidator: EthereumModulePrivateKeyValidateProtocol = EthereumModule.init()) {
        self.ethereumValidator = ethereumValidator
    }
    
}

// MARK: - Operations

extension ValidatePrivateKeyUseCaseImplementation: ValidatePrivateKeyUseCaseProtocol {
    
    func isValidPrivateKey(for key: String) -> Bool {
        
        return ethereumValidator.isValidKey(key)

    }

}
