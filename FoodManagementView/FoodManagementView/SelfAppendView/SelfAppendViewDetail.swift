//
//  SelfAppendViewDetail.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/21.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelfAppendViewDetail: View {
    
    @State var selectedFoodType: String = "과일"
    
    @State var selectedFoodList: [SelectedFood] = []
    
    @State var selectedFoodTypeList: [FoodCategory] = [foodcategory[0], foodcategory[1], foodcategory[2], foodcategory[3], foodcategory[4], foodcategory[5], foodcategory[6], foodcategory[7], foodcategory[8]]
    
    @State var selectedFoodTypeCount: Int = 1
    
    @State var selectedFoodTypeLeft: Int = 4
    
    @Binding var food: SelectedFood
    
    @Binding var directAppend: Bool
    
    @Binding var normalAppend: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text("식자재 추가")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                AppendCategoryView(directAppend: $directAppend)
                
                Text("카테고리")
                    .font(.title)
                    .padding()
                
                SelectCategoryScrollView(selectedFoodType: $selectedFoodType, selectedFoodTypeList: $selectedFoodTypeList, selectedFoodTypeCount: $selectedFoodTypeCount, selectedFoodTypeLeft: $selectedFoodTypeLeft)
                
                FoodTypeImageList(selectedFoodTypeList: $selectedFoodTypeList, selectedFoodTypeCount: $selectedFoodTypeCount, selectedFoodTypeLeft: $selectedFoodTypeLeft, food: $food, normalAppend: $normalAppend)
                
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .accentColor(.black)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SelfAppendViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendViewDetail(food: .constant(SelectedFood(foodType: "", foodname: "")), directAppend: .constant(false), normalAppend: .constant(false))
    }
}
