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
        country: Country = Country.empty(),
        startDate: Date = Date(),
        endDate: Date = Date()
    ) {
        self.country = country
        self.startDate = startDate
        self.endDate = endDate
    }
}
