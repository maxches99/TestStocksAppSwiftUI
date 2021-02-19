//
//  StockHeightHelper.swift
//  TestStocksAppSwiftUI
//
//  Created by Max Chesnikov on 19.02.2021.
//

import Foundation
import SwiftUI

func getNormalStock(stockValue: Double) -> CGFloat {
    var normalValue: CGFloat = 0
    
    if stockValue > 100 {
        normalValue = CGFloat(Int(stockValue) % 100 * 10)
    } else {
        normalValue = CGFloat(stockValue * 10)
    }
    return normalValue
}
