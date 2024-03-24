//
//  CurrencyCalculatorView.swift
//
//
//  Created by 남유성 on 3/23/24.
//

import SwiftUI

struct MainExchangeCalculateView: View {    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("오늘의 환율")
                HStack(spacing: 8) {
                    Text("100엔")
                        .foregroundStyle(Color.main)
                    Text("=")
                    Text("1000원")
                        .foregroundStyle(Color.accent)
                }
            }
            .font(.aggro(.medium, size: 32))
            
            HStack {
                Spacer()
                
                Image(Literals.sikSikE)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 68)
                    .padding(.trailing, 24)
                
                VStack(alignment: .leading) {
                    Text("씩씩이도")
                    HStack {
                        Text("가치있는 소비")
                            .font(.aggro(.medium, size: 17))
                            .foregroundStyle(Color.main)
                        Text("를 응원할게요!")
                    }
                }
                
                Spacer()
            }
            .font(.aggro(.light, size: 18))
            .padding(.vertical, 16)
            .background(
                Color.mainBg.opacity(0.1),
                in: RoundedRectangle(cornerRadius: 8)
            )
            
            CalculatorView()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MainExchangeCalculateView()
}
