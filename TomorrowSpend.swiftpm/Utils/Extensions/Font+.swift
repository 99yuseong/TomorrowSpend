//
//  Font+.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension Font {
    static func aggro(_ font: FontAggro, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }
    
    static func tossFace(size: CGFloat) -> Font {
        return Font.custom(FontTossFace.basic.rawValue, size: size)
    }
}
