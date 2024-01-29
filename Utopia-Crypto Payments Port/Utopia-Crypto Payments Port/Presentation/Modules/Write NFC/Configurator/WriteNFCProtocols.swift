//
//  WriteNFCProtocols.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 26/01/2024.
//

import Combine
import Foundation
import UtopiaUtilities

protocol WriteNFCInputViewModelProtocol: AnyObject {
    /// Subject to submit private key to stream
    var walletPrivateKeyValue: CurrentValueSubject<String, Never>{ get }
    /// Subject to send write button click event
    var writeButtonClickedEvent: PassthroughSubject<Void, Never> { get }
}

protocol WriteNFCOutputViewModelProtocol: AnyObject {
    /// Publisher to show or hide loading indicator
    var showLoading: AnyPublisher<Bool, Never> { get }
    /// Publisher to enable or disable write button
    var isWriteButtonEnabled: AnyPublisher<Bool, Never> { get }
    /// Publisher to show an message
    var textMessage: AnyPublisher<String, Never> { get }
}

protocol WriteNFCViewModelProtocol: ObservableObject, AnyObject {
    /// Write ViewModel Inputs
    var inputs: WriteNFCInputViewModelProtocol { get }
    /// Write ViewModel Outputs
    var outputs: WriteNFCOutputViewModelProtocol { get }
    /// Initialization View Model with required parameters
    init(coordinator: WriteNFCCoordinatorProtocol, writeUseCaseImplementation: WriteUserCaseProtocol, validateUseCaseImplementation: ValidatePrivateKeyUseCaseProtocol)
}

typealias WriteNFCViewModelTypeAlias = UtopiaBaseViewModel & WriteNFCViewModelProtocol & WriteNFCInputViewModelProtocol & WriteNFCOutputViewModelProtocol

