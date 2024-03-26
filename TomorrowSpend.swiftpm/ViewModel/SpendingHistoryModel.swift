//
//  SpendingListData.swift
//
//
//  Created by 남유성 on 3/27/24.
//

import SwiftUI

class SpendingHistoryModel: ObservableObject {
    @Published var history: [SpendingModel]
    
    init(history: [SpendingModel] = []) {
        self.history = history
    }
}

extension SpendingHistoryModel {
    static func mockup() -> SpendingHistoryModel {
        SpendingHistoryModel(
            history: (0..<10).map {
                SpendingModel(
                    type: .card,
                    category: .meal,
                    memo: "점심식사",
                    satisfaction: $0 % 2 == 0 ? .dissatisfied : .notSet,
                    amount: Double($0) * 100,
                    currencyType: "JPY",
                    exchangeRate: 0.5
                )
            }
        )
    }
}

// TODO: - Date 정보 넣기
class SpendingModel: ObservableObject, Identifiable {
    let id = UUID()
    
    @Published var type: SpendType
    @Published var category: SpendCategory
    @Published var memo: String
    @Published var satisfaction: SpendSatisfaction
    @Published var amount: Double
    @Published var currencyType: String
    var exchangeRate: Double
    
    init(
        type: SpendType = .notSet,
        category: SpendCategory = .meal,
        memo: String = "",
        satisfaction: SpendSatisfaction = .notSet,
        amount: Double = 0,
        currencyType: String = "",
        exchangeRate: Double = 0
    ) {
        self.type = type
        self.category = category
        self.memo = memo
        self.satisfaction = satisfaction
        self.currencyType = currencyType
        self.amount = amount
        self.exchangeRate = exchangeRate
    }
}
