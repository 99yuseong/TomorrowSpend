//
//  FontAggro.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/21/24.
//

import SwiftUI

enum FontAggro: String {
    case bold = "SB 어그로 B"
    case medium = "SB 어그로 M"
    case light = "SB 어그로 L"
}

public struct FontManager {
    public static func registerFonts() {
        registerFont(
            bundle: Bundle.main,
            fontName: FontAggro.bold.rawValue,
            fontExtension: ".ttf"
        )
        registerFont(
            bundle: Bundle.main,
            fontName: FontAggro.medium.rawValue,
            fontExtension: ".ttf"
        )
        registerFont(
            bundle: Bundle.main,
            fontName: FontAggro.light.rawValue,
            fontExtension: ".ttf"
        )
    }
    
    fileprivate static func registerFont(
        bundle: Bundle,
        fontName: String,
        fontExtension: String
    ) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
