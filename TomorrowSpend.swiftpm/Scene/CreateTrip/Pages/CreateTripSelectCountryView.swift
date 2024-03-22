//
//  CreateTripSelectCountryView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension CreateTripSelectCountryView: TripFlowable { }

struct CreateTripSelectCountryView: View {
    var pagination: () -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading) {
                Text("어디로")
                    .foregroundStyle(Color.main)
                Text("여행 가시나요?")
            }
            .font(.aggro(.medium, size: 34))
            .padding(.top, 60)
            
            ScrollView {
                ForEach(Country.MockUp(), id: \.name) { country in
                    HStack {
                        Text(country.name)
                            .font(.aggro(.light, size: 20))
                        Spacer()
                    }
                    .padding()
                    .onTapGesture {
                        pagination()
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CreateTripSelectCountryView {}
}
