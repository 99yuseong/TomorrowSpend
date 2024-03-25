//
//  SpendCategory.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

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
}
