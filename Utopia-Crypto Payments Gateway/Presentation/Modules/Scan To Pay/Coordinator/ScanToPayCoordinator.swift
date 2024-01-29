//
//  ScanToPayCoordinator.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation
import UtopiaUtilities

final class ScanToPayCoordinator: BaseAppCoordinator, ScanToPayCoordinatorProtocol {
    
    // MARK: - Initialization
    
    required init(parentCoordinator: CoordinatorProtocol? = nil) {
        
        super.init(
            parentCoordinator: parentCoordinator
        )
    }
    
    // MARK: - Operations

    override func execute() {
        
        let scanToPayView = ScanToPayConfigurator.assemble(
            coordinator: self
        )
        super.initializationCoordinator(
            with: scanToPayView,
            animated: true,
            operation: .push
        )

    }

    func navigateTo(destination: ScanToPayDestinations) {
    
        
    }
    
    
    
}
