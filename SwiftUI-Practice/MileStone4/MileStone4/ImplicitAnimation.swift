//
//  ImplicitAnimation.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/15.
//

import SwiftUI

struct ImplicitAnimation: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap me") {
            
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1.5)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            animationAmount = 2
        }
//        .animation(
//            Animation.easeInOut(duration: 0.5)
//                .repeatCount(3, autoreverses: true)
//        )
//        .animation(
//            Animation.easeInOut(duration: 2)
//                .delay(1)
//        )
//        .animation(.easeInOut(duration: 2))
//        .animation(.default)
//        .animation(.easeOut)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 5))
//        .blur(radius: (animationAmount - 1) * 3)
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
