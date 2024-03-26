//
//  ExchangeRateDTO.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

struct ExchangeRateDTO: Codable {
    let result: String
    let documentation: String
    let termsOfUse: String
    let timeLastUpdateUnix: Double
    let timeLastUpdateUTC: String
    let timeNextUpdateUnix: Double
    let timeNextUpdateUTC: String
    let baseCode: String
    let conversionRates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case result, documentation
        case termsOfUse = "terms_of_use"
        case timeLastUpdateUnix = "time_last_update_unix"
        case timeLastUpdateUTC = "time_last_update_utc"
        case timeNextUpdateUnix = "time_next_update_unix"
        case timeNextUpdateUTC = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
    
    func getExchangeRateForKRW(unit: String) -> Double? {
        return conversionRates[unit]
    }
}
