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
    
    @Binding var directAppend: Bool
    
    @Binding var normalAppend: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Color(.white)
            
            VStack {
                HStack {
                    Text("식자재 추가")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    
                    Spacer()
                }
                
                AppendCategoryView(directAppend: $directAppend)
                
                HStack {
                    Text("카테고리")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.leading, .top])
                    
                    Spacer()
                }
                
                SelectCategoryScrollView(selectedFoodType: $selectedFoodType, selectedFoodTypeList: $selectedFoodTypeList, selectedFoodTypeCount: $selectedFoodTypeCount, selectedFoodTypeLeft: $selectedFoodTypeLeft)
                
                FoodTypeImageList(selectedFoodTypeList: $selectedFoodTypeList, selectedFoodTypeCount: $selectedFoodTypeCount, selectedFoodTypeLeft: $selectedFoodTypeLeft, normalAppend: $normalAppend)
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Text("식자재 추가")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color("foodcategory").opacity(0.7))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }.padding()
                
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .accentColor(.black)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SelfAppendViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendViewDetail(directAppend: .constant(false), normalAppend: .constant(false))
    }
}
