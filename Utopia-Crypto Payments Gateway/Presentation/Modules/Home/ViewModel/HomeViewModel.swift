//
//  HomeViewModel.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation
import Combine

final class HomeViewModel: HomeViewModelTypeAlias {
    
    // MARK: - Domain Layer
    
    private let reconfigureUseCase: ReconfigureUseCaseProtocol
    
    // MARK: - Navigation Layer
    
    private unowned let coordinator: HomeCoordinatorProtocol
    
    // MARK: - Input / Output Protocols
    
    var inputs: HomeViewModelInputProtocol {
        return self
    }
    
    var outputs: HomeViewModelOutputProtocol {
        return self
    }
    
    // MARK: - Inputs
    
    let scanToPayButtonClickedEvent = PassthroughSubject<Void, Never>()
    let reConfigureButtonClickedEvent = PassthroughSubject<Void, Never>()
    

    // MARK: - Initialization

    init(coordinator: HomeCoordinatorProtocol, reconfigureUseCase: ReconfigureUseCaseProtocol) {

        self.coordinator = coordinator
        self.reconfigureUseCase = reconfigureUseCase
        
        super.init()
        self.bindInputs()
    }
    
}

// MARK: - Data Binding

private extension HomeViewModel {
    
    func bindInputs() {
        
        self.scanToPayButtonClickedEvent
            .throttle(
                for: 0.3,
                scheduler: DispatchQueue.main,
                latest: true
            )
            .sink(receiveValue: { [weak self] _ in
                
                guard let self = self else  {
                    return
                }
                
                self.coordinator.navigateTo(destination: .scanToPay)
            })
            .store(in: &subscriptions)
        
        self.reConfigureButtonClickedEvent
            .throttle(
                for: 0.15,
                scheduler: DispatchQueue.main,
                latest: true
            )
            .sink(receiveValue: { [weak self] in
                   
                    guard let self = self else  {
                        return
                    }
                    
                    self.reconfigureUseCase.requestReconfigure()
                    self.coordinator.navigateTo(destination: .reConfigure)

            })
            .store(in: &subscriptions)
    }
    
}

