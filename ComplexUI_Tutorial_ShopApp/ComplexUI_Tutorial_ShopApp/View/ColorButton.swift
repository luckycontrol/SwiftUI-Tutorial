//
//  ColorButton.swift
//  ComplexUI_Tutorial_ShopApp
//
//  Created by 조종운 on 2020/10/31.
//

import SwiftUI

struct ColorButton: View {
    
    @Binding var selectedColor: Color
    
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            
            Circle()
                .stroke(Color.black.opacity(selectedColor == color ? 1 : 0), lineWidth: 1)
                .frame(width: 30, height: 30)
        }
        .onTapGesture {
            withAnimation {
                selectedColor = color
            }
        }
    }
}
