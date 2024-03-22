//
//  MainView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var tripData: TripData
    
    var body: some View {
        Text(tripData.country.name)
        Text(tripData.country.currency)
        Text(tripData.startDate.description)
        Text(tripData.endDate.description)
    }
}

#Preview {
    MainView()
}
