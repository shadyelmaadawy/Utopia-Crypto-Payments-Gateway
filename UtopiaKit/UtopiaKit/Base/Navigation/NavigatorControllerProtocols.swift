//
//  NavigatorControllerProtocols.swift
//  UtopiaKit
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import UIKit
import SwiftUI
import Foundation

public protocol NavigatorControllerProtocol: AnyObject, UIViewController {
    /// Set view to as main view in navigation stack and remove all previous view
    /// - Parameters:
    ///   - contentView: SwiftUI View
    ///   - animated: a bool value with true or false
    func setView<T: View>(contentView: BaseUIHostingController<T>, animated: Bool)
    /// Push a new view to navigation controller stack
    /// - Parameters:
    ///   - contentView: required view to push
    ///   - animated: a bool value with true or false
    func pushView<T: View>(contentView: BaseUIHostingController<T>, animated: Bool)
    /// Pop SwiftUI view from navigation stack
    /// - Parameter animated:  a bool value with true or false
    func popView(animated: Bool)
}

