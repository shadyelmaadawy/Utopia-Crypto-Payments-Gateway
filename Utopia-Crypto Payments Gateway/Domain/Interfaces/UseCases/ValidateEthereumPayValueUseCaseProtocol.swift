//
//  ValidateEthereumPayValueUseCaseProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation

protocol ValidateEthereumPayValueUseCaseProtocol: AnyObject {
    
    /// Validate if the required amount is valid to send, currently minimum value is 0.005 eth.
    /// - Parameter ethValue: required value to validate
    /// - Returns: true if is valid or false
    func isValidValue(for ethValue: Double) -> Bool
}
