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
    
    func convert(_ value: Double) -> Double {
        return 10 * value
    }
}
