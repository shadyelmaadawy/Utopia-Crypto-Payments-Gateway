//
//  HomeCoordinatorProtocols.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation
import UtopiaUtilities

enum HomeDestinations {
    case reConfigure
    case scanToPay
}

protocol HomeCoordinatorProtocol: AnyObject {
    func navigateTo(destination: HomeDestinations)
}
