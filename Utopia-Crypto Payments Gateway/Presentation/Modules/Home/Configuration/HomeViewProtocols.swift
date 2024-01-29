//
//  HomeViewProtocols.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Combine
import Foundation
import UtopiaUtilities

protocol HomeViewModelInputProtocol {
    /// Subject to request navigate to scan to pay view
    var scanToPayButtonClickedEvent: PassthroughSubject<Void, Never> { get }
    /// Subject to request to navigate configure view
    var reConfigureButtonClickedEvent: PassthroughSubject<Void, Never> { get }
}

protocol HomeViewModelOutputProtocol {}

protocol HomeViewModelProtocol: ObservableObject, AnyObject {
    /// Home ViewModel Inputs
    var inputs: HomeViewModelInputProtocol { get }
    /// Home ViewModel Outputs
    var outputs: HomeViewModelOutputProtocol { get }
    /// Initialization View Model with required parameters
    init(coordinator: HomeCoordinatorProtocol, reconfigureUseCase: ReconfigureUseCaseProtocol)
}

typealias HomeViewModelTypeAlias = UtopiaBaseViewModel & HomeViewModelInputProtocol & HomeViewModelOutputProtocol & HomeViewModelProtocol
