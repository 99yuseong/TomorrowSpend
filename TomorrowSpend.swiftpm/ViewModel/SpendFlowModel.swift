//
//  SpendFlowModel.swift
//
//
//  Created by 남유성 on 3/27/24.
//

import SwiftUI

class SpendFlowModel: ObservableObject {
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
