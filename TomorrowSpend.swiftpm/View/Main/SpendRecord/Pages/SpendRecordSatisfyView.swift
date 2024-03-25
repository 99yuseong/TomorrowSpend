//
//  SwiftUIView.swift
//  
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

extension SpendRecordSatisfyView: Flowable { }

struct SpendRecordSatisfyView: View {
    
    @State private var satisfaction: SpendSatisfaction = .notSet
    
    var pagination: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("소비는 만족스러우셨나요?")
                .font(.aggro(.medium, size: 24))
                .padding(.top, 60)
                .padding(.bottom, 24)
            
            HStack(spacing: 24) {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 60)
                            .foregroundStyle(Color.appGray)
                        if satisfaction == .notSet {
                            Circle()
                                .stroke(Color.main, lineWidth: 4)
                                .frame(width: 60)
                                .transition(.identity)
                        }
                    }
                    Text(SpendSatisfaction.notSet.description)
                }
                .onTapGesture {
                    withAnimation {
                        satisfaction = .notSet
                    }
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 60)
                            .foregroundStyle(Color.appGray)
                        if satisfaction == .satisfied {
                            Circle()
                                .stroke(Color.main, lineWidth: 4)
                                .frame(width: 60)
                                .transition(.identity)
                        }
                    }
                    Text(SpendSatisfaction.satisfied.description)
                }
                .onTapGesture {
                    withAnimation {
                        satisfaction = .satisfied
                    }
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 60)
                            .foregroundStyle(Color.appGray)
                        if satisfaction == .dissatisfied {
                            Circle()
                                .stroke(Color.main, lineWidth: 4)
                                .frame(width: 60)
                                .transition(.identity)
                        }
                    }
                    Text(SpendSatisfaction.dissatisfied.description)
                }
                .onTapGesture {
                    withAnimation {
                        satisfaction = .dissatisfied
                    }
                }
            }
            .font(.aggro(.light, size: 17))
            .padding(.bottom, 48)
            
            descriptionView()
                .font(.aggro(.light, size: 20))
            
            Spacer()
            
            Button("기록하기") {
                pagination()
            }
            .buttonStyle(.rounded(.main))
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func descriptionView() -> some View {
        switch satisfaction {
        case .notSet:
            VStack(alignment: .leading, spacing: 0) {
                Text("아직 잘 모르겠다면,")
                HStack(spacing: 0) {
                    Text("스킵")
                        .font(.aggro(.medium, size: 20))
                    Text("할 수 있어요!")
                }
            }
        case .satisfied:
            Text("만족스러운 소비를 하셨네요!\n축하드려요!")
        case .dissatisfied:
            Text("조금 아쉽더라도,\n다음 소비를 준비해봐요!")
        }
    }
}

#Preview {
    SpendRecordSatisfyView {}
}
