//
//  UtopiaPortApp.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation
import UIKit
import UtopiaUtilities

@main
struct UtopiaPortApp {
    
    // MARK: - Entry-Point
    
    static func main() {
        
        try? UtopiaVaultManager.shared.saveCryptographyKey(
            "MEgCQQCHTUxzcUh+7da8Ia2rk/qxQnV22bXi7JjpELfYsLg37C/28MtJGMoBRzBjALsmNMhkOgYdHAINi8IB19AJO1xlAgMBAAE="
        )

        UIApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            nil,
            NSStringFromClass(AppDelegate.self)
        )
    }
    
}

