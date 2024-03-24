//
//  CurrencyCalculatorView.swift
//
//
//  Created by 남유성 on 3/23/24.
//

import SwiftUI

struct MainExchangeCalculateView: View {    
    
    @StateObject var model = CalculatorViewModel()
    @State private var isCalculating: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                Text("오늘의 환율")
                HStack(spacing: 8) {
                    Text("\(defaultAmount().toString())\(currencyUnit())")
                        .foregroundStyle(Color.main)
                    Text("=")
                    Text("1000원")
                        .foregroundStyle(Color.accent)
                }
            }
            .font(.aggro(.medium, size: 28))
            .padding(.top, 40)
            .padding(.bottom, 24)
            
            HStack {
                Spacer()
                
                Image(Literals.sikSikE)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 68)
                    .padding(.trailing, 24)
                
                VStack(alignment: .leading) {
                    Text("씩씩이도")
                    HStack(spacing: 0) {
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
            .padding(.bottom, 16)
            
            VStack {
                if model.isExpressionEmpty {
                    Text("가격을 입력하세요")
                        .font(.aggro(.light, size: 24))
                        .foregroundStyle(Color.gray4)
                } else {
                    if isCalculating {
                        ZStack {
                            Text(model.totalString)
                            Text(toKRW(of: model.total))
                                .font(.aggro(.light, size: 16))
                                .foregroundStyle(Color.gray4)
                                .padding(.top, 68)
                        }
                    } else {
                        Text(model.display)
                    }
                     
                }
            }
            .font(.aggro(.medium, size: 24))
            .scaleToInfinity()
            
            CalculatorView(model: model, isCalculating: $isCalculating)
                .padding(.bottom, 24)
        }
        .padding(.horizontal, 20)
    }
}

extension MainExchangeCalculateView {
    func toKRW(of num: Double) -> String {
        // TODO: - 환율 계산
        var result = num * 10
        return result.toString() + "원"
    }
    
    func defaultAmount() -> Double {
        // TODO: - 많이 쓰이는 값
        return 100
    }
    
    func currencyUnit() -> String {
        // TODO: - 국가별 단위
        "엔"
    }
}

#Preview {
    MainExchangeCalculateView()
}
