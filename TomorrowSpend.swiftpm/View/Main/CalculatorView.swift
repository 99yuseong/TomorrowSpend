//
//  CalculatorView.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

struct CalculatorView: View {
    
    private let buttons = [
        ["AC", "÷", "×", "erase"],
        ["1", "2", "3", "×"],
        ["4", "5", "6", "-"],
        ["7", "8", "9", "+"],
        [".", "0", "00", "="]
    ]
    
    @ObservedObject var model: CalculatorViewModel
    @Binding var isCalculating: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(buttons, id: \.self) { btn in
                HStack(spacing: 0) {
                    ForEach(btn, id: \.self) { label in
                        Button {
                            buttonTapped(label)
                        } label: {
                            calculatorButton(label)
                        }
                        .frame(minHeight: 60)
                    }
                }
            }
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
}

extension CalculatorView {
    func buttonTapped(_ value: String) {
        switch value {
        case "0"..."9":
            input(num: value)
        case "+":
            performOperation(.add)
        case "-":
            performOperation(.subtract)
        case "×":
            performOperation(.multiply)
        case "÷":
            performOperation(.divide)
        case "=":
            model.calculate()
            isCalculating = true
        case "erase":
            model.erase()
        case "AC":
            model.clear()
        case ".":
            model.inputDot()
        default:
            break
        }
    }
    
    func input(num: String) {
        if isCalculating {
            model.clear()
            isCalculating = false
        }
        
        model.inputNum(num)
    }
    
    func performOperation(_ input: Operation) {
        if isCalculating {
            model.expandExpression()
            isCalculating = false
        }
        
        switch input {
        case .add:
            model.inputOperator(.add)
        case .subtract:
            model.inputOperator(.subtract)
        case .multiply:
            model.inputOperator(.multiply)
        case .divide:
            model.inputOperator(.divide)
        }
    }
}
