//
//  PayTextField.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 15/01/2024.
//

import SwiftUI

public struct PayTextField: View {

    // MARK: - Properties
    
    @Binding private var payAmount: Double

    // MARK: - Initialization
    
    public init(payAmount: Binding<Double>) {
        self._payAmount = payAmount
    }
    
    public var body: some View {
        
        TextField("", value: $payAmount, format: .number.precision(.fractionLength(2)))
        .padding(16.00)
        .font(.callout)
        .keyboardType(.decimalPad)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 6.00)
                .stroke(Color.gray.opacity(0.50))
        )
        .textFieldStyle(PlainTextFieldStyle())
        .padding(.bottom, 8.00)
        
    }
}
