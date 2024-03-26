//
//  CountryDTO.swift
//
//
//  Created by 남유성 on 3/26/24.
//

import Foundation

struct CountryDTO: Codable {
    let cca3: String
    let currencies: [String: CurrencyDTO]
    let translations: [String: TranslationDTO]
    
    func toCountry() -> Country {
        Country(
            nameKR: translations["kor"]?.common ?? "",
            countryCode: cca3,
            currencies: currencies.map { code, dto in
                Currency(
                    code: code,
                    unit: dto.name,
                    symbol: dto.symbol
                )
            }
        )
    }
}

struct CurrencyDTO: Codable {
    let name, symbol: String
}

struct TranslationDTO: Codable {
    let official, common: String
}
