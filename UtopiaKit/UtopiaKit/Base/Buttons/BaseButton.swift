//
//  BaseButton.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

public struct BaseButton: View {
    
    // MARK: - Properties
    
    private let buttonLabel: String
    private let buttonAction: () -> ()
    
    // MARK: - Initialization
    
    public init(_ buttonLabel: String, buttonAction: @escaping () -> Void) {
        self.buttonLabel = buttonLabel
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        Button(action: buttonAction, label: {
            BaseLabel(buttonLabel)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor)
                .foregroundStyle(.white)
        })
        .clipShape(
            RoundedRectangle(
                cornerRadius: 8.0, style: .continuous
            )
        )
        .shadow(color: Color.accentColor, radius: 2.00)
    }
}
