//
//  WriteNFCViewModel.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 24/01/2024.
//

import Combine
import Foundation

final class WriteNFCViewModel: WriteNFCViewModelTypeAlias  {
    
    // MARK: - Domain Layer
    
    private let writeUseCase: WriteUserCaseProtocol
    private let validatePrivateKeyUseCase: ValidatePrivateKeyUseCaseProtocol
    
    // MARK: - Navigation Layer
    
    private unowned let coordinator: WriteNFCCoordinatorProtocol

    // MARK: - Input / Output Protocols
    
    var inputs: WriteNFCInputViewModelProtocol {
        return self
    }
    
    var outputs: WriteNFCOutputViewModelProtocol {
        return self
    }    

    // MARK: - Inputs
    
    let walletPrivateKeyValue = CurrentValueSubject<String, Never>("")
    let writeButtonClickedEvent = PassthroughSubject<Void, Never>()

    // MARK: - Outputs

    var showLoading: AnyPublisher<Bool, Never> {
        return showLoadingSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private let showLoadingSubject = CurrentValueSubject<Bool, Never>(false)

    var isWriteButtonEnabled: AnyPublisher<Bool, Never> {
        return enableWriteButton
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private let enableWriteButton = CurrentValueSubject<Bool, Never>(true)

    var textMessage: AnyPublisher<String, Never> {
        return textMessageSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private let textMessageSubject = PassthroughSubject<String, Never>()

    // MARK: - Initialization
    
    init(
        coordinator: WriteNFCCoordinatorProtocol,
        writeUseCaseImplementation: WriteUserCaseProtocol, validateUseCaseImplementation: ValidatePrivateKeyUseCaseProtocol) {
            
            self.coordinator = coordinator
            self.writeUseCase = writeUseCaseImplementation
            self.validatePrivateKeyUseCase = validateUseCaseImplementation
        
        super.init()
        
        self.bindInputs()
        self.bindOutputs()

    }
    
}

// MARK: - Data Binding

private extension WriteNFCViewModel {
    
    func bindInputs() {
        
        self.writeButtonClickedEvent
            .throttle(
                for: 0.25,
                scheduler: RunLoop.main,
                latest: true
            )
            .sink(receiveValue: { [weak self] in
                
                guard let self = self else {
                    return
                }
                showLoadingSubject.send(true)
                
                Task.init(priority: .userInitiated) {
                    do {
                        try await self.writeUseCase.writeWallet(for: self.walletPrivateKeyValue.value)
                        self.textMessageSubject.send("Private key has been written!")

                    } catch {
                        self.textMessageSubject.send(error.localizedDescription)
                    }
                    self.showLoadingSubject.send(false)
                }
            })
            .store(in: &subscriptions)

    }
    
    func bindOutputs() {
        
        self.walletPrivateKeyValue
            .throttle(
                for: 0.30,
                scheduler: DispatchQueue.global(qos: .userInteractive),
                latest: true
            )
            .map({ [weak self] value in
                
                guard let self = self else {
                    return false
                }
                
                return self.validatePrivateKeyUseCase.isValidPrivateKey(for: value)
            })
            .sink(receiveValue: { [weak self] value in
                
                guard let self = self else {
                    return
                }
                
                self.enableWriteButton.send(value)
            })
            .store(in: &subscriptions)
    }
    

}

