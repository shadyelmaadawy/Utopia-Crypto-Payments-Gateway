//
//  AppDelegate.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {

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
