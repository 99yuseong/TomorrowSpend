//
//  SpendRecordSheet.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

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

struct SpendRecordFlowView: View {
    @EnvironmentObject var tripData: TripModel
    @ObservedObject var spendingHistory: SpendingHistoryModel
    @Binding var isSheetPresented: Bool
    
    @StateObject private var viewModel: SpendingModel = SpendingModel()
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
                        SpendRecordCategoryView(viewModel: viewModel) { 
                            pagination()
                        }
                    case .satisfy:
                        SpendRecordSatisfyView(viewModel: viewModel) {
                            spendingHistory.history.append(viewModel)
                            isSheetPresented = false
                        }
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
