//
//  BaseCircleButton.swift
//  UserInterfaceKit
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI

public struct BaseCircleButton: View {
    
    // MARK: - Enums
    
    public enum CircleButtonImages {
        case scanNFCImage
        
        internal var imageName: Image.ImagesSystemNames {
            
            switch(self) {
                
                case .scanNFCImage:
                    return .scanNFC
            }
        }
    }
    
    // MARK: - Properties
    
    private let buttonImage: CircleButtonImages
    private let buttonAction: () -> ()
    
    // MARK: - Initialization
    
    public init(buttonImage: CircleButtonImages, buttonAction: @escaping () -> Void) {
        self.buttonImage = buttonImage
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        Button(action: buttonAction, label: {
            Image.createImage(imageName: buttonImage.imageName)
                .padding()
                .background(Color.accentColor)
                .clipShape(Circle())
                .font(.title)
                .foregroundStyle(.white)
        })
        .shadow(color: Color.accentColor, radius: 2.00)

    }
}

