//
//  BaseContainerView.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

public struct BaseContainerView<Content: View>: View {

    // MARK: - Properties
    
    private let content: Content
    
    // MARK: - Initialization
    
    public init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        self.content
        .frame(maxWidth: .infinity)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

