//
//  File.swift
//  
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

class CountryManager {
    static let shared = CountryManager()
    
    private init() {}

    func loadCountryData() -> [Country] {
        if let jsonData = loadData() {
            if let countries = decodeCountries(from: jsonData) {
                return countries.map { $0.toCountry() }
            }
        }
        
        return []
    }
    
    private func loadData() -> Data? {
        guard let filePath = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            print("File path not found.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: filePath)
            return data
        } catch {
            print("Error loading data: \(error)")
            return nil
        }
    }

    private func decodeCountries(from data: Data) -> [CountryDTO]? {
        do {
            let decoder = JSONDecoder()
            let countries = try decoder.decode([String: CountryDTO].self, from: data)
            
            return Array(countries.values)
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }

}
