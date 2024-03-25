//
//  CreateTripFlowView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

protocol Flowable {
    var pagination: () -> () { get set }
}

struct CreateTripFlowView: View {
    @EnvironmentObject var appState: AppState
    
    private enum Page {
        case main
        case info
        case selectCountry
        case selectDate
        case none
    }
    
    @State private var pageTo: Page = .main
    @State private var countries: [Country] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    switch pageTo {
                    case .main:
                        CreateTripMainView { page(to: .info) }
                    case .info:
                        CreateTripInfoView { page(to: .selectCountry) }
                    case .selectCountry:
                        CreateTripSelectCountryView { page(to: .selectDate) }
                    case .selectDate:
                        CreateTripSelectDateView { appState.flow(to: .main) }
                    default:
                        EmptyView()
                    }
                }
                .transition(.reverSlide)
            }
        }
        .background(Color.mainBg)
        .onAppear {
            DispatchQueue.global().async {
                countries = CountryManager.shared.loadCountryData()
            }
        }
    }
    
    private func page(to nextPage: Page) {
        withAnimation {
            pageTo = nextPage
        }
    }
}

#Preview {
    CreateTripFlowView()
}
