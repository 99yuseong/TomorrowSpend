//
//  Country.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

struct Country {
    var nameKR: String = ""
    var countryCode: String = ""
    var currency: Currency = Currency()
}

struct Currency {
    var unit: String = ""
    var unitInKorean: String = ""
    var exchangeRate: Double = 0
}
