//
//  UtopiaBaseViewModel.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Combine
import Foundation

open class UtopiaBaseViewModel {
    
    // MARK: - Properties
    
    public lazy var subscriptions: Set<AnyCancellable> = {
        return Set<AnyCancellable>()
    }()
    
    // MARK: - Initialization
    
    public init() { }
    
    // MARK: - Object Life Cycle;
    
    deinit {
        
        subscriptions.forEach({$0.cancel()})
        subscriptions.removeAll()
    }


}

