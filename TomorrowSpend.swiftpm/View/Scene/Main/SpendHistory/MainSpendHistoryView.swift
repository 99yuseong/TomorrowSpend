//
//  MainSpendHistoryView.swift
//
//
//  Created by 남유성 on 3/23/24.
//

import SwiftUI

struct MainSpendHistoryView: View {
    
    @ObservedObject var spendingHistory: SpendingHistoryModel
        
    var body: some View {
        GeometryReader { gr in
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading) {
                        Text("여행 \(4)일차")
                            .font(.aggro(.light, size: 17))
                            .padding(.top, 40)
                            .padding(.bottom, 12)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("현재 예산의")
                                Text("\(24)%")
                                    .font(.aggro(.bold, size: 32))
                                    .foregroundStyle(Color.main)
                            }
                            Text("사용했어요")
                        }
                        .font(.aggro(.medium, size: 32))
                        .padding(.bottom, 32)
                        
                        HStack(alignment: .bottom) {
                            Text("\(24000)\("엔")")
                                .font(.aggro(.medium, size: 24))
                            Text("/ \(100000)\("엔")")
                                .font(.aggro(.light, size: 17))
                                .foregroundStyle(Color.gray4)
                                .padding(.bottom, 2)
                        }
                        .padding(.bottom, 16)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(height: 40)
                                .foregroundStyle(Color.appGray)
                            
                            HStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: (gr.size.width - 40) * 24 / 100, height: 40)
                                    .foregroundStyle(Color.main)
                                
                                Spacer()
                            }
                        }
                    }
                    
                    
                    Rectangle()
                        .foregroundStyle(Color.appGray)
                        .frame(height: 200)
                        .padding(.bottom, 24)
                    
                    
                    LazyVStack(alignment: .leading, spacing: 24) {
                        Text("전체 지출내역")
                            .font(.aggro(.medium, size: 24))
                        
                        ForEach(spendingHistory.history) { spending in
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
                .padding(.horizontal, 20)
            }
        }
    }
}

extension MainSpendHistoryView {
    func toKRW(of spending: SpendingModel) -> String {
        return (spending.amount / spending.exchangeRate).toString(maxFractionDigit: 0) + "KRW"
    }
}

#Preview {
    MainSpendHistoryView(spendingHistory: SpendingHistoryModel.mockup())
}
