//
//  SelectCategoryView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelfAppendView: View {
    
    @State var directAppend = false
    
    @State var normalAppend = false
    
    @State var food: SelectedFood = SelectedFood(foodType: "", foodname: "")
    
    var body: some View {
        ZStack {
            
            SelfAppendViewDetail(food: $food, directAppend: $directAppend, normalAppend: $normalAppend)
        
            SelfAppendViewDirect(directAppend: $directAppend)
            
            SelfAppendViewNormal(food: food, normalAppend: $normalAppend)
        }
         
    }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendView()
    }
}
