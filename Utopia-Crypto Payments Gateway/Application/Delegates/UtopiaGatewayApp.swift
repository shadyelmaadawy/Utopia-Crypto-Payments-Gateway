//
//  UtopiaGatewayApp.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 13/01/2024.
//

import SwiftUI
import UtopiaUtilities

@main
struct UtopiaGatewayApp {
    
    // MARK: - Entry-Point
    
    static func main() {
        try? UtopiaVaultManager.shared.saveCryptographyKey("MIIBOgIBAAJBAIdNTHNxSH7t1rwhrauT+rFCdXbZteLsmOkQt9iwuDfsL/bwy0kYygFHMGMAuyY0yGQ6Bh0cAg2LwgHX0Ak7XGUCAwEAAQJAJQEbG6er8CsUQ7fiS77ZHYnTnoHEoR+cYoHUBkuu1nw4cWOR9TfoPjQlnjnScWUUEeIEaacJxq2O/weZhWNbAQIhALMVVWz+gpYkFP2TIqRhYeiNSRgJFodh9haafc/Fd2xxAiEAwWoXLbgxWNqtQl/miN5sww+VmnHHnY1fUJ2WjROI+TUCIQCwcOJ7wr5yoxYzSBYnkvLeJuXPUpTpyjCl0I0IemvRYQIgGUGvUSsSVpYHtfkr84eIEFjCom5lMK+7WJ2bgUShyFkCIFUavwKtv5TbEW3jIE7YVDq4hgSbQ6pFnYo9+o+u/Wq8")
        
        UIApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            nil,
            NSStringFromClass(AppDelegate.self)
        )
    }
    
}

