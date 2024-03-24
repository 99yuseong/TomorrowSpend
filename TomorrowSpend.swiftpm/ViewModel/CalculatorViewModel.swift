//
//  ExchangeCalculatorModel.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display: String = ""
    @Published var total: Double = 0.0
    
    private var expression: String = ""
    
    public var isExpressionEmpty: Bool { expression.isEmpty }
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
    private var isDotAtLast: Bool {
        guard let last = expression.last else { return false }
        
        return last == "."
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
    
    func inputDot() {
        guard !isOperatorAtLast,
              !isDotAtLast
        else {
            return
        }
        
        display += "."
        expression += "."
    }
    
    func calculate() {
        guard !expression.isEmpty else { return }
        
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
