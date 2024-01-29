//
//  PayUseCaseProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 22/01/2024.
//

import Combine
import Foundation

protocol PayUseCaseProtocol: AnyObject {    
    /// Request to perform pay request in eth network
    /// - Parameter ethAmount: eth amount of pay
    /// - Returns: throw an error or publisher with transaction hash or error
    func pay(amount ethAmount: Double) async throws -> AnyPublisher<OutputPayMessageProtocol, Error>
}
