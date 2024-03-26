//
//  TripData.swift
//  
//
//  Created by 남유성 on 3/23/24.
//

import Foundation

class TripData: ObservableObject {
    var country: Country
    var startDate: Date
    var endDate: Date
    var currency: Currency
    
    init(
        country: Country = Country(),
        startDate: Date = Date(),
        endDate: Date = Date(),
        currency: Currency = Currency()
    ) {
        self.country = country
        self.startDate = startDate
        self.endDate = endDate
        self.currency = currency
    }
}

struct Country {
    var nameKR: String = ""
    var countryCode: String = ""
}

struct Currency {
    var unit: String = ""
    var unitInKorean: String = ""
    var exchangeRate: Double = 0
}
