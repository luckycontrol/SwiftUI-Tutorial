//
//  ShowAndHideTransition.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/16.
//

import SwiftUI

struct ShowAndHideTransition: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .slide))
                    .transition(.pivot)
            }
        }
    }
}
