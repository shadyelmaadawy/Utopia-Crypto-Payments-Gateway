//
//  WriteNFCCoordinator.swift
//  Utopia-Crypto Payments Port
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation
import UtopiaUtilities
import UtopiaKit

final class WriteNFCCoordinator: BaseAppCoordinator, WriteNFCCoordinatorProtocol {
    
    // MARK: - Initialization

    required init(parentCoordinator: CoordinatorProtocol? = nil) {
        
        super.init(
            parentCoordinator: parentCoordinator
        )
    }

    // MARK: - Operations
    
    override func execute() {
        
        let configureView = WriteNFCConfigurator.assemble(
            coordinator: self
        )
        self.initializationCoordinator(
            with: configureView,
            animated: true, 
            operation: .rootView
        )
    }


    func navigateTo(destination: WriteNFCDestinations) {
        
        switch(destination) {
            case .none: break
        }
        
    }

}

