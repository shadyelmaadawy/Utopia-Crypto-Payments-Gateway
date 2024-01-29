//
//  HomeView.swift
//  Utopia-Crypto Payments Gateway
//
//  Created by Shady El-Maadawy on 14/01/2024.
//

import SwiftUI
import UtopiaKit

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: ViewModel
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject.init(wrappedValue: viewModel)
    }
    
    // MARK: - View
    
    var body: some View {
        
        BaseContainerView.init() {

            PayView.init(nfcAction: {
                self.viewModel.inputs.scanToPayButtonClickedEvent.send(())
            })
            
            BaseButton("Re-Configure") {
                self.viewModel.inputs.reConfigureButtonClickedEvent.send(())
            }
            .padding(.top, 16.00)
        }
        .modifier(
            BaseView.init(
                navigationBarTitle: "Home Overview"
            )
        )

    }
}


