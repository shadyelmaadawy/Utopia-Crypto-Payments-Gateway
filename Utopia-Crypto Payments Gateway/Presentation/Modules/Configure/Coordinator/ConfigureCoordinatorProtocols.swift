//
//  ConfigureCoordinatorProtocols.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation
import UtopiaUtilities

enum ConfigurationDestinations {
    case homeView
}

protocol ConfigureCoordinatorProtocol: AnyObject {
    func navigateTo(destination: ConfigurationDestinations)
}


