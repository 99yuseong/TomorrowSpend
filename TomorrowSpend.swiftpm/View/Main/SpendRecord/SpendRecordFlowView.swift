//
//  SpendRecordSheet.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

struct SpendRecordFlowView: View {
    @EnvironmentObject var tripData: TripData
    enum RecordPage {
        case typing
        case category
        case satisfy
        case none
        
        func nextPage() -> RecordPage {
            switch self {
            case .typing:
                return .category
            case .category:
                return .satisfy
            default:
                return .none
            }
        }
    }
    
    @StateObject private var viewModel: SpendFlowModel = SpendFlowModel()
    @State private var pageTo: RecordPage = .typing
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    switch pageTo {
                    case .typing:
                        SpendRecordTypingView(
                            viewModel: viewModel,
                            currencyList: tripData.country.currencies
                        ) {
                            pagination()
                        }
                    case .category:
                        SpendRecordCategoryView { pagination() }
                    case .satisfy:
                        SpendRecordSatisfyView {  }
                    case .none:
                        EmptyView()
                    }
                }
                .transition(.reverSlide)
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
    SpendRecordFlowView()
}
