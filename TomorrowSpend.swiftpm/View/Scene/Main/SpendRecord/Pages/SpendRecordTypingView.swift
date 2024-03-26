//
//  SpendRecordTypingView.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

extension SpendRecordTypingView: Flowable { }

struct SpendRecordTypingView: View {
    @ObservedObject var viewModel: SpendingModel
    @State private var displayAmount: String = ""
    
    var currencyList: [Currency]
    var currencyListWithKRW: [Currency] {
        var newList = currencyList
        newList.append(Currency.KRW)
        return newList
    }
    
    private let buttons = [
        ["7", "8", "9"],
        ["4", "5", "6"],
        ["1", "2", "3"],
        [".", "0", "erase"]
    ]
    
    var pagination: () -> ()
    
    var body: some View {
        VStack {
            Text("지출 기록")
                .font(.aggro(.medium, size: 20))
                .padding(.top, 40)
                .padding(.bottom, 40)
            
            HStack(alignment: .top, spacing: 40) {
                ForEach(currencyListWithKRW, id: \.code) { currency in
                    currencyButton(currency)
                }
            }
            .font(.aggro(.medium, size: 18))
            
            VStack {
                if displayAmount.isEmpty {
                    Text("금액을 입력하세요")
                } else {
                    ZStack {
                        Text("\(displayAmount) \(viewModel.currencyType)")
                        if viewModel.currencyType != "KRW" {
                            Text(toKRW(of: displayAmount.currencyToDouble()))
                                .font(.aggro(.light, size: 16))
                                .foregroundStyle(Color.gray4)
                                .padding(.top, 100)
                        }
                    }
                }
            }
            .font(.aggro(displayAmount.isEmpty ? .light : .medium, size: 24))
            .foregroundStyle(displayAmount.isEmpty ? Color.gray5 : Color.appPrimary)
            .scaleToInfinity()
            
            VStack(spacing: 0) {
                ForEach(buttons, id: \.self) { btn in
                    HStack(spacing: 0) {
                        ForEach(btn, id: \.self) { label in
                            Button {
                                buttonTapped(label)
                            } label: {
                                calculatorButton(label)
                            }
                            .frame(height: 70)
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                Button("카드 지출") {
                    viewModel.type = .card
                    pagination()
                }
                .buttonStyle(.rounded(.accent))
                
                Button("현금 지출") {
                    viewModel.type = .cash
                    pagination()
                }
                .buttonStyle(.rounded(.main))
            }
        }
        .padding(.horizontal, 20)
        .onAppear {
            viewModel.currencyType = currencyList.first?.code ?? ""
            viewModel.exchangeRate = currencyList.first?.exchangeRate ?? 0
        }
    }
    
    @ViewBuilder
    func calculatorButton(_ label: String) -> some View {
        if label == "erase" {
            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                    .scaleToInfinity()
                Image(systemName: Icons.delete)
                    .font(.system(size: 24))
            }
        } else {
            Text(label)
                .font(.aggro(.light, size: 22))
                .scaleToInfinity()
        }
    }
    
    @ViewBuilder
    func currencyButton(_ currency: Currency) -> some View {
        Button {
            viewModel.currencyType = currency.code
            viewModel.exchangeRate = currency.exchangeRate
        } label: {
            VStack(spacing: -12) {
                Text(currency.code)
                    .padding()
                if viewModel.currencyType == currency.code {
                    RoundedRectangle(cornerRadius: 1.5)
                        .frame(width: 36, height: 3)
                }
            }
        }
        .foregroundStyle(viewModel.currencyType == currency.code ? Color.appPrimary : Color.gray5)
    }
}

extension SpendRecordTypingView {
    func toKRW(of num: Double) -> String {
        return (num / viewModel.exchangeRate).toString(maxFractionDigit: 0) + "원"
    }
    
    func buttonTapped(_ label: String) {
        switch label {
        case "erase":
            if !displayAmount.isEmpty {
                displayAmount.removeLast()
            }
            return
        case ".":
            guard let last = displayAmount.last,
                  last != "."
            else { return }
            displayAmount += label
        default:
            let newValue = displayAmount + label
            displayAmount = newValue.currencyToDouble().toString()
        }
    }
}

#Preview {
    SpendRecordTypingView(viewModel: SpendingModel(), currencyList: [
        Currency(exchangeRate: 0.5, code: "JPY")
    ], pagination: {})
}
