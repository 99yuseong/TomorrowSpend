//
//  Date+.swift
//  
//
//  Created by 남유성 on 3/22/24.
//

import Foundation

extension Date {
    func days(to endDate: Date) -> Int {
        let calendar = Calendar.current
            
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: endDate)
            
        let components = calendar.dateComponents([.day], from: date1, to: date2)
            
        return components.day ?? 0
    }
}
