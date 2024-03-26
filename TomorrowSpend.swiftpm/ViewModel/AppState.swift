//
//  AppFlow.swift
//
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var flow: Flow = .createTrip
}

// MARK: - Flow
extension AppState {
    enum Flow {
        case createTrip
        case main
    }
    
    public func flow(to flow: Flow) {
        withAnimation {
            self.flow = flow
        }
    }
}
//
//// MARK: - Trip Data
//extension AppState {
//    public func updateTripCountryData(_ newCountry: Country) {
//        self.tripData.country = newCountry
//    }
//    
//    public func updateTripDate(start startDate: Date, end endDate: Date) {
//        self.tripData.startDate = startDate
//        self.tripData.endDate = endDate
//    }
//}
//
//// MARK: - NetWork
//extension AppState {
//    public func loadCountries() {
//        self.countries = CountryManager.shared.loadCountryData()
//    }
//    
//    public func updateExchangeRate() {
//        
//    }
//}


