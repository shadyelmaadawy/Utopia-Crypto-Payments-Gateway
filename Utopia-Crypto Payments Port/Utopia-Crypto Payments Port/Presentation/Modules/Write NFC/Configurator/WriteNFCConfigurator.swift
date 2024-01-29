//
//  WriteNFCConfigurator.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 26/01/2024.
//

import SwiftUI

final class WriteNFCConfigurator {
    
    /// Assemble write nfc view with dependency injection
    /// - Returns: assembled nfc view
    class func assemble(coordinator: WriteNFCCoordinatorProtocol) -> some View {
        
        let nfcRepository = NFCRepositoryImplementation.init()
        let writeUseCase = WriteUseCaseImplementation.init(
            nfcRepository: nfcRepository
        )
        let validateUseCase = ValidatePrivateKeyUseCaseImplementation.init()
        
        let viewModel = WriteNFCViewModel.init(
            coordinator: coordinator,
            writeUseCaseImplementation: writeUseCase,
            validateUseCaseImplementation: validateUseCase
        )
        let view = WriteNFCView.init(
            viewModel: viewModel
        )
        return view
    }
    
}

