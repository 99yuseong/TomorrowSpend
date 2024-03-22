//
//  CreateTripSelectDateView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension CreateTripSelectDateView: TripFlowable {}

struct CreateTripSelectDateView: View {
    var pagination: () -> ()
    
    var body: some View {
        VStack {
            Text("Select Date")
        }
    }
}

#Preview {
    CreateTripSelectDateView {}
}
