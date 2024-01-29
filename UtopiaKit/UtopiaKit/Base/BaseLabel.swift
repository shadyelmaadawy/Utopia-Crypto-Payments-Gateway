//
//  BaseLabel.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

public struct BaseLabel: View {
    
    // MARK: - Properties
    
    private let labelText: String
    private let labelFont: Font
    private let labelFontWeight: Font.Weight
    
    // MARK: - Initialization

    public init(_ labelText: String, labelFont: Font = .headline, fontWeight: Font.Weight = .regular) {
        self.labelText = labelText
        self.labelFont = labelFont
        self.labelFontWeight = fontWeight

    }
    public var body: some View {
        return Text(labelText)
            .font(.headline)
            .fontWeight(.bold)
            .lineLimit(1)
    }
}

#Preview {
    BaseLabel("Hello-World!;")
}

