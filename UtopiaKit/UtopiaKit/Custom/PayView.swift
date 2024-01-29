//
//  PayView.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

public struct PayView: View {
   
    // MARK: - Properties
    
    @State private var nfcAction: () -> ()
    
    // MARK: - Initialization

    public init(nfcAction: @escaping () -> Void) {
        self.nfcAction = nfcAction
    }
 
    public var body: some View {
        
        HStack(spacing: 6.00) {

            VStack(alignment: .leading, spacing: 2.00) {
                
                BaseLabel("Welcome back!", labelFont: .headline, fontWeight: .bold)
                
                BaseLabel("Click here to scan and pay.", labelFont: .subheadline)
                    .foregroundStyle(.gray)
                
            }
            
            BaseSpacer.init()
            
            BaseCircleButton.init(
                buttonImage: .scanNFCImage,
                buttonAction: nfcAction
            )

        }
        .padding(.vertical, 5.00)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10.00)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(
            RoundedRectangle(
                cornerRadius: 8.0, style: .continuous
            )
        )

    }
}

