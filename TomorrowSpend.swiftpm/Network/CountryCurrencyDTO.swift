//
//  CurrencyUnitDTO.swift
//
//
//  Created by 남유성 on 3/26/24.
//

import Foundation

struct CountryCurrencyDTO: Codable {
    let cca3: String
    let currencies: [String: CurrencyDTO]
}

struct CurrencyDTO: Codable {
    let name: String
    let symbol: String
}

