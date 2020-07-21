//
//  FoodTypeImageList.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/21.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct FoodTypeImageList: View {
    
    @Binding var selectedFoodTypeList: [FoodCategory]
    
    @Binding var selectedFoodTypeCount: Int
    
    @Binding var selectedFoodTypeLeft: Int
    
    @Binding var food: SelectedFood
    
    @Binding var normalAppend: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0...self.selectedFoodTypeCount, id: \.self) { row in
                HStack {
                    if row == self.selectedFoodTypeCount {
                        ForEach(row * 5..<row * 5 + self.selectedFoodTypeLeft, id: \.self) { index in
                            FoodTypeImageView(foodType: self.selectedFoodTypeList[index], food: self.$food, normalAppend: self.$normalAppend)
                        }
                    } else {
                        ForEach(row * 5..<row * 5 + 5, id: \.self) { index in
                            FoodTypeImageView(foodType: self.selectedFoodTypeList[index], food: self.$food, normalAppend: self.$normalAppend)
                        }
                    }
                }
            }
        }.padding(.leading)
    }
}

struct FoodTypeImageList_Previews: PreviewProvider {
    static var previews: some View {
        FoodTypeImageList(selectedFoodTypeList: .constant([foodcategory[0], foodcategory[1], foodcategory[2], foodcategory[3], foodcategory[4], foodcategory[5], foodcategory[6], foodcategory[7], foodcategory[8]]), selectedFoodTypeCount: .constant(1), selectedFoodTypeLeft: .constant(4), food: .constant(SelectedFood(foodType: "", foodname: "")), normalAppend: .constant(false))
    }
}
