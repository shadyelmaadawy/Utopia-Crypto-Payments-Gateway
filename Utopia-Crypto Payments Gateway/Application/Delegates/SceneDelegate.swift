//
//  SceneDelegate.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import UIKit
import SwiftUI
import UtopiaKit
import UtopiaUtilities

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Properties
    
    var window: UIWindow?
    
    private lazy var appCoordinator: CoordinatorProtocol = {
        
        guard var window = self.window else {
            fatalError("Window object is nil")
        }
        
        let appCoordinator = AppCoordinator.init()
        appCoordinator.initWindow(window: &window)
        
        return appCoordinator
        
    }()
    
    
}

// MARK: - Operations

extension SceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        window = UIWindow.init(
            windowScene: windowScene
        )
        
        appCoordinator.execute()
    }
    
}
