//
//  BasePlainList.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

public struct BasePlainList<Content: View>: View {
    
    private let listContent: Content
    
    // MARK: - Initialization
    
    public init(@ViewBuilder _ content: () -> Content) {
        self.listContent = content()
    }

    // MARK: - Initialization

    public var body: some View {
        List {
            listContent
        }
        .listStyle(.plain)
        .padding(EdgeInsets(top: 0, leading: -10, bottom: -10, trailing: -10))
    }
}

#Preview {
    BasePlainList.init {
        ForEach(0..<100) { value in
            Text ("Current value: \(value)")
        }
    }
}
