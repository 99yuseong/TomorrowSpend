//
//  TripData.swift
//  
//
//  Created by 남유성 on 3/23/24.
//

import Foundation

protocol TripDataProtocol {
    var country: Country { get }
    var startDate: Date { get }
    var endDate: Date { get }
}

class TripData: ObservableObject, TripDataProtocol {
    var country: Country
    var startDate: Date
    var endDate: Date
    
    init(
        country: Country = Country(),
        startDate: Date = Date(),
        endDate: Date = Date()
    ) {
        self.country = country
        self.startDate = startDate
        self.endDate = endDate
    }
}

extension TripData {
    func updateCountry(to country: Country) {
        self.country = country
    }
    
    func updateDate(from startDate: Date, to endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func updateCurrency(for dict: [String: Double]) {
        for currency in country.currencies {
            currency.exchangeRate = dict[currency.code] ?? 0
        }
    }
}
