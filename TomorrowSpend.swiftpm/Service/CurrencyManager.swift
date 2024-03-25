//
//  CurrencyManager.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

class CurrencyManager {
    static let shared = CurrencyManager()
    
    private init() {}
    
    func fetchCurrencyExchangeData() {
        
        var components = URLComponents(string: "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON")
        
        let queryItems = [URLQueryItem(name: "authkey", value: "rqh7jSBFKfDdl8Iokt1SW476x04o0flc"),
                          URLQueryItem(name: "data", value: "AP01")]
        components?.queryItems = queryItems

        if let url = components?.url {
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
                    let decodedData = try JSONDecoder().decode([ExchangeDTO].self, from: data)
                    
                    let currencyList = decodedData.map { $0.toCurrency() }
                    
                    print(currencyList)
                    print(currencyList.count)
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
