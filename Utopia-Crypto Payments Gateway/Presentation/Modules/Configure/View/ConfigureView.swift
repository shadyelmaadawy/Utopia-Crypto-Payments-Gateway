//
//  ConfigureView.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 15/01/2024.
//

import SwiftUI
import UtopiaKit
import UtopiaUtilities

struct ConfigureView<ViewModel: ConfigureViewModelProtocol>: View {
    
    // MARK: - ViewModel
    
    @StateObject private var viewModel: ViewModel
    
    // MARK: - View State
    
    @State private var walletAddressValue: String = ""
    @State private var isContinueButtonEnabled: Bool = false
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject.init(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        
        BaseContainerView.init() {
            
            BaseSpacer.init()

            BaseTextField.init(
                textValue: $walletAddressValue,
                textLabel: "Ethereum wallet address:"
            )
            .onChange(of: self.walletAddressValue) { walletValue in
                self.viewModel.inputs.walletAddressValue.send(walletValue)
            }
            
            BaseButton.init("Continue") {
                viewModel.inputs.continueButtonClicked.send(())
            }
            .disabled(self.isContinueButtonEnabled == true ? false : true)
            .onReceive(self.viewModel.outputs.continueButtonEnabled, perform: { value in
                self.isContinueButtonEnabled = value
            })
            
            BaseSpacer.init()
        }
        .modifier(
            BaseView.init(
                navigationBarTitle: "Configure",
                showAMessage: viewModel.outputs.showTextMessage
            )
        )

    }
}
