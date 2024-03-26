//
//  CountryDTO.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

struct CountryDTO: Codable {
    let the2DigitCode: String
    let the3DigitCode: String
    let isoNumbericCode: Int
    let countryNameKR: String
    let countryNameEN: String
    let countryNameOriginal: String

    enum CodingKeys: String, CodingKey {
        case the2DigitCode = "2digitCode"
        case the3DigitCode = "3digitCode"
        case isoNumbericCode = "ISONumbericCode"
        case countryNameKR = "CountryNameKR"
        case countryNameEN = "CountryNameEN"
        case countryNameOriginal = "CountryNameOriginal"
    }
    
    func toCountry() -> Country {
        Country(
            nameKR: countryNameKR,
            countryCode: the3DigitCode
        )
    }
}
