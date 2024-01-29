//
//  ValidateEthereumPayValueUseCaseImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

final class ValidateEthereumPayValueUseCaseImplementation: ValidateEthereumPayValueUseCaseProtocol {
    
    func isValidValue(for ethValue: Double) -> Bool {
        return ethValue >= 0.005
    }
    
    
}
