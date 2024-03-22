//
//  File.swift
//  
//
//  Created by 남유성 on 3/22/24.
//

import Foundation

struct Country {
    var name: String
    var currency: String
}

extension Country {
    static func empty() -> Country {
        Country(name: "None", currency: "None")
    }
    
    static func MockUp() -> [Country] {
        Array(
            repeating: Country(name: "일본", currency: "JPY"),
            count: 100
        )
    }
}
