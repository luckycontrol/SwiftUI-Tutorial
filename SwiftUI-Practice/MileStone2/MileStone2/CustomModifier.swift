//
//  CustomModifier.swift
//  MileStone2
//
//  Created by 조종운 on 2021/03/10.
//

import SwiftUI

struct CustomModifier: View {
    var body: some View {
//        Text("Hello World!")
//            .titleStyle()
        
        Color.blue
            .frame(width: 300, height: 200)
            .waterMark(with: "Hello World!")
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func waterMark(with text: String) -> some View {
        self.modifier(WaterMark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct WaterMark: ViewModifier {
    
    let text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}
