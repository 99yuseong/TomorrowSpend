//
//  MainView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var tripData: TripData
    
    @State private var isPresented: Bool = true
    
    var body: some View {
        TabView {
            MainExchangeCalculateView()
                .tabItem {
                    Image(systemName: Icons.exchange)
                    Text("환율 계산기")
                }
            
            MainSpendCheckView()
                .tabItem {
                    Image(systemName: Icons.check)
                    Text("소비 체크")
                }
            
            MainSpendHistoryView()
                .tabItem {
                    Image(systemName: Icons.card)
                        .fontWeight(.thin)
                    Text("소비 내역")
                        .font(.aggro(.light, size: 17))
                }
        }
        .tint(.appPrimary)
        .sheet(isPresented: $isPresented) {
            SpendRecordFlowView()
        }
    }
}

#Preview {
    MainView()
}
