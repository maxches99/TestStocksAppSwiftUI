//
//  StocViewModel.swift
//  TestStocksAppSwiftUI
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation
import Combine

protocol StocViewModel {
    func getStock()
    func getStockOfCompany(companyName: String)
}

class StocViewModelImpl: NSObject, ObservableObject, StocViewModel {
    
    private let service: StockService
    
    private(set) var stock: StockResponse = StockResponse.dummyData
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: StockService) {
        self.service = service
    }
    
    func getStock() {
        
        state = .loading
        
        service
            .request(from: .getStock)
            .sink { [weak self] res in
                guard let strongSelf = self else { return }
                switch res {
                case .finished:
                    strongSelf.state = .success(content: strongSelf.stock)
                case .failure(let error):
                    strongSelf.state = .failed(error: error)
                }
            } receiveValue: { [weak self] response in
                self?.stock = response
            }
            .store(in: &cancellables)
    }
    
    func getStockOfCompany(companyName: String) {
        
        state = .loading
        
        service
            .request(from: .getStockByName(companyName))
            .sink { [weak self] res in
                guard let strongSelf = self else { return }
                switch res {
                case .finished:
                    strongSelf.state = .success(content: strongSelf.stock)
                case .failure(let error):
                    strongSelf.state = .failed(error: error)
                }
            } receiveValue: { [weak self] response in
                self?.stock = response
            }
            .store(in: &cancellables)
    }
}
