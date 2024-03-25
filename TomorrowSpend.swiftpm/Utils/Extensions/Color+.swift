//
//  Color+.swift
//
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension Color {
    static let main = Color(hex: "#35F275")
    static let mainBg = Color(hex: "#35D96D")
    static let accent = Color(hex: "#F27535")
    static let appPrimary = Color(hex: "#1C1C1C")
    static let appGray = Color(hex: "#E5E5E5")
    static let gray4 = Color(hex: "#818181")
    static let gray5 = Color(hex: "#9A9A9A")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    VStack {
        Rectangle()
            .foregroundStyle(Color.main)
        Rectangle()
            .foregroundStyle(Color.mainBg)
        Rectangle()
            .foregroundStyle(Color.accent)
        Rectangle()
            .foregroundStyle(Color.primary)
    }
}
