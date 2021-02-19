//
//  StockEndpoint.swift
//  TestStocksAppSwiftUI
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum StockAPI {
    case getStock
    case getStockByName(String)
}

extension StockAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: URL( string: baseUrl.appendingPathComponent(path).absoluteString.removingPercentEncoding! + appendingString)!)
    }
    
    var baseUrl: URL {
        return URL(string: "https://api.lil.software")!
    }
    
    var path: String {
        return "/stocks?"
    }
    
    var appendingString: String {
        switch self {
        case .getStock:
            return "symbol=AAPL"
        case .getStockByName(let name):
            return "symbol=\(name)"
        }
    }
}

