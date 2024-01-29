//
//  UtopiaNotifierProtocols.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation

public protocol UtopiaNotifierListenerProtocol: AnyObject {
    /// Add an observer to listen
    func listenToNotifier(observer: Any, selector: Selector, notificationIdentifier: String, object: Any?)
}

public protocol UtopiaNotifierPostProtocol: AnyObject {
    /// Post a notification to listeners
    func postToNotifier(notificationIdentifier: String, object: Any?, userInfo: [AnyHashable: Any]?)
}

public typealias UtopiaNotifierProtocol = UtopiaNotifierListenerProtocol & UtopiaNotifierPostProtocol
