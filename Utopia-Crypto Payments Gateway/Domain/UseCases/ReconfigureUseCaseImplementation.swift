//
//  ReconfigureUseCaseImplementation.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation

protocol ReconfigureUseCaseProtocol: AnyObject {
    /// Request from use case to reconfigure wallet
    func requestReconfigure()
}

