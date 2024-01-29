//
//  Date+Ext.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import Foundation

internal extension Date {
    
    static func getReadableDate(_ timestamp: Double) -> String {
 
        let timestampDate = Date(timeIntervalSince1970: timestamp)
        return timestampDate.formatted(date: .numeric, time: .standard)
    }

}
