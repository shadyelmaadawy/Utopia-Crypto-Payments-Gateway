//
//  WriteNFCCoordinatorProtocols.swift
//  Utopia-Crypto Payments Port
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation
import UtopiaUtilities

enum WriteNFCDestinations {
    case none
}

protocol WriteNFCCoordinatorProtocol: AnyObject {
    func navigateTo(destination: WriteNFCDestinations)
}
