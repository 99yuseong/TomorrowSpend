//
//  CreateTripInfoView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension CreateTripInfoView: TripFlowable {}

struct CreateTripInfoView: View {
    var pagination: () -> ()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text("아쉬웠던 소비")
                        .foregroundStyle(Color.accent)
                    Text("가")
                }
                Text("쌓여가고 있나요?")
            }
            .font(.aggro(.medium, size: 32))
            .padding(.top, 60)
            .padding(.bottom, 48)
            
            Rectangle()
                .frame(width: .infinity, height: 300)
                .foregroundStyle(Color.appGray)
                .padding(.bottom, 24)
            
            Text("하루를 되돌아보며\n오늘의 소비를 같이 떠올려봐요")
                .font(.aggro(.light, size: 17))
            
            Spacer()
            
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text("여행동안 ")
                    Text("내일의 소비")
                        .font(.aggro(.medium, size: 20))
                    Text("를")
                }
                Text("가치있게 만들어 드릴게요!")
            }
            .font(.aggro(.light, size: 20))
            .padding(.bottom, 24)
            
            Button("다음단계") {
                pagination()
            }
            .buttonStyle(.rounded(.main))
        }
        .padding([.horizontal], 20)
    }
}

#Preview {
    CreateTripInfoView {}
}
