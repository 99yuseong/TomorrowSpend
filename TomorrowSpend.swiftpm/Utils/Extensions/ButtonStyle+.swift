//
//  ButtonStyle+.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/21/24.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    let color: Color
    let fontSize: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
                .font(.aggro(.medium, size: fontSize))
                .foregroundStyle(.white)
                .opacity(configuration.isPressed ? 0.5 : 1)
                .padding(.top, 4)
            Spacer()
        }
        .frame(height: height)
        .background(color, in: RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension ButtonStyle where Self == RoundedButtonStyle {
    static func rounded(
        _ color: Color,
        fontSize: CGFloat = 17,
        height: CGFloat = 60,
        cornerRadius: CGFloat = 8
    ) -> Self {
        RoundedButtonStyle(
            color: color,
            fontSize: fontSize,
            height: height,
            cornerRadius: cornerRadius
        )
    }
}


#Preview {
    Button("커스텀 버튼") {
        print("Pressed")
    }
    .buttonStyle(.rounded(.blue))
}
