//
//  Animation.swift
//  NavigationBarPractice
//
//  Created by 조종운 on 2020/09/11.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct AnimationPractice: View {
    
    @State private var blurRadius: Bool = false
    @State private var littleCircle: CGFloat = 1
    @State private var middleCircle: CGFloat = 1
    
    var body: some View {
        Button(action: { self.blurRadius.toggle() }) {
            Text("Click!")
        }
        .padding(40)
        .background(Color.pink)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(littleCircle)
                .opacity(Double(2 - littleCircle))
                .animation(Animation.easeInOut(duration: 1).repeatForever())
        )
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(middleCircle)
                .opacity(Double(2 - middleCircle))
                .animation(Animation.easeInOut(duration: 1).repeatForever())
        )
        .onAppear {
            self.littleCircle = 1.5
            self.middleCircle = 2
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice()
    }
}
