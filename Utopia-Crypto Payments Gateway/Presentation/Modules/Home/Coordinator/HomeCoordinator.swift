//
//  HomeCoordinator.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import UtopiaKit
import UtopiaUtilities

final class HomeCoordinator: BaseAppCoordinator, HomeCoordinatorProtocol {
  
    // MARK: - Initialization
    
    required init(parentCoordinator: CoordinatorProtocol? = nil) {
        
        super.init(
            parentCoordinator: parentCoordinator
        )
    }
    
    
    // MARK: - Operations
    
    override func execute() {

        let homeView = HomeViewConfigurator.assemble(
            coordinator: self
        )
        super.initializationCoordinator(
            with: homeView,
            animated: true,
            operation: .rootView
        )
    }
    
    func navigateTo(destination: HomeDestinations) {
        
        switch(destination) {
            
            case .scanToPay:
            
                let scanToPayCoordinator = ScanToPayCoordinator.init(
                    parentCoordinator: self
                )
                scanToPayCoordinator.execute()

            case .reConfigure:
            
                let reconfigureCoordinator = ConfigureCoordinator.init(
                    parentCoordinator: self.parentCoordinator
                )
                reconfigureCoordinator.execute()

        }
        
    }
    
}

