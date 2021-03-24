//
//  DrawingGroupPractice.swift
//  MileStone7
//
//  Created by 조종운 on 2021/03/24.
//

import SwiftUI

struct DrawingGroupPractice: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct DrawingGroupPractice_Previews: PreviewProvider {
    static var previews: some View {
        DrawingGroupPractice()
    }
}
