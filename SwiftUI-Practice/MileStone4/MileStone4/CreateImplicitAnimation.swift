//
//  CreateImplicitAnimation.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/15.
//

import SwiftUI

struct CreateImplicitAnimation: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tab me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 2)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct CreateImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CreateImplicitAnimation()
    }
}
