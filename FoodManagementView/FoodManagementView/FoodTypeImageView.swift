//
//  FoodTypeImageView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct FoodTypeImageView: View {
    
    var foodType: String
    
    var body: some View {
        VStack {
            Image(foodType)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
            
            Text(foodType)
            
        }
    }
}

struct FoodTypeImageView_Previews: PreviewProvider {
    static var previews: some View {
        FoodTypeImageView(foodType: "사과")
    }
}
