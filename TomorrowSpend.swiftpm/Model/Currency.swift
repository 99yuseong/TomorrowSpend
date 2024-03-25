//
//  Currency.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

struct Currency {
    var country: String
    var symbol: String
    var code: String
    var currencyRateToKRW: Double
    
    init(
        country: String = "대한민국",
        symbol: String = "KRW",
        code: String = "KR",
        currencyRateToKRW: Double = 0.0
    ) {
        self.country = country
        self.symbol = symbol
        self.code = code
        self.currencyRateToKRW = currencyRateToKRW
    }
}
