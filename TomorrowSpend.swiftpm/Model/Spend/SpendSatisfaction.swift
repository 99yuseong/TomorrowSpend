//
//  Satisfaction.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

enum SpendSatisfaction: CaseIterable {
    case notSet
    case satisfied
    case dissatisfied
    
    var description: String {
        switch self {
        case .notSet:
            "스킵"
        case .satisfied: 
            "만족"
        case .dissatisfied: 
            "아쉽"
        }
    }
}
