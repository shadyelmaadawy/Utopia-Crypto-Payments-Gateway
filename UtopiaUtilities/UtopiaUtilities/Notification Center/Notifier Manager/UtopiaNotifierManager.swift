//
//  UtopiaNotifierManager.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation

public struct UtopiaNotifierManager: NotifierManagerProtocol {

    // MARK: - Properties
    
    static let shared: NotifierManagerProtocol = UtopiaNotifierManager.init()
    private let utopiaNotifier: UtopiaNotifierProtocol
    
    // MARK: - Initialization
    
    private init() {
        self.utopiaNotifier = UtopiaNotifier.init()
    }
}

public extension UtopiaNotifierManager {
    
    func listenToNotifier(observer: Any, selector: Selector, notificationIdentifier: String, object: Any?) {
        
        utopiaNotifier.listenToNotifier(
            observer: observer,
            selector: selector,
            notificationIdentifier: notificationIdentifier, 
            object: object
        )
        
    }
    
     func postToNotifier(notificationIdentifier: String, object: Any?, userInfo: [AnyHashable : Any]?) {
        
        self.utopiaNotifier.postToNotifier(
            
            notificationIdentifier: notificationIdentifier,
            object: object,
            userInfo: userInfo
            
        )
        
    }

    
    
}

