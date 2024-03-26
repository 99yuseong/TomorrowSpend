//
//  SpendRecordCategoryView.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

extension SpendRecordCategoryView: Flowable { }

struct SpendRecordCategoryView: View {
    @ObservedObject var viewModel: SpendingModel
    
    @State private var category: SpendCategory = .meal
    @State private var memo: String = ""
    @State private var recommedSelected: String = ""
    
    @FocusState private var isFocused: Bool
    
    var pagination: () -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("카테고리")
                .font(.aggro(.medium, size: 24))
                .padding(.top, 40)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(SpendCategory.allCases, id: \.description) { item in
                        selectionView(item)
                            .onTapGesture {
                                withAnimation {
                                    category = item
                                }
                            }
                    }
                }
                .padding(20)
            }
            .font(.aggro(.light, size: 17))
            .padding(.bottom, 32)

            VStack(alignment: .leading, spacing: 24) {
                Text("메모")
                    .font(.aggro(.medium, size: 24))
                
                TextField("어떤 지출인가요?", text: $memo)
                    .font(.aggro(.light, size: 28))
                    .focused($isFocused)
                    .disableAutocorrection(true)
                    .keyboardType(.alphabet)
                
                HStack(spacing: 12) {
                    ForEach(category.recommendation, id: \.description) { item in
                        recommedationView(item)
                            .onTapGesture {
                                withAnimation {
                                    if recommedSelected == item {
                                        recommedSelected = ""
                                        memo = ""
                                    } else {
                                        recommedSelected = item
                                        memo = recommedSelected
                                    }
                                }
                            }
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button("다음단계") {
                isFocused = false
                viewModel.category = category
                viewModel.memo = memo
                pagination()
            }
            .buttonStyle(.rounded(.main))
            .padding(.horizontal, 20)
            .padding(.bottom, isFocused ? 20 : 0)
        }
    }
    
    @ViewBuilder
    func recommedationView(_ item: String) -> some View {
        Text(item)
            .foregroundStyle(recommedSelected == item ? Color.accent : Color.appPrimary)
            .font(.aggro(.light, size: 17))
            .padding(.top, 10)
            .padding([.horizontal, .bottom], 8)
            .overlay(
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(recommedSelected == item ? Color.accent : Color.appPrimary, lineWidth: 2)
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(recommedSelected == item ? Color.accent.opacity(0.05): Color.clear)
                }
            )
    }
    
    @ViewBuilder
    func selectionView(_ item: SpendCategory) -> some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 60)
                    .foregroundStyle(Color.appGray)
                if category == item {
                    Circle()
                        .stroke(Color.main, lineWidth: 4)
                        .frame(width: 60)
                        .transition(.identity)
                }
            }
            Text(item.description)
        }
    }
}

#Preview {
    SpendRecordCategoryView(viewModel: SpendingModel()) { }
}
