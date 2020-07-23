//
//  SelectCategoryScrollView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/16.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelectCategoryScrollView: View {
    
    let foodType: [String] = ["과일", "채소", "정육", "유제품", "해산물"]
    
    @Binding var selectedFoodType: String
    
    @Binding var selectedFoodTypeList: [FoodCategory]
    
    @Binding var selectedFoodTypeCount: Int
    
    @Binding var selectedFoodTypeLeft: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                Button(action: {
                    withAnimation {
                        self.selectedFoodType = "과일"
                        self.getFoodTypeCount("과일")
                    }
                }) {
                    Text("과일")
                        .foregroundColor(self.selectedFoodType == "과일" ? .white : .black)
                        .fontWeight(self.selectedFoodType == "과일" ? .bold : .none)
                        .frame(width: 100, height: 30)
                        .background(self.selectedFoodType == "과일" ? Color("foodcategory").opacity(0.8) : Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }
                
                Button(action: {
                    withAnimation {
                        self.selectedFoodType = "채소"
                        self.getFoodTypeCount("채소")
                    }
                }) {
                    Text("채소")
                        .foregroundColor(self.selectedFoodType == "채소" ? .white : .black)
                        .fontWeight(self.selectedFoodType == "채소" ? .bold : .none)
                        .frame(width: 100, height: 30)
                        .background(self.selectedFoodType == "채소" ? Color("foodcategory").opacity(0.8) : Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }
                
                Button(action: {
                    withAnimation {
                        self.selectedFoodType = "정육"
                        self.getFoodTypeCount("정육")
                    }
                }) {
                    Text("정육")
                        .foregroundColor(self.selectedFoodType == "정육" ? .white : .black)
                        .fontWeight(self.selectedFoodType == "정육" ? .bold : .none)
                        .frame(width: 100, height: 30)
                        .background(self.selectedFoodType == "정육" ? Color("foodcategory").opacity(0.8) : Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }
                
                Button(action: {
                    withAnimation {
                        self.selectedFoodType = "유제품"
                        self.getFoodTypeCount("유제품")
                    }
                }) {
                    Text("유제품")
                        .foregroundColor(self.selectedFoodType == "유제품" ? .white : .black)
                        .fontWeight(self.selectedFoodType == "유제품" ? .bold : .none)
                        .frame(width: 100, height: 30)
                        .background(self.selectedFoodType == "유제품" ? Color("foodcategory").opacity(0.8) : Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }
                
                Button(action: {
                    withAnimation {
                        self.selectedFoodType = "해산물"
                        self.getFoodTypeCount("해산물")
                    }
                }) {
                    Text("해산물")
                        .foregroundColor(self.selectedFoodType == "해산물" ? .white : .black)
                        .fontWeight(self.selectedFoodType == "해산물" ? .bold : .none)
                        .frame(width: 100, height: 30)
                        .background(self.selectedFoodType == "해산물" ? Color("foodcategory").opacity(0.8) : Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }
            }
            .padding([.horizontal, .vertical])
        }
    }
    
    func getFoodTypeCount(_ foodType: String) {
        
        self.selectedFoodTypeList = []
        var foodTypeCount: Int = 0
        
        for category in foodcategory {
            if category.foodType == foodType {
                foodTypeCount += 1
                self.selectedFoodTypeList.append(category)
            }
        }
        
        self.selectedFoodTypeCount = foodTypeCount / 5
        self.selectedFoodTypeLeft = foodTypeCount % 5
    }
}

struct SelectCategoryScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryScrollView(selectedFoodType: .constant("과일"), selectedFoodTypeList: .constant([foodcategory[0], foodcategory[1], foodcategory[2], foodcategory[3], foodcategory[4], foodcategory[5], foodcategory[6], foodcategory[7], foodcategory[8]]), selectedFoodTypeCount: .constant(1), selectedFoodTypeLeft: .constant(4))
    }
}
