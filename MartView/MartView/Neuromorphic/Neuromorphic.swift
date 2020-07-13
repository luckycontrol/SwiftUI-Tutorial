//
//  Neuromorpic.swift
//  MartView
//
//  Created by 조종운 on 2020/07/01.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct Neuromorphic: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FoodDetailModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 2, x: 1, y: 1)
            .shadow(color: Color.white.opacity(0.3), radius: 2, x: -1, y: -1)
    }
}

struct Neuromorphic_Previews: PreviewProvider {
    static var previews: some View {
        Neuromorphic()
    }
}
