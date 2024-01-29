//
//  NFCView.swift
//  UtopiaKit
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import SwiftUI

public struct NFCView: View {
    
    // MARK: - Initialization
    
    public init() {}
    
    public var body: some View {
        return Image.createImage(imageName: .scanNFC)
            .resizable()
            .frame(width: 128, height: 128)
            .foregroundStyle(Color.accentColor)
            .padding(.top, 24.00)

    }
}

#Preview {
    NFCView()
}
