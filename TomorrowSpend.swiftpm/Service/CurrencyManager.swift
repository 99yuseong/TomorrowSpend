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
    
//    func fetchCurrencyExchangeData() {
//        if let url = URL(string: "https://v6.exchangerate-api.com/v6/af7aafa614ecb7839e95f2ec/latest/KRW") {
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print("unknownERROR: \(error.localizedDescription)")
//                    return
//                }
//                
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                    print("SERVER ERROR/ERORR Resonse")
//                    return
//                }
//                
//                guard let data = data else {
//                    print("Empty Data ERROR")
//                    return
//                }
//                
//                do {
//                    let decodedData = try JSONDecoder().decode([ExchangeFromKoreanEximDTO].self, from: data)
//                    
//                    let currencyList = decodedData.map { $0.toCurrency() }
//                    
//                    print(currencyList)
//                    print(currencyList.count)
//                } catch {
//                    print("JSON Decoding ERROR: \(error.localizedDescription)")
//                }
//            }
//            task.resume()
//            
//        } else {
//            print("INVALID URL ERROR")
//        }
//    }
    
    
    /// https://app.exchangerate-api.com/
    /// ExchangeRate API - 한달 1500건 무료
    func fetchDataFromExchangeRateSite() {
        
    }
    
    
    
    
//    /// https://www.koreaexim.go.kr/ir/HPHKIR020M01
//    /// 한국 수출입 은행 API - 하루 1000건 무료
//    func fetchDataFromKoreanEximSite() {
//        
//        var components = URLComponents(string: "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON")
//        
//        let queryItems = [URLQueryItem(name: "authkey", value: "rqh7jSBFKfDdl8Iokt1SW476x04o0flc"),
//                          URLQueryItem(name: "data", value: "AP01")]
//        components?.queryItems = queryItems
//        
//        if let url = components?.url {
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print("unknownERROR: \(error.localizedDescription)")
//                    return
//                }
//                
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                    print("SERVER ERROR/ERORR Resonse")
//                    return
//                }
//                
//                guard let data = data else {
//                    print("Empty Data ERROR")
//                    return
//                }
//                
//                do {
//                    let decodedData = try JSONDecoder().decode([ExchangeFromKoreanEximDTO].self, from: data)
//                    
//                    let currencyList = decodedData.map { $0.toCurrency() }
//                    
//                    print(currencyList)
//                    print(currencyList.count)
//                } catch {
//                    print("JSON Decoding ERROR: \(error.localizedDescription)")
//                }
//            }
//            task.resume()
//            
//        } else {
//            print("INVALID URL ERROR")
//        }
//    }
}
