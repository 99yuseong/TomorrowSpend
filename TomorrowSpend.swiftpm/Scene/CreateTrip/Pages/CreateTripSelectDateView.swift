//
//  CreateTripSelectDateView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension CreateTripSelectDateView: TripFlowable {}

struct CreateTripSelectDateView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var isBtnEnabled = false
    
    var days: Int { startDate.days(to: endDate) }
    var pagination: () -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text("일본")
                        .foregroundStyle(Color.main)
                    Text("은")
                }
                Text("언제 가시나요?")
            }
            .font(.aggro(.medium, size: 34))
            .padding(.top, 60)
            .padding(.bottom, 24)
            
            Group {
                DatePicker(
                    "출발 날짜",
                    selection: $startDate,
                    displayedComponents: [.date])
                DatePicker(
                    "종료 날짜",
                    selection: $endDate,
                    in: startDate...,
                    displayedComponents: [.date]
                )
            }
            .tint(.main)
            .font(.aggro(.light, size: 17))
            
            Spacer()
            
            if days > 0 {
                Text("총 \(days)일의 여행기간\n가치있게 소비해봐요!")
                    .font(.aggro(.medium, size: 22))
            }
            
            Button("설정 완료!") {
                pagination()
            }
            .buttonStyle(.rounded(.appPrimary, isEnabled: isBtnEnabled))
            .disabled(days <= 0)
        }
        .padding(.horizontal, 20)
        .onChange(of: endDate) { _ in
            withAnimation {
                isBtnEnabled = days > 0
            }
        }
    }
}

#Preview {
    CreateTripSelectDateView {}
}
