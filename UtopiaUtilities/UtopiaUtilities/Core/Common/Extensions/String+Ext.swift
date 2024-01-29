//
//  String+Ext.swift
//  UtopiaUtilities
//
//  Created by Shady El-Maadawy on 28/01/2024.
//

import Foundation

internal extension String {
    
    /// Create notification center notification from string
    /// - Returns: created notification
    func createNotification() -> Notification.Name {
        return Notification.Name.init(self)
    }
    
}

