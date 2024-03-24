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
        ["1", "2", "3", "-"],
        ["4", "5", "6", "+"],
        ["7", "8", "9", ""],
        [".", "0", "00", "="]
    ]
    
    @StateObject private var model = ExchangeCalculatorModel()
    @State private var isCalculated: Bool = false
    
    var body: some View {
        
        VStack {
            Text(model.display)
                .font(.largeTitle)
                .padding()
            
            if isCalculated {
                Text(model.totalString)
            }
        }
        
        VStack(spacing: 0) {
            ForEach(buttons, id: \.self) { button in
                
                HStack(spacing: 0) {
                    ForEach(button, id: \.self) { label in
                        Button {
                            
                            buttonTapped(label)
                            
                        } label: {
                            Group {
                                if label == "erase" {
                                    ZStack {
                                        Rectangle()
                                            .foregroundStyle(.white)
                                            .scaleToInfinity()
                                        Image(systemName: Icons.delete)
                                            .font(.system(size: 28))
                                    }
                                } else {
                                    Text(label)
                                        .font(.aggro(.light, size: 22))
                                        .scaleToInfinity()
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    func buttonTapped(_ button: String) {
        switch button {
        case "0"..."9":
            if isCalculated {
                model.clear()
                isCalculated = false
            }
            model.inputNum(button)
            
        case "+":
            if isCalculated {
                model.expandExpression()
                isCalculated = false
            }
            model.inputOperator(.add)
            
        case "-":
            if isCalculated {
                model.expandExpression()
                isCalculated = false
            }
            model.inputOperator(.subtract)
        case "×":
            if isCalculated {
                model.expandExpression()
                isCalculated = false
            }
            model.inputOperator(.multiply)
        case "÷":
            if isCalculated {
                model.expandExpression()
                isCalculated = false
            }
            model.inputOperator(.divide)
        case "=":
            model.calculate()
            isCalculated = true
        case "erase":
            model.erase()
        case "AC":
            model.clear()
        default:
            break
        }
    }
}

#Preview {
    CalculatorView()
}

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    var display: String {
        switch self {
        case.add:
            return "+"
        case.subtract:
            return "-"
        case.multiply:
            return "×"
        case.divide:
            return "÷"
        }
    }
}

class ExchangeCalculatorModel: ObservableObject {
    @Published var display: String = ""
    @Published var total: Double = 0.0
    
    private var expression: String = ""
    
    public var isTotalZero: Bool { total == 0.0 }
    public var totalString: String {
        total.toString(maxFractionDigit: 3)
    }
    
    private var isOperatorAtLast: Bool {
        guard let last = expression.last else { return false }
        
        switch last {
        case "+", "-", "*", "/":
            return true
        default:
            return false
        }
    }
    
    func inputNum(_ number: String) {
        display += number
        expression += number
    }
    
    func inputOperator(_ operation: Operation) {
        guard !expression.isEmpty else { return }
        
        if isOperatorAtLast {
            erase()
        }
    
        display += " \(operation.display) "
        expression += operation.rawValue
    }
    
    func calculate() {        
        if isOperatorAtLast {
            erase()
        }
        
        let expr = NSExpression(format: expression)
        guard let resultValue = expr.expressionValue(with: nil, context: nil) as? NSNumber else { return }
        
        total = Double(truncating: resultValue)
    }
    
    func erase() {
        guard !expression.isEmpty else { return }
        
        if isOperatorAtLast {
            display.removeLast(3)
        } else {
            display.removeLast()
        }
        expression.removeLast()
        
        if expression.isEmpty {
            total = 0.0
        }
    }

    func clear() {
        expression = ""
        display = ""
        total = 0.0
    }
    
    func expandExpression() {
        expression = String(total)
        display = totalString
    }
}
