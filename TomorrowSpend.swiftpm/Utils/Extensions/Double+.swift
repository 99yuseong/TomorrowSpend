//
//  Double+.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import Foundation

extension Double {
    func toString(minFractionDigit: Int = 0, maxFractionDigit: Int = 8) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = minFractionDigit
        formatter.maximumFractionDigits = maxFractionDigit
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
