//
//  TransactionView.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

public struct TransactionView: View {
    
    // MARK: - Properties
    
    private let hash: String
    private let value: String
    private let isTransfer: Bool
    private let confirmations: String

    // MARK: - Initialization

    public init(confirmations: String, hash: String, value: String, isTransfer: Bool) {
        self.confirmations = confirmations
        self.hash = hash
        self.value = value
        self.isTransfer = isTransfer
    }

    public var body: some View {
        
        VStack(alignment: .leading, spacing: 4.00) {
            
            HStack {
                
                BaseLabel.init(
                    "Confirmations: \(confirmations)"
                )

                BaseSpacer.init()
                BaseLabel.init(
                    "\(isTransfer == true ? "-" : "+") \(value) Eth"
                )
                .foregroundStyle(
                    isTransfer == true ?
                        Color.indianRed : .accentColor
                )

            }
            
            
            BaseLabel(
                "\(hash)"
            )
            .foregroundStyle(.gray)

        }
        
    }
}

#Preview {
    TransactionView.init(
        confirmations: "1234",
        hash: "0xaa45b4858ba44230a5fce5a29570a5dec2bf1f0ba95bacdec4fe8f2c4fa99338", value: "0.05535",
            isTransfer: Bool.random()
    )
}
