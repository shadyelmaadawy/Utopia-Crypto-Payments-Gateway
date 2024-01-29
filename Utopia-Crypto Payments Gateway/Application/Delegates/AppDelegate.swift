//
//  AppDelegate.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        let sceneConfiguration = UISceneConfiguration.init(
            name: nil,
            sessionRole: connectingSceneSession.role
        )
        
        if connectingSceneSession.role == .windowApplication {
            sceneConfiguration.delegateClass = SceneDelegate.self
        }
        return sceneConfiguration
    }
    
}
