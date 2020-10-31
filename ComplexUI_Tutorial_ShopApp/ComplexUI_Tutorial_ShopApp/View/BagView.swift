//
//  BagView.swift
//  ComplexUI_Tutorial_ShopApp
//
//  Created by 조종운 on 2020/10/31.
//

import SwiftUI

struct BagView: View {
    
    var bagData: BagModel
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Color(.systemPink)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                
                Image(bagData.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(20)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }
            
            Text(bagData.title)
                .fontWeight(.heavy)
                .foregroundColor(.gray)
            
            Text(bagData.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        }
    }
}

