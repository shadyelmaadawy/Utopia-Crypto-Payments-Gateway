//
//  ValidateEthereumWalletUseCaseImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import UtopiaUtilities

final class ValidateEthereumWalletUseCaseImplementation {
    
    // MARK: - Properties
    
    private let ethereumModule: EthereumModuleWalletValidateProtocol
    
    // MARK: - Initialization
    
    init(ethereumModule: EthereumModuleWalletValidateProtocol = EthereumModule.init()) {
        self.ethereumModule = ethereumModule
    }
    
}

// MARK: - Operations

extension ValidateEthereumWalletUseCaseImplementation: ValidateEthereumWalletUseCaseProtocol {

    func isValidWallet(_ walletAddress: String) -> Bool {

        return ethereumModule.isValidWallet(walletAddress)

    }
    
    
}

