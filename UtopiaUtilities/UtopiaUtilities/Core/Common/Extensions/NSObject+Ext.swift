//
//  NSObject+Ext.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation

internal extension NSObject {
    
    /// Get instance identifier as string
    var instanceIdentifier: String {
        return String.init(describing: self)
    }
    
}

