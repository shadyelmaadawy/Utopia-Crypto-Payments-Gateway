//
//  WriteNFCView.swift
//  Utopia-Crypto Payments Writer
//
//  Created by Shady El-Maadawy on 16/01/2024.
//

import Combine
import SwiftUI
import UtopiaKit

struct WriteNFCView<ViewModel: WriteNFCViewModelProtocol>: View {
    
    // MARK: - ViewModel
    
    @StateObject private var viewModel: ViewModel
    
    // MARK: - View State
    
    @State private var privateKeyValue: String = ""
    @State private var isWriteButtonEnabled: Bool = true
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject.init(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {

        BaseContainerView.init() {

            GeometryReader.init(content: { geometry in
                
                ScrollView {
                    
                    VStack {
                        
                        NFCView.init()
                        
                        VStack(alignment: .leading, spacing: 4.00) {
                            
                            BaseLabel("Wallet private key:")
                            
                            BaseTextField.init(
                                textValue:
                                    $privateKeyValue,
                                textLabel: "Private Key"
                            ).onChange(of: privateKeyValue) { value in
                                viewModel.inputs.walletPrivateKeyValue.send(value)
                            }
                        }
                        .padding(.top, 48.00)
                        
                        BaseSpacer.init()

                        BaseButton("Write to NFC Tag") {
                            viewModel.inputs.writeButtonClickedEvent.send(())
                        }
                        .onReceive(viewModel.outputs.isWriteButtonEnabled, perform: { enableValue in
                            self.isWriteButtonEnabled = enableValue
                        })
                        .disabled(!self.isWriteButtonEnabled)
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    
                }
                
            })
            .modifier(
                BaseView.init(
                    navigationBarTitle: "Write to nfc tag",
                    showLoading: viewModel.outputs.showLoading,
                    showAMessage: viewModel.outputs.textMessage
                )
            )
        }

    }
}

