//
//  Image+Ext.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

internal extension Image {
    
    // MARK: - Enums
    
    enum ImagesSystemNames: String {
        case scanNFC = "suit.diamond.fill"
    }
    
    /// Create image from system symbols
    /// - Parameter imageName: image name
    /// - Returns: created imaged
    static func createImage(imageName: ImagesSystemNames) -> Image {
        return Image.init(systemName: imageName.rawValue)
    }
    
}

