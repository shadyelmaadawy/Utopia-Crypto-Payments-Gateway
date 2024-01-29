//
//  ConfigurationProtocols.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Combine
import Foundation
import UtopiaUtilities

protocol ConfigureInputViewModelProtocol: AnyObject {
    /// Subject to stream wallet address
    var walletAddressValue: CurrentValueSubject<String, Never> { get }
    /// Subject to send continue button click event
    var continueButtonClicked: PassthroughSubject<Void, Never> { get }
}

protocol ConfigureOutputViewModelProtocol: AnyObject {
    /// Publisher to enable or disable continue button
    var continueButtonEnabled: AnyPublisher<Bool, Never> { get }
    /// Publisher to show an error message
    var showTextMessage: AnyPublisher<String, Never> { get }
}

protocol ConfigureViewModelProtocol: ObservableObject, AnyObject {
    /// Configure ViewModel Inputs
    var inputs: ConfigureInputViewModelProtocol { get }
    /// Configure ViewModel Outputs
    var outputs: ConfigureOutputViewModelProtocol { get }
    /// Initialization View Model with required parameters
    init(configureUseCase: ConfigureUseCaseProtocol, validateUseCase: ValidateEthereumWalletUseCaseProtocol, coordinator: ConfigureCoordinatorProtocol)
}

typealias ConfigureViewModelTypeAlias = UtopiaBaseViewModel & ConfigureInputViewModelProtocol & ConfigureOutputViewModelProtocol & ConfigureViewModelProtocol
