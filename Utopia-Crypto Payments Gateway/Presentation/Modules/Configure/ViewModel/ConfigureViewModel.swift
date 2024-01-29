//
//  ConfigureViewModel.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Combine
import Foundation

final class ConfigureViewModel: ConfigureViewModelTypeAlias {
    
    // MARK: - Navigation Layer
    
    private unowned let coordinator: ConfigureCoordinatorProtocol
    
    // MARK: - Domain Layer
    
    private let configureUseCase: ConfigureUseCaseProtocol
    private let validateUseCase: ValidateEthereumWalletUseCaseProtocol
    
    // MARK: - Input / Output Protocols

    var inputs: ConfigureInputViewModelProtocol {
        return self
    }
    
    var outputs: ConfigureOutputViewModelProtocol {
        return self
    }
    
    // MARK: - Inputs
    
    let walletAddressValue = CurrentValueSubject<String, Never>("")
    let continueButtonClicked = PassthroughSubject<Void, Never>()
    
    // MARK: - Outputs

    var showLoading: AnyPublisher<Bool, Never> {
        return showLoadingSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private let showLoadingSubject = CurrentValueSubject<Bool, Never>(false)
    
    var showTextMessage: AnyPublisher<String, Never> {
        return showTextMessageSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private let showTextMessageSubject = PassthroughSubject<String, Never>()

    
    var continueButtonEnabled: AnyPublisher<Bool, Never> {
        continueButtonEnabledSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private let continueButtonEnabledSubject = CurrentValueSubject<Bool, Never>(false)

    // MARK: - Initialization

    init(configureUseCase: ConfigureUseCaseProtocol, validateUseCase: ValidateEthereumWalletUseCaseProtocol, coordinator: ConfigureCoordinatorProtocol) {
        
        self.configureUseCase = configureUseCase
        self.validateUseCase = validateUseCase
        self.coordinator = coordinator
        
        super.init()
        
        self.bindInputs()
    }
    
}

// MARK: - Data Binding

private extension ConfigureViewModel {
    
    func bindInputs() {
        
        walletAddressValue.throttle(
                for: 0.3,
                scheduler: DispatchQueue.main,
                latest: true
            )
            .map({ [weak self] value in
                guard let self = self else {
                    return false
                }
                return self.validateUseCase.isValidWallet(value)
            })
            .sink(receiveValue: { [weak self] value in
 
                guard let self = self else {
                    return
                }
                self.continueButtonEnabledSubject.send(value)
                
            })
            .store(in: &self.subscriptions)

        
        continueButtonClicked
            .throttle(
                for: 0.25,
                scheduler: DispatchQueue.main,
                latest: true
            )
            .sink(receiveValue: { [weak self] in
                
                guard let self = self else {
                    return
                }
                
                do {
                    
                    try configureUseCase.setWalletAddress(walletAddressValue.value)
                    self.showTextMessageSubject.send("Wallet had been configured!")
                    self.coordinator.navigateTo(destination: .homeView)

                } catch {
                    self.showTextMessageSubject.send(error.localizedDescription)
                }
            })
            .store(in: &self.subscriptions)
    }
    
}
