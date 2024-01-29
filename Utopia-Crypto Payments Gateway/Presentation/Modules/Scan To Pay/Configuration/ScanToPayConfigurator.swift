//
//  ScanToPayConfigurator.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import SwiftUI

final class ScanToPayConfigurator {
    
    /// Assemble Scan to pay view with dependency injection
    /// - Returns: assembled scan to pay view
    class func assemble(coordinator: ScanToPayCoordinatorProtocol) -> some View {
        
        let nfcRepository = NFCRepositoryImplementation.init(
            nfcService: NFCServiceImplementation.init()
        )
        let payRepository = PayRepositoryImplementation.init(
            payService: Web3EngineService.init()
        )
        let payUseCase = PayUseCaseImplementation.init(
            nfcRepository: nfcRepository,
            payRepository: payRepository
        )
        let validateUseCase = ValidateEthereumPayValueUseCaseImplementation.init()
        
        let viewModel = ScanToPayViewModel.init(
            payUseCase: payUseCase,
            validateUseCase: validateUseCase,
            coordinator: coordinator
        )
        let view = ScanToPayView.init(
            viewModel: viewModel
        )
        return view
    }
}
