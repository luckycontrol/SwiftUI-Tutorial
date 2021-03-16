//
//  AnimatingGesture2.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/16.
//

import SwiftUI

struct AnimatingGesture2: View {
    
    let letters = Array("Hello SwiftUI")
    
    @State private var enabled = false
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack {
            ForEach(0 ..< letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? Color.blue : Color.red)
                    .offset(dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}
