//
//  ConfigureCoordinator.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import UtopiaKit
import UtopiaUtilities

final class ConfigureCoordinator: BaseAppCoordinator, ConfigureCoordinatorProtocol {
    
    // MARK: - Initialization

    required init(parentCoordinator: CoordinatorProtocol? = nil) {
        
        super.init(
            parentCoordinator: parentCoordinator
        )
    }

    // MARK: - Operations
    
    override func execute() {
        
        let configureView = ConfigurationConfigurator.assemble(
            coordinator: self
        )
        super.initializationCoordinator(
            with: configureView,
            animated: true,
            operation: .rootView
        )
    }


    func navigateTo(destination: ConfigurationDestinations) {
        
        switch(destination) {
            
            case .homeView:
                let homeCoordinator = HomeCoordinator.init(
                    parentCoordinator: self.parentCoordinator
                )
                homeCoordinator.execute()
            
            break
        }
        
    }

}

