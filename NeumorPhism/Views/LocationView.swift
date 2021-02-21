//
//  LocationView.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-21.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.background)
                .frame(width: 150, height: 30)
                .shadow(color: Color.lightShadow, radius: 2, x: -2, y: -2)
                .shadow(color: Color.darkShadow, radius: 2, x: 2, y: 2)
            
            HStack {
                LocationPinAnimatedView()

                Text("Toronto, Canada")
                    .font(.caption)
            }
            .padding(.trailing, 8)
        }
        .padding(.leading, 8)
    }
}

struct LocationPinAnimatedView: View {
    @State private var squash_and_stretch = false
    @State private var jump = false
    @State private var displayRipple = false
    @State private var dismissRipple = false
    
    var body: some View {
        ZStack {
            Image("pin")
                .resizable()
                .frame(width: 13, height: 18, alignment: .center)
                .scaleEffect(x: 1, y: squash_and_stretch ? 1.1 : 0.5, anchor: .bottom)
                .offset(y: jump ? 0 : -30)
                .animation(Animation.easeInOut(duration: 0.25).delay(0.5).repeatCount(1, autoreverses: true))
                .onAppear() {
                    self.squash_and_stretch.toggle()
                    
                    withAnimation(Animation.easeInOut(duration: 0.5).delay(0.2).repeatCount(1, autoreverses: true)) {
                        self.jump.toggle()
                    }
            }
            
            Circle()
                .strokeBorder(lineWidth: displayRipple ? 1 : 5)
                .frame(width: 30, height: 30)
                .scaleEffect(displayRipple ? 1 : 0)
                .foregroundColor(Color("LightAssets"))
                .opacity(displayRipple ? 0 : 1)
                .offset(y: 0)
                .animation(Animation.easeInOut(duration: 1).delay(0.2).repeatForever(autoreverses: false))
                .onAppear() {
                    self.displayRipple.toggle()
                
                    withAnimation(Animation.easeInOut(duration: 1).delay(2)) {
                         self.dismissRipple.toggle()
                    }  
            }
            
        }
    }
}
