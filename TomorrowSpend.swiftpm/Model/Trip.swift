//
//  Trip.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/21/24.
//

import Foundation

struct Trip: Identifiable {
    let id: UUID = UUID()
    var country: Country
    var startDate: Date
    var endDate: Date
}
