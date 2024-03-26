//
//  MainSpendCheckView.swift
//
//
//  Created by 남유성 on 3/23/24.
//

import SwiftUI

struct MainSpendCheckView: View {
    
    @ObservedObject var spendingHistory: SpendingHistoryModel
    
    var dissatisfiedSpedingList: [SpendingModel] {
        spendingHistory.history.filter { $0.satisfaction == .dissatisfied }
    }
    
    var unCheckedSpedingList: [SpendingModel] {
        spendingHistory.history.filter { $0.satisfaction == .notSet }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 48) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("오늘의")
                        Text("아쉬운 지출 \(dissatisfiedSpedingList.count)건")
                            .foregroundStyle(Color.accent)
                    }
                    .font(.aggro(.medium, size: 32))
                    .padding(.top, 40)
                    
                    VStack {
                        HStack {
                            Image(Literals.sikSikE)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 68)
                                .padding(.horizontal, 24)
                            
                            VStack(alignment: .leading) {
                                Text("아직 정리하지 않은")
                                HStack(spacing: 0) {
                                    Text("소비 \(unCheckedSpedingList.count)건")
                                        .font(.aggro(.medium, size: 17))
                                        .foregroundStyle(Color.main)
                                    Text("이 있어요!")
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    .font(.aggro(.light, size: 18))
                    .padding(.vertical, 16)
                    .background(
                        Color.mainBg.opacity(0.1),
                        in: RoundedRectangle(cornerRadius: 8)
                    )
                    .padding(.bottom, 16)
                    
                    LazyVStack(spacing: 24) {
                        ForEach(dissatisfiedSpedingList) { spending in
                            HStack(spacing: 16) {
                                SpendingCategoryImage(category: spending.category, size: .large)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(spending.memo)
                                        .font(.aggro(.medium, size: 18))
                                    SpendingSatisfactionImage(satisfaction: spending.satisfaction, size: .small)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 16) {
                                    Text("\(spending.amount.toString()) \(spending.currencyType)")
                                        .font(.aggro(.medium, size: 18))
                                    
                                    Text(toKRW(of: spending))
                                        .foregroundStyle(Color.gray5)
                                        .font(.aggro(.light, size: 16))
                                }
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("여행 전체")
                        .font(.aggro(.medium, size: 24))
                    VStack(alignment: .leading) {
                        Text("평균 아쉬웠던 지출은")
                        HStack(spacing: 0) {
                            Text("\(3.6.toString())회")
                                .font(.aggro(.medium, size: 20))
                                .foregroundStyle(Color.accent)
                            Text("예요")
                        }
                    }
                    
                    Rectangle()
                        .foregroundStyle(Color.appGray)
                        .frame(height: 200)
                }
                .font(.aggro(.light, size: 20))
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("카테고리별")
                        .font(.aggro(.medium, size: 24))
                    VStack(alignment: .leading) {
                        HStack(spacing: 0) {
                            Text("\("교통") 관련")
                                .font(.aggro(.medium, size: 20))
                                .foregroundStyle(Color.accent)
                            Text(" 카테고리에서")
                        }
                        Text("아쉬운 지출이 많았어요")
                    }
                    
                    Rectangle()
                        .foregroundStyle(Color.appGray)
                        .frame(height: 200)
                }
                .font(.aggro(.light, size: 20))
                .padding(.bottom, 200)
            }
            .padding(.horizontal, 20)
        }
    }
}

extension MainSpendCheckView {
    func toKRW(of spending: SpendingModel) -> String {
        return (spending.amount / spending.exchangeRate).toString(maxFractionDigit: 0) + "KRW"
    }
}

#Preview {
    MainSpendCheckView(spendingHistory: SpendingHistoryModel.mockup())
}
