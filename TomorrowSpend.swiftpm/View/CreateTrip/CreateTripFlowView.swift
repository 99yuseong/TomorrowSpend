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

enum CreateTripPage {
    case main
    case info
    case selectCountry
    case selectDate
    case none
    
    func nextPage() -> CreateTripPage {
        switch self {
        case .main:
            return .info
        case .info:
            return .selectCountry
        case .selectCountry:
            return .selectDate
        default:
            return .none
        }
    }
}

struct CreateTripFlowView: View {
    @EnvironmentObject var appState: AppState

    @State private var pageTo: CreateTripPage = .main
    @State private var countries: [Country] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    switch pageTo {
                    case .main:
                        CreateTripMainView {
                            pagination()
                        }
                    case .info:
                        CreateTripInfoView {
                            pagination()
                        }
                    case .selectCountry:
                        CreateTripSelectCountryView(countries: $countries) {
                            pagination()
                        }
                    case .selectDate:
                        CreateTripSelectDateView {
                            appState.flow(to: .main)
                        }
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
                DataNetworkingMananger.shared.fetchCountryData {
                    countries = $0
                }
            }
        }
    }
    
    private func pagination() {
        withAnimation {
            pageTo = pageTo.nextPage()
        }
    }
}

#Preview {
    CreateTripFlowView()
}
