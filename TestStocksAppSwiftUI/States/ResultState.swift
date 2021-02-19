//
//  ResultState.swift
//  TestStocksAppSwiftUI
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation


enum ResultState: Equatable {
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs) {
        case (loading, loading):
            return true
        case (success(let contentl), success(let contentr)):
            return contentl == contentr
        case (failed(_), failed(_)):
            return true
        default:
            return false
        }
    }
    
    case loading
    case success(content: StockResponse)
    case failed(error: Error)
    
    var title: String {
        switch self {
        case .loading:
            return "Идет поиск этой ебаной компании"
        case .success(_):
            return "Компания загружена, а ты все еще с нами"
        case .failed(_):
            return "Сервак работает, как сука, швейцарские часы, но не сеголня"
        }
    }
}
