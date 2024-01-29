//
//  PayEngineServiceProtocol.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import Combine
import Foundation

protocol PayEngineServiceProtocol: AnyObject {
    /// Request to perform a pay request in network
    /// - Parameter message: Pay Message
    /// - Returns: Publisher in main thread
    func pay(with message: PayMessageRequestProtocol) -> AnyPublisher<String, Error>
}
