//
//  NavigatorProtocols.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import UIKit
import UtopiaKit
import SwiftUI

public protocol NavigatorProtocol: AnyObject {
    /// Initialization navigator with window
    /// - Parameter frame: required size to window frame
    func initWindow(window: inout UIWindow)
    /// Set view to as main view in navigation stack and remove all previous view
    /// - Parameters:
    ///   - contentView: SwiftUI View
    ///   - animated: a bool value with true or false
    func setView<T: View>(contentView: BaseUIHostingController<T>, animated: Bool)
    /// Push SwiftUI View to stack
    /// - Parameters:
    ///   - contentView:required view to be pushed
    ///   - animated: animate view push or disable it
    func pushView<T: View>(contentView: BaseUIHostingController<T>, animated: Bool)
    /// Pop SwiftUI View from stack
    /// - Parameter animated: animate view pop or disable it
    func popView(animated: Bool)

}

