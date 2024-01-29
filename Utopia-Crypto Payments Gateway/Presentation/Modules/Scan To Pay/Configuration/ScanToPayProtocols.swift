//
//  ScanToPayProtocols.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Combine
import Foundation
import UtopiaUtilities

protocol ScanToPayViewModelInputProtocol {
    /// Subject to stream wallet address
    var payValue: CurrentValueSubject<Double, Never> { get }
    /// Subject to send pay button event
    var payButtonClickedEvent: PassthroughSubject<Void, Never> { get }
}

protocol ScanToPayViewModelOutputProtocol {
    /// Publisher to enable or disable pay button
    var payButtonEnabled: AnyPublisher<Bool, Never> { get }
    /// Publisher to show or hide loading indicator
    var showLoading: AnyPublisher<Bool, Never> { get }
    /// Publisher to show a text message ( dialog )
    var showTextMessage: AnyPublisher<String, Never> { get }
}

protocol ScanToPayViewModelProtocol: ObservableObject, AnyObject {
    /// Scan To pay ViewModel Inputs
    var inputs: ScanToPayViewModelInputProtocol { get }
    /// Scan To pay ViewModel Outputs
    var outputs: ScanToPayViewModelOutputProtocol { get }
    /// Initialization View Model with required parameters
    init(payUseCase: PayUseCaseProtocol, validateUseCase: ValidateEthereumPayValueUseCaseProtocol, coordinator: ScanToPayCoordinatorProtocol)
}

typealias ScanToPayViewModelTypeAlias = UtopiaBaseViewModel & ScanToPayViewModelInputProtocol & ScanToPayViewModelOutputProtocol & ScanToPayViewModelProtocol
