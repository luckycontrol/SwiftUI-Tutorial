//
//  Direct_SelectCategory.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/21.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct Direct_SelectCategory: View {
    
    @Binding var foodcategory: String
    
    let foodTypeList: [String] = ["과일", "채소", "정육", "유제품", "해산물"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("식자재 종류")
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(foodTypeList, id: \.self) { category in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 100)
                                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                                .shadow(color: .white, radius: -8, x: -3, y: -3)
                            
                            Button(action: {
                                self.foodcategory = category
                            }) {
                                VStack {
                                    Image(self.foodcategory == category ? category + "선택" : category)
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                    
                                    Text(category)
                                }
                            }
                        }
                    }
                }.padding([.horizontal, .vertical], 15)
            }
        }
    }
}

struct Direct_SelectCategory_Previews: PreviewProvider {
    static var previews: some View {
        Direct_SelectCategory(foodcategory: .constant(""))
    }
}
