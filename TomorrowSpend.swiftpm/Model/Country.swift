//
//  Country.swift
//
//
//  Created by 남유성 on 3/26/24.
//

import Foundation

struct Country {
    var nameKR: String = ""
    var countryCode: String = ""
    var currencies: [Currency] = []
}

class Currency: ObservableObject {
    @Published var exchangeRate: Double
    var code: String
    var unit: String
    var symbol: String
    
    init(
        exchangeRate: Double = 0,
        code: String = "",
        unit: String = "",
        symbol: String = ""
    ) {
        self.exchangeRate = exchangeRate
        self.code = code
        self.unit = unit
        self.symbol = symbol
    }
    
    static let KRW = Currency(exchangeRate: 1, code: "KRW", unit: "WON", symbol: "₩")
}
