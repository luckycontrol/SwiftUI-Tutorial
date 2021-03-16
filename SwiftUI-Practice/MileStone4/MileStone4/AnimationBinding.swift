//
//  AnimationBinding.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/15.
//

import SwiftUI

struct AnimationBinding: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Stepper("스케일", value: $animationAmount.animation(
                Animation.easeInOut(duration: 0.5)
                    .repeatCount(3, autoreverses: true)
            ), in: 1 ... 10)
            
            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}
