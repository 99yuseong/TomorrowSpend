//
//  CreateTripSelectCountryView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension CreateTripSelectCountryView: Flowable { }

struct CreateTripSelectCountryView: View {
    @EnvironmentObject var tripData: TripData
    @Binding var countries: [Country]
    
    @State private var searchText = ""
    @FocusState private var isFocused: Bool
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries.sorted { $0.nameKR < $1.nameKR }
        } else {
            return countries.filter { $0.nameKR.contains(searchText) }
        }
    }
    
    var pagination: () -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                Text("어디로")
                    .foregroundStyle(Color.main)
                Text("여행 가시나요?")
            }
            .font(.aggro(.medium, size: 34))
            .padding(.top, 60)
            
            TextField("검색", text: $searchText)
                .padding()
                .foregroundStyle(Color.appPrimary)
                .background(Color.appGray.opacity(0.5))
                .focused($isFocused)
                .disableAutocorrection(true)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            ScrollView {
                ForEach(filteredCountries, id: \.countryCode) { country in
                    HStack {
                        Text(country.nameKR)
                            .font(.aggro(.light, size: 20))
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .onTapGesture {
                        isFocused = false
                        tripData.updateCountry(to: country)
                        pagination()
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CreateTripSelectCountryView(countries: .constant([])) {}
}
