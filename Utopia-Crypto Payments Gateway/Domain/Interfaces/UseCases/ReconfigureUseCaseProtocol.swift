//
//  ReconfigureUseCaseProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation


final class ReconfigureUseCaseImplementation {
    
    // MARK: - Properties
    
    private let walletDeleteManager: WalletManagerDeleteProtocol

    // MARK: - Initialization

    init(walletDeleteManager: WalletManagerDeleteProtocol = UtopiaStorageManager.shared) {
        self.walletDeleteManager = walletDeleteManager
    }
    
}

extension ReconfigureUseCaseImplementation: ReconfigureUseCaseProtocol {
    
    func requestReconfigure() {
        walletDeleteManager.deleteWallet()
    }

}
