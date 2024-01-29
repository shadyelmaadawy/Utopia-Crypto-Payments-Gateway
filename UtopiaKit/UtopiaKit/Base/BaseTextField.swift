//
//  BaseTextField.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 15/01/2024.
//

import SwiftUI

public struct BaseTextField: View {
    
    // MARK: - Properties
    
    @Binding private var textValue: String
    
    private let textLabel: String

    // MARK: - Initialization
    
    public init(textValue: Binding<String>, textLabel: String) {
        self._textValue = textValue
        self.textLabel = textLabel
    }
    
    
    public var body: some View {

        TextField(text: $textValue, label: {
            BaseLabel(textLabel)
        })
        .padding(16.00)
        .font(.callout)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 6.00)
                .stroke(Color.gray.opacity(0.50))
        )
        .textFieldStyle(PlainTextFieldStyle())
        .padding(.bottom, 8.00)
        
    }
}

