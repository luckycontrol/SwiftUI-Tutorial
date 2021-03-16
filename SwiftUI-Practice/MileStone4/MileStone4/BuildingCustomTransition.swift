//
//  BuildingCustomTransition.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/16.
//

import SwiftUI

struct BuildingCustomTransition: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: 90, anchor: .top, opacity: 0),
            identity: CornerRotateModifier(amount: 0, anchor: .bottom, opacity: 1)
        )
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    let opacity: Double
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .opacity(opacity)
    }
}
