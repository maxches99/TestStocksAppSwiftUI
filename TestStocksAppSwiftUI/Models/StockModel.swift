//
//  StockModel.swift
//  TestStocksAppSwiftUI
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation

// MARK: - Forecast
struct StockResponse: Codable, Equatable, Identifiable, Hashable {
    let id = UUID()
    let open: Double?
    let high: Double?
    let low: Double?
    let current: Double?
    let previous_close: Double?
    let name: String
}

extension StockResponse {
    static var dummyData: StockResponse {
        .init(open: 130, high: 131, low: 129, current: 130.33, previous_close: 132, name: "ChesnikovEngine")
    }
}

