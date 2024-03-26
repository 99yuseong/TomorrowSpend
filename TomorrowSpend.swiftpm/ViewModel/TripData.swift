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
    
    func updateCurrency() {
        DataNetworkingMananger.shared.fetchExchangeRate { [weak self] dict in
            guard let self = self else { return }
            
            for currency in self.country.currencies {
                currency.exchangeRate = dict[currency.code] ?? 0
            }
        }
    }
}
