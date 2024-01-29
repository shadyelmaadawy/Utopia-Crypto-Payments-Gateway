//
//  HomeViewConfigurator.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import SwiftUI

final class HomeViewConfigurator {

    /// assemble home view with dependency injection
    /// - Returns: assembled home to pay view
    class func assemble(coordinator: HomeCoordinatorProtocol) -> some View {
        
        let reconfigureUseCase = ReconfigureUseCaseImplementation.init()
      
        let viewModel = HomeViewModel.init(
            coordinator: coordinator, 
            reconfigureUseCase: reconfigureUseCase
        )
        
        let view = HomeView.init(
            viewModel: viewModel
        )
        return view
    }
}

