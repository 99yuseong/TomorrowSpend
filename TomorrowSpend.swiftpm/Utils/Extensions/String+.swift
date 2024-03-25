//
//  String+.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

extension String {
    func remove(_ subString: String) -> String {
        self.replacingOccurrences(of: subString, with: "")
    }
    
    func currencyToDouble() -> Double {
        guard let result = Double(self.remove(",")) else {
            print(#fileID, #function, #line, "Error Currency to Double")
            return 0.0
        }
        
        return result
    }
}
