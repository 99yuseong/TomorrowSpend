//
//  CreateTripMainView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/21/24.
//

import SwiftUI

extension CreateTripMainView: TripFlowable {}

struct CreateTripMainView: View {
    var pagination: () -> ()
    
    var body: some View {
        VStack {
            Text("Trip Main")
            Button("다음단계") {
                pagination()
            }
            .buttonStyle(.rounded(.main))
            .padding([.horizontal], 20)
        }
    }
}

#Preview {
    CreateTripMainView {}
}
