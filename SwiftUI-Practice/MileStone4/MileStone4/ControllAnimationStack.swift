//
//  ControllAnimationStack.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/15.
//

import SwiftUI

struct ControllAnimationStack: View {
    
    @State private var enabled = false
    
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(.default)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 5, damping: 1))
    }
}

