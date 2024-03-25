//
//  SpendRecordTypingView.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

extension SpendRecordTypingView: Flowable { }

struct SpendRecordTypingView: View {
    
    @State private var currencyList: [Currency] = []
    @State private var selectedCurrency: Int = 0
    @State private var amount: String = ""
    
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
                ForEach(Array(currencyList.enumerated()), id: \.offset) { idx, element in
                    currencyButton(of: idx)
                }
            }
            .font(.aggro(.medium, size: 18))
            
            Text(amount.isEmpty ? "금액을 입력하세요" : "\(amount)")
                .font(.aggro(amount.isEmpty ? .light : .medium, size: 24))
                .foregroundStyle(amount.isEmpty ? Color.gray5 : Color.appPrimary)
            
            if !amount.isEmpty {
//                CurrencyManager.shared.convert(<#T##value: Double##Double#>)
            }
            
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
                    pagination()
                }
                .buttonStyle(.rounded(.accent))
                
                Button("현금 지출") {
                    pagination()
                }
                .buttonStyle(.rounded(.main))
            }
        }
        .padding(.horizontal, 20)
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
    
    func currencyButton(of idx: Int) -> some View {
        Button {
            selectedCurrency = idx
        } label: {
            VStack(spacing: -12) {
                Text(currencyList[idx].unit)
                    .padding()
                if selectedCurrency == idx {
                    RoundedRectangle(cornerRadius: 1.5)
                        .frame(width: 36, height: 3)
                }
            }
        }
        .foregroundStyle(selectedCurrency == idx ? Color.appPrimary : Color.gray5)
    }
}

extension SpendRecordTypingView {
    func buttonTapped(_ label: String) {
        switch label {
        case "erase":
            if !amount.isEmpty {
                amount.removeLast()
            }
            return
        case ".":
            guard let last = amount.last,
                  last != "."
            else { return }
            amount += label
        default:
            let newValue = amount + label
            amount = newValue.currencyToDouble().toString()
        }
    }
}

#Preview {
    SpendRecordTypingView {}
}
