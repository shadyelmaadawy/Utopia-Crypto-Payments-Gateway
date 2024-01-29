//
//  ScanToPayViewModel.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Combine
import Foundation

final class ScanToPayViewModel: ScanToPayViewModelTypeAlias {
    
    // MARK: Navigation Layer
    
    private unowned let coordinator: ScanToPayCoordinatorProtocol
    
    // MARK: - Domain Layer
    
    private let payUseCase: PayUseCaseProtocol
    private let validateUseCase: ValidateEthereumPayValueUseCaseProtocol
    
    // MARK: - Input / Output Protocols
    
    var inputs: ScanToPayViewModelInputProtocol {
        return self
    }
    
    var outputs: ScanToPayViewModelOutputProtocol {
        return self
    }
    
    // MARK: - Inputs
    
    let payValue = CurrentValueSubject<Double, Never>(0.00)
    let payButtonClickedEvent = PassthroughSubject<Void, Never>()
    
    // MARK: - Outputs
    
    var payButtonEnabled: AnyPublisher<Bool, Never> {
        return payButtonEnabledSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private let payButtonEnabledSubject = CurrentValueSubject<Bool, Never>(false)

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

    // MARK: - Initialization
    
    init(
        payUseCase: PayUseCaseProtocol,
        validateUseCase: ValidateEthereumPayValueUseCaseProtocol,
        coordinator: ScanToPayCoordinatorProtocol) {
        
        self.payUseCase = payUseCase
        self.validateUseCase = validateUseCase
        self.coordinator = coordinator
        
        super.init()
        self.bindInputs()
        self.bindOutputs()
    }
    
}

// MARK: - Data Binding

private extension ScanToPayViewModel {
    
    func bindInputs() {
        
        self.payButtonClickedEvent
            .throttle(
                for: 0.25,
                scheduler: DispatchQueue.main,
                latest: true
            )
            .sink(receiveValue: { [ weak self] _ in
                
                guard let self = self else {
                    return
                }
                self.showLoadingSubject.send(true)
                
                Task.init(priority: .userInitiated) {
                    do {
                        
                        try await self.payUseCase.pay(amount: self.payValue.value)
                            .receive(on: DispatchQueue.main)
                            .sink(receiveCompletion: { value in
                              
                                switch(value) {
                                    
                                    case .failure(let failure):
                                        self.showTextMessageSubject.send(failure.localizedDescription)
                                    default: break
                                }
                                
                            }) { value in
                                
                                self.showTextMessageSubject.send("Pay succeeds, hash: \(value.transactionHash)")
                                
                            }
                            .store(in: &self.subscriptions)
                        
                    } catch {
                        self.showTextMessageSubject.send(error.localizedDescription)
                    }
                    self.showLoadingSubject.send(false)
                }}
            )
            .store(in: &subscriptions)
    }
    
    func bindOutputs() {
        
        self.payValue
            .throttle(
                for: 0.3,
                scheduler: DispatchQueue.main,
                latest: true
            )
            .map({ [weak self] value in
                guard let self = self else {
                    return false
                }
                return self.validateUseCase.isValidValue(for: value)
            })
            .sink(receiveValue: { [weak self] value in
                guard let self = self else {
                    return
                }

                self.payButtonEnabledSubject.send(value)
            })
            .store(in: &self.subscriptions)

    }
    
}
