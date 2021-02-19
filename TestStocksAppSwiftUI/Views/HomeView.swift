//
//  HomeView.swift
//  TestStocksAppSwiftUI
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation
import SwiftUI
import Neumorphic

struct HomeView: View {
    
    @StateObject var viewModel = StocViewModelImpl(service: StockServiceImpl())
    @State private var isPresented = false
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getStock)
            case .success(let stock):
                StockView(stock: stock, handler: viewModel.getStock, handlerOutputString: { name in viewModel.getStockOfCompany(companyName: name)})
            default:
                ProgressiveView(state: viewModel.state)
            }
        }.onAppear(perform: {
            viewModel.getStock()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
