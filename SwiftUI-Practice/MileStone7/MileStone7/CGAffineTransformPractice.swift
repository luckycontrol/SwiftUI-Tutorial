//
//  CGAffineTransformPractice.swift
//  MileStone7
//
//  Created by 조종운 on 2021/03/24.
//

import SwiftUI

struct CGAffineTransformPractice: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(Color.red, lineWidth: 1)
                .fill(Color.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct Flower: Shape {
    
    // 꽃잎이 중앙으로부터 얼마나 떨어져 있을건지..
    var petalOffset: Double = -20
    
    // 각 꽃잎의 너비
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 12) {
            // 꽃잎을 반복문 내의 값만큼 회전시킨다.
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // 꽃잎의 위치를 뷰의 중앙에 놓는다.
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // 속성값들을 사용하여 꽃잎을 만든다.
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            
            // rotation과 position을 꽃잎에 적용한다.
            let rotatedPetal = originalPetal.applying(position)
            
            // path에 rotatedPetal을 추가한다.
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct CGAffineTransformPractice_Previews: PreviewProvider {
    static var previews: some View {
        CGAffineTransformPractice()
    }
}
