//
//  File.swift
//  
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

class DataNetworkingMananger {
    static let shared = DataNetworkingMananger()
    
    private init() {}
}

extension DataNetworkingMananger {
    func fetchExchangeRate(completion: @escaping ([String: Double]) -> ()) {
        if let url = URL(string: "https://v6.exchangerate-api.com/v6/\(Secret.exchangeRateApiKey)/latest/KRW") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("unknownERROR: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("SERVER ERROR/ERORR Resonse")
                    return
                }
                
                guard let data = data else {
                    print("Empty Data ERROR")
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(ExchangeRateDTO.self, from: data)
                    completion(decodedData.conversionRates)

                } catch {
                    print("JSON Decoding ERROR: \(error.localizedDescription)")
                }
            }
            task.resume()
            
        } else {
            print("INVALID URL ERROR")
        }
    }
    
    func fetchCountryData(completion: @escaping ([Country]) -> ()) {
        if let url = URL(string: "https://restcountries.com/v3.1/all?fields=translations,currencies,cca3") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("unknownERROR: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("SERVER ERROR/ERORR Resonse")
                    return
                }
                
                guard let data = data else {
                    print("Empty Data ERROR")
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode([CountryDTO].self, from: data)
                    let countries = decodedData.map { $0.toCountry() }
                    
                    completion(countries)
                    
                } catch {
                    print("JSON Decoding ERROR: \(error.localizedDescription)")
                }
            }
            task.resume()
            
        } else {
            print("INVALID URL ERROR")
        }
    }
}
