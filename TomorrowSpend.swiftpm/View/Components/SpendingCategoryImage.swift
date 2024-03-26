//
//  CategoryImage.swift
//
//
//  Created by 남유성 on 3/27/24.
//

import SwiftUI

struct SpendingCategoryImage: View {
    enum Size: CGFloat {
        case small = 60
        case large = 68
    }
    
    let category: SpendCategory
    let size: Size
    
    var body: some View {
        Text(category.iconImageFont)
            .font(.tossFace(size: size == .large ? 28 : 24))
            .frame(width: size.rawValue, height: size.rawValue)
            .background(category.iconBackground)
            .clipShape(RoundedRectangle(cornerRadius: size == .large ? 8 : 30))
    }
}

#Preview {
    VStack {
        ForEach(SpendCategory.allCases, id: \.iconImageFont) {
            SpendingCategoryImage(category: $0, size: .large)
        }
    }
}
