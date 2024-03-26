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
        ScrollView(.vertical) {
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
                
                LazyVStack {
                    ForEach(spendingHistory.history) { spending in
                        HStack {
                            Text(spending.category.iconImageFont)
                                .font(.tossFace(size: 20))
                                .onAppear {
                                    for family: String in UIFont.familyNames {
                                                print(family)
                                            for names : String in UIFont.fontNames(forFamilyName: family) {
                                                    print("=== \(names)")
                                              }
                                        }
                                }
                        }
                        Text(spending.memo)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MainSpendCheckView(spendingHistory: SpendingHistoryModel.mockup())
}
