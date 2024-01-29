//
//  BaseView.swift
//  UtopiaKit
//
//  Created by Shady El-Maadawy on 27/01/2024.
//

import Foundation
import SwiftUI
import Combine
public struct BaseView: ViewModifier {
    
    // MARK: - Properties
    
    private let navigationBarTitle: String
    private let showLoading: AnyPublisher<Bool, Never>
    private let showAMessage: AnyPublisher<String, Never>
    
    // MARK: - View State
    
    @State private var showLoadingState: Bool = false

    @State private var showATextState: Bool = false
    @State private var showATextValue: String = ""

    // MARK: - Initialization

    public init(
        navigationBarTitle: String, 
        showLoading: AnyPublisher<Bool, Never> = Empty().eraseToAnyPublisher(),
        showAMessage: AnyPublisher<String, Never> = Empty().eraseToAnyPublisher()) {
        self.navigationBarTitle = navigationBarTitle
        self.showLoading = showLoading
        self.showAMessage = showAMessage
    }
    
}

// MARK: - Operations

extension BaseView {
    
    public func body(content: Content) -> some View {
        
        return ZStack {
            
            BaseProgressView.init(
                isShown: $showLoadingState
            )
            
            content
            .navigationTitle(navigationBarTitle)
            .navigationBarTitleDisplayMode(.inline)
            .padding(12.00)
            .navigationViewStyle(StackNavigationViewStyle())
            .onReceive(showLoading, perform: { value in
                self.showLoadingState = value
            })
            .disabled(self.showLoadingState)
            .onReceive(showAMessage, perform: { messageText in
                self.showATextValue = messageText
                self.showATextState = true
            })
            .alert(showATextValue, isPresented: $showATextState) {
                BaseButton.init("ThankYou", buttonAction: {})
            }

        }
    }
    
}
