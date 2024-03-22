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
        VStack {
            Text("Trip Info")
            Button("다음단계") {
                pagination()
            }
            .buttonStyle(.rounded(.main))
            .padding([.horizontal], 20)
        }
    }
}

#Preview {
    CreateTripInfoView {}
}
