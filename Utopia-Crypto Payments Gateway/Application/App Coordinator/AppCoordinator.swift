//
//  AppCoordinator.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation
import UtopiaKit
import UtopiaUtilities

final class AppCoordinator: BaseAppCoordinator {
    
    // MARK: - Properties
    
    private let walletQueryManager: WalletManagerConfigureProtocol = UtopiaStorageManager.shared
    
    // MARK: - Initialization
    
    required init(parentCoordinator: CoordinatorProtocol? = nil) {
        
        super.init(
            parentCoordinator: parentCoordinator
        )
    }

    // MARK: - Operations
    
    override func execute() {
        
        var coordinator: CoordinatorProtocol
        
        if(walletQueryManager.isConfigured()) {
            
            coordinator = HomeCoordinator.init(
                parentCoordinator: self
            )
            
        } else {
            
            coordinator = ConfigureCoordinator.init(
                parentCoordinator: self
            )
            
        }

        coordinator.execute()

    }
}
    
