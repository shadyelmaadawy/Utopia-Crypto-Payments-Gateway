//
//  ScanToPayView.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 23/01/2024.
//

import SwiftUI
import UtopiaKit
import UtopiaUtilities

struct ScanToPayView<ViewModel: ScanToPayViewModelProtocol>: View {
    
    // MARK: - ViewModel
    
    @StateObject private var viewModel: ViewModel
    
    // MARK: - View State
    
    @State private var payAmountValue: Double = 0.00
    @State private var isPayButtonEnabled: Bool = false

    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject.init(wrappedValue: viewModel)
    }

    var body: some View {
    
        BaseContainerView.init() {
            
            BaseSpacer.init()

            VStack(spacing: 8.00) {
                BaseLabel.init("Required ethereum amount to pay:", labelFont: .subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                PayTextField.init(payAmount: $payAmountValue)
                .onChange(of: self.payAmountValue) { walletValue in
                    self.viewModel.inputs.payValue.send(walletValue)
                }

            }
            
            BaseSpacer.init()

            BaseButton.init("Scan NFC to pay") {
                self.viewModel.inputs.payButtonClickedEvent.send(())

            }
            .disabled(self.isPayButtonEnabled == true ? false : true)
            .onReceive(self.viewModel.outputs.payButtonEnabled, perform: { value in
                self.isPayButtonEnabled = value
            })
            .frame(maxWidth: .infinity)
        }
        .modifier(
            BaseView.init(
                navigationBarTitle: "Scan To Pay",
                showLoading: viewModel.outputs.showLoading,
                showAMessage: viewModel.outputs.showTextMessage
            )
        )

    }
}
