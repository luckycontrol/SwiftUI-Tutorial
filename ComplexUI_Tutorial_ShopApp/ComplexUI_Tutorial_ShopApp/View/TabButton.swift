//
//  TabButton.swift
//  ComplexUI_Tutorial_ShopApp
//
//  Created by 조종운 on 2020/10/31.
//

import SwiftUI

struct TabButton: View {
    
    @Binding var selectedTab: String
    
    let title: String
    
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = title
            }
        }, label: {
            VStack {
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundColor(selectedTab == title ? .black : .gray)
                
                if selectedTab == title {
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 40, height: 4)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            }
            .frame(width: 100)
        })
    }
}
