//
//  SpendRecordSheet.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

struct SpendRecordFlowView: View {
    enum Page {
        case typing
        case category
        case satisfy
    }
    
    @State private var pageTo: Page = .typing
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    switch pageTo {
                    case .typing:
                        SpendRecordTypingView { page(to: .category) }
                    case .category:
                        SpendRecordCategoryView { page(to: .satisfy) }
                    case .satisfy:
                        SpendRecordSatisfyView {  }
                    }
                }
                .transition(.reverSlide)
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
    SpendRecordFlowView()
}
