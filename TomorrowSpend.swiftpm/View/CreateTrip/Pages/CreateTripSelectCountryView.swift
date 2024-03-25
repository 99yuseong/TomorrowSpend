//
//  CreateTripSelectCountryView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension CreateTripSelectCountryView: Flowable { }

struct CreateTripSelectCountryView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var tripData: TripData
    
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
                ForEach(appState.countries, id: \.countryCode) { country in
                    HStack {
                        Text(country.nameKR)
                            .font(.aggro(.light, size: 20))
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .onTapGesture {
                        tripData.country = country
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
