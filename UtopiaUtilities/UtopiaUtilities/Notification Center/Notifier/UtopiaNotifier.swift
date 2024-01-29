//
//  UtopiaNotifier.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation

public final class UtopiaNotifier: UtopiaNotifierProtocol {
    
    // MARK: - Properties
    
    private let threadsLock = NSLock.init()
    private let notifierCenter: NotificationCenter
    
    // MARK: - Initialization
    
    init(notifierCenter: NotificationCenter = NotificationCenter.default) {
        self.notifierCenter = notifierCenter
    }
    
}

// MARK: - Listener Operations

public extension UtopiaNotifier {
    
    func listenToNotifier(observer: Any, selector: Selector, notificationIdentifier: String, object: Any? = nil) {
        
        defer { threadsLock.unlock() }
        
        threadsLock.withLock {
            
            self.notifierCenter.addObserver(
                observer,
                selector: selector,
                name: notificationIdentifier.createNotification(),
                object: object
            )

        }
        
    }

}
// MARK: - Post Operations

public extension UtopiaNotifier {
    
    func postToNotifier(notificationIdentifier: String, object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        
        defer { threadsLock.unlock() }
        
        threadsLock.withLock {
            self.notifierCenter.post(
                name: notificationIdentifier.createNotification(),
                object: object, userInfo: userInfo
            )
        }
    }


}
