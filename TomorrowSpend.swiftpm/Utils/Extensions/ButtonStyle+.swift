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
    let isEnabled: Bool
    
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
        .background(isEnabled ? color : Color.appGray, in: RoundedRectangle(cornerRadius: cornerRadius))
        .animation(.easeInOut, value: isEnabled)
    }
}

extension ButtonStyle where Self == RoundedButtonStyle {
    static func rounded(
        _ color: Color,
        fontSize: CGFloat = 17,
        height: CGFloat = 60,
        cornerRadius: CGFloat = 8,
        isEnabled: Bool = true
    ) -> Self {
        RoundedButtonStyle(
            color: color,
            fontSize: fontSize,
            height: height,
            cornerRadius: cornerRadius,
            isEnabled: isEnabled
        )
    }
}


#Preview {
    Button("커스텀 버튼") {
        print("Pressed")
    }
    .buttonStyle(.rounded(.blue))
}
