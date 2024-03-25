//
//  SwiftUIView.swift
//  
//
//  Created by 남유성 on 3/25/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimating = false
        
    var body: some View {
        GeometryReader { gr in
            ZStack {
                Color.mainBg.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Group {
                        Text("\n")
                            .font(.aggro(.medium, size: 34))
                            .padding(.top, 60)
                            .padding(.bottom, 48)
                        
                        
                        VStack(alignment: .leading) {
                            Text(" ")
                            Text(" ")
                            Text(" ")
                        }
                        .font(.aggro(.light, size: 20))
                        
                        Spacer(minLength: 24)
                    }
                    .opacity(0)
                    
                    
                    Image(Literals.sikSikE)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .offset(x: -40)
                    
                    Spacer()
                    Spacer()
                    
                    Button("") {
                        
                    }
                    .buttonStyle(.rounded(.appPrimary))
                    .opacity(0)
                }
                .padding(.horizontal, 20)
                
                Circle()
                    .trim(from: isAnimating ? 0 : 1, to: 1)
                    .stroke(Color.appPrimary, lineWidth: 6)
                    .frame(width: gr.size.width, height: gr.size.height)
                    .scaleEffect(2)
                    .offset(x: 0, y: -150)
                    .clipped()
                    .animation(.easeOut(duration: 2), value: isAnimating)
                    .onAppear {
                        self.isAnimating = true
                    }
            }
        }
        .background(Color.mainBg)
    }
}

#Preview {
    SplashView()
}
