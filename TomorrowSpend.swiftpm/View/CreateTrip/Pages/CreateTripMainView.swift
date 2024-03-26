//
//  CreateTripMainView.swift
//  TomorrowSpend
//
//  Created by 남유성 on 3/21/24.
//

import SwiftUI

extension CreateTripMainView: Flowable {}

struct CreateTripMainView: View {
    @State private var isComponentShowing: Bool = false
    
    var pagination: () -> ()
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                Color.mainBg.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Group {
                        HStack(alignment: .top) {
                            Text("내일의 소비를\n가치있게")
                                .font(.aggro(.medium, size: 34))
                            
                            Image(systemName: Icons.card)
                                .font(.system(size: 34))
                        }
                        .foregroundStyle(Color.white)
                        .padding(.top, 60)
                        .padding(.bottom, 48)
                        
                        VStack(alignment: .leading) {
                            Text("여행에서")
                            Text("아쉬웠던 소비를")
                            HStack {
                                Text("내일")
                                Text("다시 반복하지 않도록")
                                    .font(.aggro(.medium, size: 20))
                            }
                        }
                        .font(.aggro(.light, size: 20))
                        
                        Spacer(minLength: 24)
                    }
                    .opacity(isComponentShowing ? 1 : 0)
                    
                    Image(Literals.sikSikE)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .offset(x: -40)
                        .animation(nil, value: isComponentShowing)
                    
                    Spacer()
                    Spacer()
                    
                    Button("시작하기") {
                        pagination()
                    }
                    .buttonStyle(.rounded(.appPrimary))
                    .disabled(!isComponentShowing)
                    .opacity(isComponentShowing ? 1 : 0)
                }
                .padding(.horizontal, 20)
                
                Circle()
                    .stroke(Color.appPrimary, lineWidth: 6)
                    .frame(width: gr.size.width, height: gr.size.height)
                    .scaleEffect(2)
                    .offset(x: 0, y: -150)
                    .clipped()
            }
        }
        .onAppear {
            withAnimation {
                isComponentShowing = true
            }
        }
    }
}

#Preview {
    CreateTripMainView {}
}
