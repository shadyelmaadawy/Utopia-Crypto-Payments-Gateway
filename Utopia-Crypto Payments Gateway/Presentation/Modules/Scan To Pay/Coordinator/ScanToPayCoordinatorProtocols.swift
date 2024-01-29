//
//  ScanToPayCoordinatorProtocols.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation
import UtopiaUtilities

enum ScanToPayDestinations {
    case none
}

protocol ScanToPayCoordinatorProtocol: AnyObject {
    func navigateTo(destination: ScanToPayDestinations)
}

