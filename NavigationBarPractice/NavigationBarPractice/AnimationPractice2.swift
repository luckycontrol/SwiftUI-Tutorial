//
//  AnimationPractice2.swift
//  NavigationBarPractice
//
//  Created by 조종운 on 2020/09/11.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct AnimationPractice2: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        SpiroSquare()
            .frame(width: 200, height: 200)
            .foregroundColor(.blue)
    }
}

struct SpiroSquare: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rotation = 5
        let amount = .pi / CGFloat(rotation)
        let transform = CGAffineTransform(rotationAngle: amount)
        
        for _ in 0 ..< rotation {
            path = path.applying(transform)
            path.addRect(CGRect(x: -rect.width / 2, y: -rect.height / 2, width: rect.width, height: rect.height))
        }
        return path
    }
}

struct AnimationPractice2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice2()
    }
}
