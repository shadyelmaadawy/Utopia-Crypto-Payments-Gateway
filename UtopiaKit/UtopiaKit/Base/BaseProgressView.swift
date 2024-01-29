//
//  BaseProgressView.swift
//  UtopiaKit
//
//  Created by Shady El-Maadawy on 26/01/2024.
//

import SwiftUI

public struct BaseProgressView: View {

    // MARK: - Initialization
    
    @Binding private var isShown: Bool

    // MARK: - Initialization
    
    public init(isShown: Binding<Bool>) {
        self._isShown = isShown
    }
    
    public var body: some View {
        return ProgressView.init()
            .opacity(self.isShown == true ? 1.0 : 0.00)
            .disabled(self.isShown == true ? false : true)
    }
    
}
