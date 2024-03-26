//
//  SpendingSatisfactionImage.swift
//  
//
//  Created by 남유성 on 3/27/24.
//

import SwiftUI

struct SpendingSatisfactionImage: View {
    enum Size: CGFloat {
        case large = 60
        case small = 32
    }
    
    let satisfaction: SpendSatisfaction
    let size: Size
    
    var body: some View {
        Text(satisfaction.iconImageFont)
            .font(.tossFace(size: size == .large ? 28 : 17))
            .frame(width: size.rawValue, height: size.rawValue)
            .background(satisfaction.iconBackground)
            .clipShape(RoundedRectangle(cornerRadius: size == .large ? 30 : 16))
    }
}

#Preview {
    VStack {
        ForEach(SpendSatisfaction.allCases, id: \.iconImageFont) {
            SpendingSatisfactionImage(satisfaction: $0, size: .large)
        }
        ForEach(SpendSatisfaction.allCases, id: \.iconImageFont) {
            SpendingSatisfactionImage(satisfaction: $0, size: .small)
        }
    }
}

