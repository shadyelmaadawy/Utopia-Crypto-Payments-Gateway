//
//  BaseUIHostingController.swift
//  UtopiaKit
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import UIKit
import SwiftUI

public final class BaseUIHostingController<T: View>: UIHostingController<T> {

    // MARK: - Initialization
    
    public override init(rootView: T) {
        super.init(rootView: rootView)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
