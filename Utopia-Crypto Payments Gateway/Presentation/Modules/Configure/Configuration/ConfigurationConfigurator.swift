//
//  ConfigurationConfigurator.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import SwiftUI
import Foundation

final class ConfigurationConfigurator {
    
    /// Assemble configuration view with dependency injection
    /// - Returns: assembled nfc view
    class func assemble(coordinator: ConfigureCoordinatorProtocol) -> some View {
        
        let configureUseCase = ConfigureUseCaseImplementation.init()
        let validateUseCase = ValidateEthereumWalletUseCaseImplementation.init()
        
        let viewModel = ConfigureViewModel.init(
            configureUseCase: configureUseCase,
            validateUseCase: validateUseCase, 
            coordinator: coordinator
        )
        
        let view = ConfigureView.init(
            viewModel: viewModel
        )
        return view
    }
}
