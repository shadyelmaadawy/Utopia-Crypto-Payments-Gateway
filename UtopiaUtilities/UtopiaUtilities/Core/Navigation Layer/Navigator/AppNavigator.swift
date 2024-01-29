//
//  AppNavigator.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import UIKit
import UtopiaKit
import SwiftUI

public final class AppNavigator: NavigatorProtocol {

    // MARK: - Properties

    /// UI Window that will be used to host main view
    private var window: UIWindow!
    /// Navigation controller that will be responsible for navigating
    private var navigationController: NavigatorControllerProtocol!
    /// instance of object
    internal static let instance: NavigatorProtocol = AppNavigator.init()
    
    // MARK: - Initialization
    
    private init() {}
    
    public func initWindow(window: inout UIWindow) {
        
        self.window = window
        self.navigationController = BaseUINavigationController.init()
        self.configure()
        
    }
    
}

// MARK: - Configure

private extension AppNavigator {
    
    func configure() {
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()


    }
    
}

// MARK: - Operations

public extension AppNavigator {
    
    func setView<T: View>(contentView: BaseUIHostingController<T>, animated: Bool) {
        self.navigationController.setView(
            contentView: contentView,
            animated: true
        )
    }
    
    func pushView<T: View>(contentView: BaseUIHostingController<T>, animated: Bool)  {
        self.navigationController.pushView(
            contentView: contentView, 
            animated: true
        )
    }
    
    func popView(animated: Bool) {
        self.navigationController.popView(animated: animated)
    }

}

