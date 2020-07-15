//
//  SelectCategoryView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelectCategoryView: View {
    
    let foodType: [String] = ["과일", "채소", "정육", "유제품", "해산물"]
    
    @State var selectedFoodType: String = "과일"
    
    @State var selectedFoodTypeList: [String] = ["딸기", "바나나", "키위", "사과", "블루베리", "감", "귤", "수박", "오렌지"]
    
    @State var selectedFoodTypeCount: Int = 1
    @State var selectedFoodTypeLeft: Int = 4
    
    var body: some View {
        VStack(alignment: .center) {
            Text("추가")
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(foodType, id: \.self) { foodType in
                        Button(action: {
                            withAnimation {
                                self.selectedFoodType = foodType
                                self.getFoodTypeCount(foodType)
                            }
                        }) {
                            HStack {
                                Text(foodType)
                                .foregroundColor(foodType == self.selectedFoodType ? .white : .black)
                                .fontWeight(foodType == self.selectedFoodType ? .bold : .none)
                            }
                            .frame(width: 100, height: 30)
                            .background(foodType == self.selectedFoodType ? Color("foodcategory").opacity(0.8) : Color.gray.opacity(0.15))
                            .cornerRadius(15)
                        }
                    }
                }
            }.padding(.bottom, 15)
            
            VStack(alignment: .leading) {
                ForEach(0...self.selectedFoodTypeCount, id: \.self) { row in
                    HStack {
                        if row == self.selectedFoodTypeCount {
                            ForEach(row * 5..<row * 5 + self.selectedFoodTypeLeft, id: \.self) { index in
                                FoodTypeImageView(foodType: self.selectedFoodTypeList[index])
                            }
                        } else {
                            ForEach(row * 5..<row * 5 + 5, id: \.self) { index in
                                FoodTypeImageView(foodType: self.selectedFoodTypeList[index])
                            }
                        }
                    }
                }
            }
        }
        .padding([.vertical, .horizontal], 15)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .accentColor(.black)
    }
    
    func getFoodTypeCount(_ foodType: String) {
        
        self.selectedFoodTypeList = []
        var foodTypeCount: Int = 0
        
        for category in foodcategory {
            if category.foodType == foodType {
                foodTypeCount += 1
                self.selectedFoodTypeList.append(category.foodname)
            }
        }
        
        self.selectedFoodTypeCount = foodTypeCount / 5
        self.selectedFoodTypeLeft = foodTypeCount % 5
    }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryView()
    }
}
