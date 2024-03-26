//
//  Spend.swift
//
//
//  Created by 남유성 on 3/27/24.
//

import SwiftUI

struct Spend {
    var currencyType: String
    var amount: Double
    var exchangeRate: Double
    var type: SpendType
    var category: SpendCategory
    var memo: String
    var satisfaction: SpendSatisfaction
}

enum SpendType {
    case card
    case cash
    case notSet
}

enum SpendCategory: CaseIterable {
    case meal
    case transportation
    case shopping
    case snack
    case lodging
    case others
    
    var description: String {
        switch self {
        case .meal:
            "식사"
        case .transportation:
            "교통"
        case .shopping:
            "쇼핑"
        case .snack:
            "간식"
        case .lodging:
            "숙소"
        case .others:
            "기타"
        }
    }
    
    var recommendation: [String] {
        switch self {
        case .meal:
            ["아침", "점심", "저녁", "폭식", "경험"]
        case .transportation:
            ["버스", "지하철", "택시", "비행기"]
        case .shopping:
            ["기념품", "옷", "신발"]
        case .snack:
            ["간식"]
        case .lodging:
            ["호텔", "펜션", "게스트하우스"]
        case .others:
            []
        }
    }
    
    var iconImageFont: String {
        switch self {
        case .meal:
            return "🍔"
        case .transportation:
            return "🚕"
        case .shopping:
            return "🛍"
        case .snack:
            return "🍎"
        case .lodging:
            return "🛏"
        case .others:
            return "😎"
        }
    }
    
    var iconBackground: Color {
        switch self {
        case .meal:
            return .gray.opacity(0.15)
        case .transportation:
            return .blue.opacity(0.15)
        case .shopping:
            return .yellow.opacity(0.15)
        case .snack:
            return .green.opacity(0.15)
        case .lodging:
            return .red.opacity(0.1)
        case .others:
            return .brown.opacity(0.15)
        }
    }
}

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
    
    var iconImageFont: String {
        switch self {
        case .notSet:
            "🔜"
        case .satisfied:
            "😄"
        case .dissatisfied:
            "😡"
        }
    }
    
    var iconBackground: Color {
        switch self {
        case .notSet:
            return .gray.opacity(0.15)
        case .satisfied:
            return .green.opacity(0.2)
        case .dissatisfied:
            return .red.opacity(0.2)
        }
    }
}
